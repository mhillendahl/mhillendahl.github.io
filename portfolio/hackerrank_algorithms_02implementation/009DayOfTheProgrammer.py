#https://www.hackerrank.com/challenges/day-of-the-programmer

#!/bin/python

import sys

def isLeap(year):
    return year%4==0 if year<1918 else year%400==0 or (year%4==0 and not year%100==0)

def solve(year):
    return "26.09.1918" if year==1918 else (("12.09." if isLeap(year) else "13.09.") + str(year))
    
year = int(raw_input().strip())
result = solve(year)
print(result)
