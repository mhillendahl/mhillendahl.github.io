#perl

=pod

project euler problem 14

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

=cut

use warnings;
use strict;

my $num=1;
#my $max = 1000000000000;
my $max = 1000000;
my $chain = 0;

LOOP: while(1){
    #print "$num ($chain), " if ($num<1000000);
    (($num-1)%3==0)&&((($num-1)/3)%2==1)&&($num>4)&&((($num-1)/3)%3!=0) ? ($num=($num-1)/3) : ($num*=2);
    $chain++;
    last LOOP if ($num>$max);
}

print "\n\tAnswer: $num.\n";