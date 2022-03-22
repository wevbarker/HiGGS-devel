#!/usr/bin/env python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
from matplotlib import cm


plt.rcParams["figure.figsize"] = [7.50, 3.50]
plt.rcParams["figure.autolayout"] = True

headers = ['1', '2', '3', '4', '5', '6', '7', '8', '0']
df0 = pd.read_csv('bin/stats0.csv', names=headers).to_numpy()
df1 = pd.read_csv('bin/stats4.csv', names=headers).to_numpy()
df2 = pd.read_csv('bin/stats6.csv', names=headers).to_numpy()
df3 = pd.read_csv('bin/stats8.csv', names=headers).to_numpy()
df4 = pd.read_csv('bin/stats3.csv', names=headers).to_numpy()
df5 = pd.read_csv('bin/stats5.csv', names=headers).to_numpy()
df6 = pd.read_csv('bin/stats7.csv', names=headers).to_numpy()

size=1000

time = np.linspace(0,1,size)

core0 = np.zeros(size)
core1 = np.zeros(size)
core2 = np.zeros(size)
core3 = np.zeros(size)
core4 = np.zeros(size)
core5 = np.zeros(size)
core6 = np.zeros(size)

kernel0 = np.full(size,0)
kernel1 = np.full(size,1)
kernel2 = np.full(size,2)
kernel3 = np.full(size,3)
kernel4 = np.full(size,4)
kernel5 = np.full(size,5)
kernel6 = np.full(size,6)

start_time = df0[0,1]
end_time = df0[-1,1]
total_time=end_time-start_time

print(total_time)

for row in df0:
    t1=int(np.floor(size*(row[1]-start_time)/total_time))
    t2=int(np.floor(size*(row[1]+row[0]-start_time)/total_time))+1
    core0[t1 : t2] = 1

for row in df1:
    t1=int(np.floor(size*(row[1]-start_time)/total_time))
    t2=int(np.floor(size*(row[1]+row[0]-start_time)/total_time))+1
    core1[t1 : t2] = 1

for row in df2:
    t1=int(np.floor(size*(row[1]-start_time)/total_time))
    t2=int(np.floor(size*(row[1]+row[0]-start_time)/total_time))+1
    core2[t1 : t2] = 1

for row in df3:
    t1=int(np.floor(size*(row[1]-start_time)/total_time))
    t2=int(np.floor(size*(row[1]+row[0]-start_time)/total_time))+1
    core3[t1 : t2] = 1

for row in df4:
    t1=int(np.floor(size*(row[1]-start_time)/total_time))
    t2=int(np.floor(size*(row[1]+row[0]-start_time)/total_time))+1
    core4[t1 : t2] = 1

for row in df5:
    t1=int(np.floor(size*(row[1]-start_time)/total_time))
    t2=int(np.floor(size*(row[1]+row[0]-start_time)/total_time))+1
    core5[t1 : t2] = 1

for row in df6:
    t1=int(np.floor(size*(row[1]-start_time)/total_time))
    t2=int(np.floor(size*(row[1]+row[0]-start_time)/total_time))+1
    core5[t1 : t2] = 1

plt.scatter(time,kernel0,c=cm.OrRd((1/2)*core0+1/2),marker='|')
plt.scatter(time,kernel1,c=cm.OrRd((1/2)*core1+1/2),marker='|')
plt.scatter(time,kernel2,c=cm.OrRd((1/2)*core2+1/2),marker='|')
plt.scatter(time,kernel3,c=cm.OrRd((1/2)*core3+1/2),marker='|')
plt.scatter(time,kernel4,c=cm.OrRd((1/2)*core4+1/2),marker='|')
plt.scatter(time,kernel5,c=cm.OrRd((1/2)*core5+1/2),marker='|')
plt.scatter(time,kernel6,c=cm.OrRd((1/2)*core6+1/2),marker='|')


plt.savefig('kernels.pdf',bbox_inches = 'tight',pad_inches=0)


sys.exit()


import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import cplot 
import mpmath as mp
import sympy as sp
import scipy.special
import sys

plt.rcParams['text.usetex'] = True

xmax = 1.
#mass = 10.
phi = 1.

# functions for normal Klein--Gordon propagator

def s(z):
        return (np.imag(z)**2-np.real(z)**2)

def spacelike1(z,mass):
        return (1.-np.sign(s(z)))*((-1j*mass)/(8*np.pi*np.sqrt(-s(z))))*scipy.special.kv(1,mass*np.sqrt(-s(z)))


def timelike1(z,mass):
        return (mass/(8*np.pi*np.sqrt(s(z))))*scipy.special.hankel1(1,mass*np.sqrt(s(z)))

def propagator1(z,mass):
        return np.piecewise(z,[s(z)<0,s(z)>=0],[lambda z: spacelike1(z,mass), lambda z: timelike1(z,mass)]) 

# functions for ghost

def s2(z):
        return (np.imag(z)**2-np.real(z)**2)

def alpha(phi):
        return 1

def beta(phi):
        return 1

def mu(phi):
        return phi

def spacelike2(z,phi):
        return (1.-np.sign(s(z)))*((-1j*alpha(phi)*mu(phi))/(4*np.pi*beta(phi)**3*(alpha(phi)*np.sqrt(-s2(z))/beta(phi))))*scipy.special.kv(1,mu(phi)*alpha(phi)*np.sqrt(-s2(z))/beta(phi))

def timelike2(z,phi):
        return (-1j*alpha(phi)*mu(phi)/((2*np.pi)**2*beta(phi)**3*np.sqrt(s2(z))))*scipy.special.kv(1,mu(phi)*np.sqrt(s2(z)))

def propagator2(z,phi):
        return np.piecewise(z,[s(z)<0,s(z)>=0],[lambda z: spacelike2(z,phi), lambda z: timelike2(z,phi)]) 


from colorsys import hls_to_rgb

def colorize(z):
        n,m = z.shape
        c = np.zeros((n,m,3))
        c[np.isinf(z)] = (1.0, 1.0, 1.0)
        c[np.isnan(z)] = (0.5, 0.5, 0.5)

        idx = ~(np.isinf(z) + np.isnan(z))
        A = (np.angle(z[idx]) + np.pi) / (2*np.pi)
        A = (A + 0.5) % 1.0
        #B = 1.0 - 1.0/(1.0+abs(z[idx])**0.3)
        B = 1.0 - 1.0/(1.0+abs(z[idx])**1.3)
        c[idx] = [hls_to_rgb(a, b, 0.8) for a,b in zip(A,B)]
        return c

N = 500
A = np.zeros((N,N),dtype='complex')
axis_x = np.linspace(-xmax,xmax,N)
axis_y = np.linspace(-xmax,xmax,N)
X,Y = np.meshgrid(axis_x,axis_y)
Z = X + Y*1j

#A = 1/(Z+1j)**2 + 1/(Z-2)**2

A1 = propagator1(Z,0.000001)
A2 = propagator1(Z,8)
A3 = propagator1(Z,16)
A4 = propagator1(Z,32)
A5 = propagator1(Z,128)

B1 = propagator2(Z,0.000001)
B2 = propagator2(Z,8)
B3 = propagator2(Z,16)
B4 = propagator2(Z,32)
B5 = propagator2(Z,128)

print(A)

fix, axs = plt.subplots(2,5,sharey=True)
axs[0,0].imshow(colorize(B1), interpolation='none',extent=(-1,1,-1,1))
axs[0,0].set_xticks([-1,0,1])
axs[0,0].set_xlabel(r'$x$')
axs[0,0].set_yticks([-1,0,1])
axs[0,0].set_ylabel(r'$t$')
axs[0,0].set_title(r'$m=0$')

axs[0,1].imshow(colorize(B2), interpolation='none',extent=(-1,1,-1,1))
axs[0,1].set_xticks([-1,0,1])
axs[0,1].set_xlabel(r'$x$')
axs[0,1].set_yticks([-1,0,1])
axs[0,1].set_ylabel(r'$t$')
axs[0,1].set_title(r'$m=0$')

axs[0,2].imshow(colorize(B3), interpolation='none',extent=(-1,1,-1,1))
axs[0,2].set_xticks([-1,0,1])
axs[0,2].set_xlabel(r'$x$')
axs[0,2].set_yticks([-1,0,1])
axs[0,2].set_ylabel(r'$t$')
axs[0,2].set_title(r'$m=0$')

axs[0,3].imshow(colorize(B4), interpolation='none',extent=(-1,1,-1,1))
axs[0,3].set_xticks([-1,0,1])
axs[0,3].set_xlabel(r'$x$')
axs[0,3].set_yticks([-1,0,1])
axs[0,3].set_ylabel(r'$t$')
axs[0,3].set_title(r'$m=0$')

axs[0,4].imshow(colorize(B5), interpolation='none',extent=(-1,1,-1,1))
axs[0,4].set_xticks([-1,0,1])
axs[0,4].set_xlabel(r'$x$')
axs[0,4].set_yticks([-1,0,1])
axs[0,4].set_ylabel(r'$t$')
axs[0,4].set_title(r'$m=0$')

axs[1,0].imshow(colorize(A1), interpolation='none',extent=(-1,1,-1,1))
axs[1,0].set_xticks([-1,0,1])
axs[1,0].set_xlabel(r'$x$')
axs[1,0].set_yticks([-1,0,1])
axs[1,0].set_ylabel(r'$t$')
axs[1,0].set_title(r'$m=0$')
axs[1,1].imshow(colorize(A2), interpolation='none',extent=(-1,1,-1,1))
axs[1,1].set_xticks([-1,0,1])
axs[1,1].set_xlabel(r'$x$')
axs[1,1].set_yticks([-1,0,1])
axs[1,1].set_title(r'$m=8$')
axs[1,2].imshow(colorize(A3), interpolation='none',extent=(-1,1,-1,1))
axs[1,2].set_xticks([-1,0,1])
axs[1,2].set_xlabel(r'$x$')
axs[1,2].set_yticks([-1,0,1])
axs[1,2].set_title(r'$m=16$')
axs[1,3].imshow(colorize(A4), interpolation='none',extent=(-1,1,-1,1))
axs[1,3].set_xticks([-1,0,1])
axs[1,3].set_xlabel(r'$x$')
axs[1,3].set_yticks([-1,0,1])
axs[1,3].set_title(r'$m=32$')
axs[1,4].imshow(colorize(A5), interpolation='none',extent=(-1,1,-1,1))
axs[1,4].set_xticks([-1,0,1])
axs[1,4].set_xlabel(r'$x$')
axs[1,4].set_yticks([-1,0,1])
axs[1,4].set_title(r'$m=128$')

plt.savefig('propagator.pdf',bbox_inches = 'tight',pad_inches=0)

sys.exit()
