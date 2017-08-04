
# ProjectEuler - Problem #7
# written in Python by Michael Hillendahl

# PROMPT
# 13 is the 6th prime number.
# What is the 10,001st prime number?

# SOLUTION
# Populate an array with prime numbers.
# Test for primeness by checking the remainder
# after division with all previously found prime numbers.

import math #for sqrt function
index = 10001
p = [2] #primes
i=2

while (1) :
    if len(p)==index : break
    i+=1
    for j in p :
        if i%j==0 : break
        elif j==p[-1] or j>math.sqrt(i): p.append(i); break
    
print p[-1]