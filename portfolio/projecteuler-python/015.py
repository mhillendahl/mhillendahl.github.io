"""
ProjectEuler: Problem #13 "Large Sum"
solved using Python by Michael Hillendahl

PROMPT

Starting in the top left corner of a 2x2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20x20 grid?
"""

# SOLUTION
import time
t = time.time()*1000 #ms

max=20
set=[[1]]

print '\n'

for i in range(max) :
    set.append([1])
    while len(set[-1]) < len(set[-2]) :
        set[-1].append(set[-2][len(set[-1])]+set[-1][len(set[-1])-1])
    set[-1].append(2*set[-1][-1])

print "\nans={0}\n\n{1}ms elapsed".format(set[-1][-1], round(time.time()*1000-t, 3))