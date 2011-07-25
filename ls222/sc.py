"""
make a scatter plot with varying color and size arguments
"""
import matplotlib 
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab

# load a numpy record array from yahoo csv data with fields date,
# open, close, volume, adj_close from the mpl-data/example directory.
# The record array stores python datetime.date as an object array in
# the date column

x=[1,4,6,2,9,2,7,8]
y=[5,1,3,9,4,6,2,6]

fig = plt.figure()
ax = fig.add_subplot(111)
ax.scatter(x,y,c=close, s=volume, alpha=0.75)

#ticks = arange(-0.06, 0.061, 0.02)
#xticks(ticks)
#yticks(ticks)

ax.set_xlabel(r'$\Delta_i$', fontsize=20)
ax.set_ylabel(r'$\Delta_{i+1}$', fontsize=20)
ax.set_title('Volume and percent change')
ax.grid(True)

plt.show()



