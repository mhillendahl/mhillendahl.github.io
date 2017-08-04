"""
ProjectEuler: Problem #13 "Large Sum"
solved using Python by Michael Hillendahl

PROMPT

The following iterative sequence is defined for the set of positive integers:

n -> n/2 (n is even)
n -> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

[code language="python"]
[/code]
"""

# SOLUTION
import time
t = time.time()

max = 1000000
a=[]
for x in range(max) : a.append(int(0))
a[1]=1
ans=[0,0] #index, chain length

for i in range(2,max) :
    l,x,repeat = 1,[i],False
    while x[-1]>1 :
        if x[-1]<max :
            if a[x[-1]]!=0 : repeat=True; break
        x.append((x[-1]*3)+1) if x[-1]%2==1 else x.append(x[-1]/2); l+=1
    if repeat is False : a[i] = l; continue
    for j in range(len(x)-1) :
        if x[j]<max : a[x[j]] = a[x[-1]]+len(x)-j-1

for x in range(max) :
    if a[x] > ans[1] : ans = [x, a[x]]
print "\nans={0} (length={1})\n\n{2}s elapsed".format(ans[0], ans[1], round(time.time()-t, 3))