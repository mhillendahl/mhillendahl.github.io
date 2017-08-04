
# ProjectEuler - Problem #5
# written in Python by Michael Hillendahl

# PROMPT:
# 2520 is the smallest number that can be divided by
# each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?

# SOLUTION:
# write subroutine to test for prime number
# write subroutine to factor 1 value into 2
# write subroutine to fully factor any value
# create array to contain master list of all factors
# per value, check master list for corresponding factors
#   and add missing factors to master list
# multiply all resulting array elements

num=20
ans=1
f=[] #factors
t=[] #temp arr

def isprime(x):
    for i in range(2,x): 
        if x%i==0 : return False
    return True

def factor(x) :
    arr = []
    for i in range (2,x) :
        if x%i==0:
            arr.append(i)
            arr.append(x/i)
            return arr

def factorall(x) :
    f = [x]
    done=False
    while not done :
        done = True
        for i in f :
            if not isprime(i) :
                f.remove(i)
                f.append(factor(i)[0])
                f.append(factor(i)[1])
                done = False
    return f
    
for x in range(1,num+1) :
    t=factorall(x)
    for y in t :
        while f.count(y) < t.count(y) : f.append(y)
for x in f :
    ans*=x
print ans