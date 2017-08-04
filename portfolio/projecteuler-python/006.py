
# ProjectEuler - Problem #6
# written in Python by Michael Hillendahl

# PROMPT
# The sum of the squares of the first ten natural numbers is,
#       1^2 + 2^2 + ... + 10^2 = 385
# The square of the sum of the first ten natural numbers is,
#       (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the
# first ten natural numbers and the square of the sum is,
#       3025 - 385 = 2640.
# Find the difference between the sum of the squares of the
# first one hundred natural numbers and the square of the sum.

val, sumofsqrs, sum = 100, 0, 0
for x in range(val+1) : sumofsqrs += x**2; sum += x
print sum**2-sumofsqrs