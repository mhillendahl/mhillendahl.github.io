
# ProjectEuler - Problem #9
# solved using Python by Michael Hillendahl

"""
A Pythagorean triplet is a set of three natural numbers,a < b < c, for which,

a2 + b2 = c2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
"""

# SOLUTION
import math

def solve(target):
    for a in range(1,target):
        for b in range(1,target-a):
            c = 1000 - a - b
            if c == math.sqrt(a**2+b**2) : return a*b*c
            
print solve(1000)