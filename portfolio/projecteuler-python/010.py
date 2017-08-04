
# ProjectEuler: Problem #10 "Summation of Primes"
# written in Python by Michael Hillendahl



"""
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""

# SOLUTION
import math #for sqrt function
max = 2000000
p = [2] #primes
i=2
ans=p[0]

while (1) :
    if not i<max : break
    i+=1
    for j in p :
        if i%j==0 : break
        elif j==p[-1] or j>math.sqrt(i): p.append(i); ans+=i; break
    
print ans