#https://www.hackerrank.com/challenges/breaking-best-and-worst-records

#!/bin/python

import sys

def getRecord(s):
    # Complete this function
    min=s[0]
    max=s[0]
    minbreaks=0
    maxbreaks=0
    
    for score in s:
        if score>max:
            max = score
            maxbreaks+=1
        if score<min:
            min = score
            minbreaks+=1
            
    print str(maxbreaks) + " " + str(minbreaks)

n = int(raw_input().strip())
s = map(int, raw_input().strip().split(' '))
result = getRecord(s)
print " ".join(map(str, result))
