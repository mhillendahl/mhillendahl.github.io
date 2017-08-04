#perl

=pod

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

=cut

use warnings;
use strict;

my @prods;

#string compare: joined array of digits vs. it's inverse
sub test{
    my @digits=split('',$_[0]);
    return 1 if ((join('',@digits) eq join('',reverse(@digits)))==1);
    return 0;
}

#build list of products to check
for my $i(100..999){for my $j(100..999){$prods[$#prods+1]=$i*$j;}}

#remove duplicates and put in high->low order
my %hash = map { $_, 1 } @prods;
@prods = reverse(sort { $a <=> $b } keys %hash);

#check each product, and quit at the first palindrome
LOOP: foreach (@prods) {
    if (test($_)==1){
        print "\n\tThe largest palindrome is $_.\n";
        last LOOP;
    }
}