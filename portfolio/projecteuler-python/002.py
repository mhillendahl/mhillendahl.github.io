
# ProjectEuler - Problem #2
# written in Python by Michael Hillendahl

# PROMPT:
# Each new term in the Fibonacci sequence is generated
# by adding the previous two terms. By starting with 1 and 2,
# the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values
# do not exceed four million, find the sum of the even-valued terms.

# SOLUTION:
# use addition of previous terms to iterate over all fib values below 4mil
# check division with 2 to produce a remainder of 0
# add these even values to running total

"""
cur_val=1
nex_val=2
sum=0

while cur_val < 4000000:
    if cur_val%2 == 0:
        sum += cur_val
    prv_val = cur_val
    cur_val = nex_val
    nex_val = prv_val + cur_val

print(sum)
"""

f=[1,2]
sum=0

while f[-1]+f[-2] < 4000000: f.append(f[-1]+f[-2])
for x in f:
    if x%2==0: sum+=x

print(sum)