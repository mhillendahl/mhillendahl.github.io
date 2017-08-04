
# ProjectEuler - Problem #4
# written in Python by Michael Hillendahl

# PROMPT:
# A palindromic number reads the same both ways.
# The largest palindrome made from the product of
# two 2-digit numbers is 9009 = 91 x 99.
# Find the largest palindrome made from the product
# of two 3-digit numbers.

# SOLUTION
# define subroutine to check for palindrome
# double-iterate over all 3-digit integers
# check every combination for palindrome

# palindrome-checker
def ispal(x) :
    s = str(x)                      #string
    l = len(s)                      #length
    t = l/2 if l%2==0 else (l-1)/2  #times needed (odd/even)
    for i in range(t):              #for the first half of digits, in order...
        if s[i] != s[-1-i]:         #compare with opposite digit
            return False            #and return false if digits don't match
    return True                     #if all digits match, return true

#solution
ans=1
for i in range(100,999):
    for j in range(i,999): #ignore values below i, since they were tested already
        prod = i*j
        if ispal(prod) and prod>ans: ans = prod
print ans
