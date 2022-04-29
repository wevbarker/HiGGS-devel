#!/usr/bin/env python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import matplotlib as mpl
from matplotlib import cm
from matplotlib.collections import LineCollection
from matplotlib.colors import ListedColormap, BoundaryNorm
import os
from os.path import exists
import shutil
import subprocess
import socket
import re   #   for extracting kernel numbers from strings
from matplotlib import cm
from matplotlib.colors import ListedColormap, LinearSegmentedColormap

#================ plot params and TeX setup ======================

mpl.use('Agg')

plt.rc('text',usetex = True)

plt.rc('text.latex', preamble = 
r'\usepackage[notextcomp]{stix}'+
r'\usepackage{amsmath}'+
r'\usepackage{etoolbox}'+
r'\usepackage{bm}')

mpl.rcParams['font.family'] = 'serif'

# we want the width always to be a single or double column, we can get this from revtex using
# \uselengthunit{in}\printlength{\linewidth} ---> 3.40457
# \uselengthunit{in}\printlength{\textwidth} ---> 7.05826
# mpl like to use inches

onecol = 3.40457
twocol = 7.05826

#=============== tuning params ==========================

cols = onecol                           #   onecol or twocol
asp = 1.5                                #   vertical aspect ratio
barwidth = 0.9                          #   main thickness of bar
size = 10000                            #   how many slices
time_array = np.linspace(0,1,size)      #   plotting space
maxtheory = 10                          #    how many total theory columns did we allow?
rough_number_of_functions = 6
rougher_number_of_functions = 5

#=============== files =================================
'''
output_files = os.listdir("bin/stats")
sample_files = os.listdir("bin/samples")
filled_files = [ filename for filename in output_files if sum(1 for line in open('bin/stats/'+filename)) > 3 and 'kernel' in filename]

new_files = list(set(filled_files)-set(sample_files))
old_files = list(set(filled_files)-set(new_files))
rep_files = [ filename for filename in old_files if sum(1 for line in open('bin/stats/'+filename)) > sum(1 for line in open('bin/samples/'+filename)) ]

for filename in new_files:
    shutil.copyfile('bin/stats/'+filename,'bin/samples/'+filename)

for filename in rep_files:
    shutil.copyfile('bin/stats/'+filename,'bin/samples/'+filename)
'''
kernel_files = os.listdir("bin/stats/")

ticklabels=[]
for filename in kernel_files:
    if 'kernel' in filename:
        list_digits = re.findall(r'\d+', filename)
        ticklabels.append(list_digits[0])

kernel_files = [x for _,x in sorted(zip(list(map(int,ticklabels)),kernel_files))]
ticklabels = [x for _,x in sorted(zip(list(map(int,ticklabels)),ticklabels))]
ticklabels = list(map(lambda x : r"\texttt{"+ x +"}", ticklabels))

def make_np(filename):
    return pd.read_csv('bin/stats/'+filename).to_numpy()

#   a list, not np, of np arrays containing all data with headers
all_kernel_data = list(map(make_np,kernel_files))

#   all numerical columns, no headers, with the start times
def start_cols(array):
    return array[1:,::2]

#   to find the start and end of the whole survey
start_times = np.concatenate(list(map(start_cols,all_kernel_data)))
start_times = start_times.astype('float')
s_times = np.copy(start_times)
start_times[start_times == 0.] = 'nan'
start_time = np.nanmin(start_times)
stop_time = np.nanmax(start_times)
total_time=stop_time-start_time

time_array = np.linspace(0,total_time,size)    #   plotting space

number_of_functions = int(list(np.shape(all_kernel_data[0]))[1]/(2*maxtheory))
number_of_kernels = len(all_kernel_data)

acttheory = np.floor(np.max(np.nonzero(np.sum(s_times,axis=0)))/number_of_functions).astype(int)

#=============== colourmap =============================

greys = cm.get_cmap('Greys', 120)
blues = cm.get_cmap('Blues', 120)
greens = cm.get_cmap('Greens', 120)
oranges = cm.get_cmap('Oranges', 120)
rdpu = cm.get_cmap('RdPu', 120)
gnbu = cm.get_cmap('GnBu', 120)
pnbugn = cm.get_cmap('PuBuGn', 120)
purd = cm.get_cmap('PuRd', 120)
orrd = cm.get_cmap('OrRd', 120)
purples = cm.get_cmap('Purples', 120)
ylgn = cm.get_cmap('YlGn', 120)

newcolors = greys(np.linspace(0, 1, 256))
newcolors = np.append(newcolors,blues(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,greens(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,oranges(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,rdpu(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,gnbu(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,pnbugn(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,ylgn(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,orrd(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,purples(np.linspace(0, 1, 256)),axis=0)
newcolors = np.append(newcolors,purd(np.linspace(0, 1, 256)),axis=0)

endpt = 256*(1+acttheory)
silly = ListedColormap(newcolors[0:endpt:,:],name='silly')

#====================== bar width and chart geometry ==============

width = cols
height = asp*cols 
#height = (1.*number_of_kernels+2.)*0.5

propunit = (height*total_time/width)/number_of_kernels

fig = plt.figure(1,figsize = (width,height))
sp = fig.add_subplot(111)

point_hei = height*72
x1,x2,y1,y2=plt.axis()
xrange = x2-x1
yrange = y2-y1
bar = barwidth*xrange/number_of_kernels
line_width = (bar*(point_hei/yrange))*0.8

#==================== construct the data ===========================

for kernel in range(0,number_of_kernels):
    print("plotting data from kernel ",kernel)
    kernel_data = all_kernel_data[kernel]

    kernel_array = np.full(size,kernel*propunit)    #   this is for the horizontal line position
    function_data = np.zeros(size)  #   by  default, assume the kernel is idle the whole time
    for theory in range(0,acttheory+1):
        for function_number in range(1,rougher_number_of_functions+1):
            function_times = kernel_data[1::,(theory*2*number_of_functions+2*function_number-2):(theory*2*number_of_functions+2*function_number):]    #   just take the two columns that affect that function in that theory
            for row in function_times:
                if row[0]>0:
                    t1=int(np.floor(size*(row[0]-start_time)/total_time))
                    t2=int(np.floor(size*(row[0]+row[1]-start_time)/total_time))+1
                    function_data[t1 : t2] = ((theory*2*number_of_functions+2*function_number-2)/((acttheory+1)*2*number_of_functions))

    ##   superior method using collections
    points = np.array([time_array, kernel_array]).T.reshape(-1, 1, 2)
    segments = np.concatenate([points[:-1], points[1:]], axis=1)

    # Create a continuous norm to map from data points to colors
    norm = plt.Normalize(0., 1.)
    lc = LineCollection(segments, cmap=silly, norm=norm)

    # Set the values used for colormapping
    lc.set_array(function_data)
    lc.set_linewidth(line_width)
    line = sp.add_collection(lc)

    kernel_array = np.full(size,(kernel-0.5*(1-0.75))*propunit)    #   this is for the horizontal line position
    function_data = np.zeros(size)  #   by  default, assume the kernel is idle the whole time
    for theory in range(0,acttheory+1):
        for function_number in range(1,rough_number_of_functions+1):
            function_times = kernel_data[1::,(theory*2*number_of_functions+2*function_number-2):(theory*2*number_of_functions+2*function_number):]    #   just take the two columns that affect that function in that theory
            for row in function_times:
                if row[0]>0:
                    t1=int(np.floor(size*(row[0]-start_time)/total_time))
                    t2=int(np.floor(size*(row[0]+row[1]-start_time)/total_time))+1
                    function_data[t1 : t2] = ((theory*2*number_of_functions+2*function_number-2)/((acttheory+1)*2*number_of_functions))

    ##   superior method using collections
    points = np.array([time_array, kernel_array]).T.reshape(-1, 1, 2)
    segments = np.concatenate([points[:-1], points[1:]], axis=1)

    # Create a continuous norm to map from data points to colors
    norm = plt.Normalize(0., 1.)
    lc = LineCollection(segments, cmap=silly, norm=norm)

    # Set the values used for colormapping
    lc.set_array(function_data)
    lc.set_linewidth(0.75*line_width)
    line = sp.add_collection(lc)

    kernel_array = np.full(size,(kernel-0.5*(1-0.5))*propunit)    #   this is for the horizontal line position
    function_data = np.zeros(size)  #   by  default, assume the kernel is idle the whole time
    for theory in range(0,acttheory+1):
        for function_number in range(1,number_of_functions+1):
            function_times = kernel_data[1::,(theory*2*number_of_functions+2*function_number-2):(theory*2*number_of_functions+2*function_number):]    #   just take the two columns that affect that function in that theory
            for row in function_times:
                if row[0]>0:
                    t1=int(np.floor(size*(row[0]-start_time)/total_time))
                    t2=int(np.floor(size*(row[0]+row[1]-start_time)/total_time))+1
                    function_data[t1 : t2] = ((theory*2*number_of_functions+2*function_number-2)/((acttheory+1)*2*number_of_functions))
 
    ##   superior method using collections
    points = np.array([time_array, kernel_array]).T.reshape(-1, 1, 2)
    segments = np.concatenate([points[:-1], points[1:]], axis=1)

    # Create a continuous norm to map from data points to colors
    norm = plt.Normalize(0., 1.)
    lc = LineCollection(segments, cmap=silly, norm=norm)

    lc.set_array(function_data)
    lc.set_linewidth(0.5*line_width)
    line = sp.add_collection(lc)

#=================== limits ======================

sp.set_xlim(0., total_time)
sp.set_yticks(list(propunit*np.array(list(range(0,number_of_kernels)))))
sp.set_yticklabels(ticklabels)
sp.set_ylim(-0.5*propunit, (number_of_kernels-0.5)*propunit)

#=================== plt draw ======================

print('drawing plot')
plt.draw()

#=================== end admin to label the plot ======================

title_string = r"Node: \texttt{"+socket.gethostname()+"}"

sp.set_ylabel(r"\texttt{\${}KernelID}")
sp.set_xlabel(r"Wallclock time/s")
sp.set_title(title_string)
#plt.suptitle(r"\texttt{HiGGS} for HPC")

#plt.savefig('kernels-2.pdf',bbox_inches = 'tight',pad_inches=0)
plt.savefig('peta4_jobs_trace.png',bbox_inches = 'tight',pad_inches=0,dpi = 300)

sys.exit()
