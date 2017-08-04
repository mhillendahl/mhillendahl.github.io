#perl

=pod

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

=cut

use warnings;
use strict;

my $sum = 0;
my $count = 1;
while ($count < 1000) {
    $sum+=$count unless ($count%3!=0 && $count%5!=0);
    $count++;
}
print $sum;

