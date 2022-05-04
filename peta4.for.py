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

cols = twocol                           #   onecol or twocol
asp = 1.5                                #   vertical aspect ratio
barwidth = 0.9                          #   main thickness of bar
size = 10000                            #   how many slices
time_array = np.linspace(0,1,size)      #   plotting space
maxtheory = 10                          #    how many total theory columns did we allow?
rough_number_of_functions = 6           #   less info, middle sub-bar
rougher_number_of_functions = 5         #   even less, upper sub-bar

xmx = 2     #1
ymx = 5      #  5

#=============== cols params ==========================

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

#=============== misc =================================

width = cols
height = asp*cols 

#=============== plot setup =================================

fig, axs = plt.subplots(5,2,sharex = True, sharey = True, gridspec_kw = {'wspace':0.1, 'hspace':0.2}, figsize = (width,height))
#fig, axs = plt.subplots(2,5, gridspec_kw = {'wspace':0, 'hspace':-0.2})
#sp = fig.add_subplot(111)

#=============== node loop =================================

plt.draw()

#plt.savefig('kernels-2.pdf',bbox_inches = 'tight',pad_inches=0)
plt.savefig('peta4.for.png',bbox_inches = 'tight',dpi = 900)


for x in range(xmx):
    for y in range(ymx):
        node = y*xmx+x

        #=============== files =================================

        kernel_files = os.listdir("bin/node-" + str(node) + "/stats/")

        ticklabels=[]
        for filename in kernel_files:
            if 'kernel' in filename:
                list_digits = re.findall(r'\d+', filename)
                ticklabels.append(list_digits[0])

        kernel_files = [x for _,x in sorted(zip(list(map(int,ticklabels)),kernel_files))]
        ticklabels = [x for _,x in sorted(zip(list(map(int,ticklabels)),ticklabels))]
        ticklabels = list(map(lambda x : r"\texttt{"+ x +"}", ticklabels))

        def make_np(filename):
            return pd.read_csv('bin/node-' + str(node) + '/stats/'+filename).to_numpy()

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

        endpt = 256*(1+acttheory)
        silly = ListedColormap(newcolors[0:endpt:,:],name='silly')

        #====================== bar width and chart geometry ==============

        propunit = 1.

        '''propunit = (height*total_time/width)/number_of_kernels'''
        '''point_hei = height * fig.dpi'''
        point_hei = axs[y,x].get_window_extent().transformed(fig.dpi_scale_trans.inverted()).height*fig.dpi
        line_width = 0.8*point_hei/number_of_kernels
        '''
        x1,x2,y1,y2=plt.axis()
        xrange = x2-x1
        yrange = y2-y1
        bar = barwidth*xrange/number_of_kernels
        line_width = (bar*(point_hei/yrange))*0.8
        '''

        '''
        propunit = (height*total_time/width)/number_of_kernels
        point_hei = height*72
        x1,x2,y1,y2=plt.axis()
        xrange = x2-x1
        yrange = y2-y1
        bar = barwidth*xrange/number_of_kernels
        line_width = (bar*(point_hei/yrange))*0.8
        '''

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
            line = axs[y,x].add_collection(lc)

            kernel_array = np.full(size,(kernel-0.7*(1-0.75))*propunit)    #   this is for the horizontal line position
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
            line = axs[y,x].add_collection(lc)

            kernel_array = np.full(size,(kernel-0.7*(1-0.5))*propunit)    #   this is for the horizontal line position
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
            line = axs[y,x].add_collection(lc)

        #=================== limits ======================

        axs[y,x].set_xlim(0., total_time)
        axs[y,x].set_yticks(list(propunit*np.array(list(range(0,number_of_kernels)))))
        axs[y,x].set_yticklabels(ticklabels)
        axs[y,x].set_ylim(-0.5*propunit, (number_of_kernels-0.5)*propunit)
        axs[y,x].tick_params(axis = 'y',labelsize = 6)

        #=================== end admin to label the plot ======================

        title_string = r"Node " + str(node)
        axs[y,x].set_title(title_string)
        #title_string = r"Node: \texttt{"+socket.gethostname()+"}"
        #axs[node].set_ylabel(r"\texttt{\${}KernelID}")
        #axs[node].set_xlabel(r"Wallclock time/s")

#=================== plt draw ======================

fig.text(0.5, 0.04, r"Wallclock time/s", ha='center')
fig.text(0.0, 0.5, r"Core (\texttt{\${}KernelID})", va='center', rotation='vertical')

print('drawing plot')
plt.draw()

#plt.savefig('kernels-2.pdf',bbox_inches = 'tight',pad_inches=0)
plt.savefig('peta4.for.png',bbox_inches = 'tight',dpi = 900)

sys.exit()
