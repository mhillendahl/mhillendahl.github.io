#https://www.hackerrank.com/challenges/bon-appetit

#!/bin/python

import sys

def bonAppetit(n, k, b, ar):
    # Complete this function
    total=0
    for cost in ar: total += cost
    return "Bon Appetit" if b == (total-ar[k])/2 else b-((total-ar[k])/2)

n, k = raw_input().strip().split(' ')
n, k = [int(n), int(k)]
ar = map(int, raw_input().strip().split(' '))
b = int(raw_input().strip())
result = bonAppetit(n, k, b, ar)
print(result)
