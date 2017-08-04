#perl

=pod

The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

=cut

use warnings;
use strict;

my $x = 100;

sub sq_sum{
	my $o = 0;
	foreach (1..$_[0]){$o+=$_;}
	return $o**2;
}

sub sum_sq{
	my $o = 0;
	foreach (1..$_[0]){$o+=$_**2;}
	return $o;
}

sub diff{return sq_sum($_[0])-sum_sq($_[0]);}

print "\n\tAnswer: ", diff($x), ".\n";