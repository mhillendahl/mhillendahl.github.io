
# ProjectEuler - Problem #1
# written in Python my Michael Hillendahl

# PROMPT:
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

# SOLUTION:
# iterate over all positive integers less than 1000
# check for division with 3 or 5 to produce a remainder of 0
# add, to a running total, all values that pass the above test

sum = 0
for i in range (1000):
    if (i%3 == 0 or i%5 == 0):
        sum += i
print(sum)