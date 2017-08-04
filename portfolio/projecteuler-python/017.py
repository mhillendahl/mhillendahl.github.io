"""
ProjectEuler: Problem #13 "Large Sum"
solved using Python by Michael Hillendahl

PROMPT

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

"""

# SOLUTION
import time; t = time.time()

ones=['zero','one','two','three','four','five','six','seven','eight','nine']
teens=['ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
tens=['zero','ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']
And='and'
hun='hundred'
thou='thousand'

for a in ones : a = len(a)
for a in teens : a = len(a)
for a in tens : a = len(a)
And = len(And)
hun=len(hun)
thou=len(thou)

allones = 0
allteens
for x in ones: allones+=x


for x in str(2**1000): sum+=int(x)

for i in range(1,1000+1)
    if i>999: sum+=ones[1]+thou
    if i<10: sum+=ones[i]
    elif i<20: sum+=teens[i-10]
    elif i<100: sum+=ones[int(str(i)[1])]+tens[int(str(i)[0])]
    elif i<1000: sum+= ones[int(str(i)[0])]+

print "\nans=%s\n\n%sms elapsed" % (sum, 1000*(time.time()-t))