"""
ProjectEuler: Problem #16 "Power Digit Sum"
solved using Python by Michael Hillendahl

PROMPT

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

"""

# SOLUTION
import time; t = time.time()

sum=0
for x in str(2**1000): sum+=int(x)

print "\nans=%s\n\n%sms elapsed" % (sum, 1000*(time.time()-t))