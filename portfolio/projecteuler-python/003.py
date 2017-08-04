
# ProjectEuler - Problem #3
# written in Python by Michael Hillendahl

# PROMPT:
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# SOLUTION:
# (define subroutine to determine whether a given value is prime)
# iterate over all values between 1 and the sqrt of the target value
# check for division with target num to produce remainder of 0 (factor)
# create list of all factors less than sqrt of target val
# from greatest to least, iterate over factors and stop at the first prime

import math #for sqrt function
num = 600851475143

def isprime(x):
    for i in range(2,x):
        if x%i==0 : return False
    return True

root=int(math.sqrt(num))+1 #ignore factors larger than sqrt

#build array of factors
arr=[]
for i in range(1,root):
    if num%i == 0: arr.append(i)

#start at largest factor and remove if non-prime
arr.reverse()
for i in arr:
    if isprime(i): ans = i; break

print('largest prime factor: {0}'.format(ans))