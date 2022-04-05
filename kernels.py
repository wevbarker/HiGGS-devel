#!/usr/bin/env python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import matplotlib as mpl
from matplotlib import cm
import os
from os.path import exists
from matplotlib.collections import LineCollection
from matplotlib.colors import ListedColormap, BoundaryNorm

#   tex params
#plt.rcParams["figure.figsize"] = [7.50, 3.50]
#plt.rcParams["figure.autolayout"] = True

plt.rc('text',usetex = True)
#SMALL_SIZE=6
#plt.rc('font',size=SMALL_SIZE)

plt.rc('text.latex', preamble=r'\usepackage{stix}\usepackage{amsmath}\usepackage{etoolbox}\usepackage{bm} \newrobustcmd{\Planck}{{M_{\text{Pl}}}}')

mpl.rcParams['font.family'] = 'serif'

size=500   #   how many slices
time_array = np.linspace(0,1,size)    #   plotting space

ticklabels=[]
kernel_files = os.listdir("bin/stats")
for filename in kernel_files:
    print(filename)
    print(np.shape(pd.read_csv('bin/stats/'+filename).to_numpy()))
    for m in filename:
        if m.isdigit():
            ticklabels.append(m)

print(ticklabels)
sys.exit()

def make_np(filename):
    return pd.read_csv('bin/stats/'+filename).to_numpy()

all_kernel_data = list(map(make_np,kernel_files))
print(len(kernel_files))
print(len(all_kernel_data))

def start_cols(array):
    return array[1:,::2]

start_times = np.concatenate(list(map(start_cols,all_kernel_data)))
start_times = start_times.astype('float')
start_times[start_times == 0.] = 'nan'
start_time = np.nanmin(start_times)
stop_time = np.nanmax(start_times)
total_time=stop_time-start_time

time_array = np.linspace(0,total_time,size)    #   plotting space

number_of_functions = int(list(np.shape(all_kernel_data[1]))[1]/2)
number_of_kernels = len(all_kernel_data)


fig, axs = plt.subplots(sharex=True, sharey=True)
plt.draw()

for kernel in range(0,number_of_kernels):
    print("plotting data from kernel ",kernel)
    kernel_data = all_kernel_data[kernel]
    kernel_array = np.full(size,kernel)
    function_data = np.zeros(size)
    for function_number in range(1,number_of_functions+1):
        print("     plotting data for function ",function_number)
        function_times = kernel_data[1::,(2*function_number-2):(2*function_number):]
        print(kernel_data[0,(2*function_number-2):(2*function_number):])
        for row in function_times:
            if row[0]>0:
                t1=int(np.floor(size*(row[0]-start_time)/total_time))
                t2=int(np.floor(size*(row[0]+row[1]-start_time)/total_time))+1
                function_data[t1 : t2] = ((function_number)/(number_of_functions))

                ##   original method using scatter
                #plt.scatter(time_array,kernel_array,c=cm.OrRd((1/2)*np.tanh(function_data)+1/2),marker='|')

                ##   basic method using plot line
                #plt.plot(function_data)

                ##   superior method using collections
                points = np.array([time_array, kernel_array]).T.reshape(-1, 1, 2)
                segments = np.concatenate([points[:-1], points[1:]], axis=1)

                # Create a continuous norm to map from data points to colors
                norm = plt.Normalize(0., 1.)
                lc = LineCollection(segments, cmap='YlGn', norm=norm)
                # Set the values used for colormapping
                lc.set_array(function_data)
                lc.set_linewidth(10)
                line = axs.add_collection(lc)
                #axs[0].set_xlim(0., 10.)
                axs.set_xlim(0., total_time)
                axs.set_ylim(-0.5, number_of_kernels-0.5)
                plt.draw()

axs.set_ylabel(r"\texttt{\${}KernelID}")
axs.set_xlabel(r"Time/s")
axs.set_title(r"HiGGS for HPC monitor")

#plt.savefig('kernels-2.pdf',bbox_inches = 'tight',pad_inches=0)
plt.savefig('kernels-2.pdf')


sys.exit()
