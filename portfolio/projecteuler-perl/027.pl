#perl euler #27
use warnings;
use strict;
require "tools/isprime.pl";

my $ans = 0;

sub consecutiveprimes{ my $i = 0; $i++ while (isprime($i**2+$i*$_[0]+$_[1])); return $i;}

my $A=1;
my $B=1;
my $C=1;


foreach my $x (-$ARGV[0]..$ARGV[0]){
    foreach my $y (-$ARGV[0]..$ARGV[0]){
        my $cur = consecutiveprimes($x,$y);
        if ($cur>$C){
            $A=$x and $B=$y and $C=$cur;
        }
    }
}


print "\n\tAnswer: $C.\n";
    
=problem
Considering quadratics of the form:
n² + an + b, where |a| < 1000 and |b| < 1000

Find the product of the coefficients, a and b,
for the quadratic expression that produces
the maximum number of primes for consecutive 
values of n, starting with n = 0.
=cut