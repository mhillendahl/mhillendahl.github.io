#https://www.hackerrank.com/challenges/time-conversion

#!/bin/python3

import sys

def timeConversion(s):
    if s[:2] == '12':
        if s[8] == 'A':
            s = '00' + s[2:8]
            return s
        else:
            s = s[0:8]
            return s
            
    if s[8] == 'P':
        sub = s[0:2]
        num = int(sub)
        num = num + 12
        sub = str(num)
        s = sub + s[2:8]
        #s[0:1] = str( int(s[0:2]) + 12 )
    else:
        s = s[:8]
            
    return s

s = input().strip()
result = timeConversion(s)
print(result)
