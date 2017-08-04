#perl euler #27
use warnings;
use strict;
require "tools/primesthrough.pl";

my $A=1;
my $B=1;
my $ans = 0;
my @primes = primesthrough($ARGV[0]**2+$ARGV[0]*$ARGV[1]+$ARGV[1]);
my %h = map {$_ => 1} (@primes);
sub isprime{return exists($h{$_[0]}) ? 1 : 0;}
sub consecutiveprimes{my $i=0; while(isprime($i**2+$i*$_[0]+$_[1])){$i++;}return $i;}

foreach my $x (-$ARGV[1]..$ARGV[1]){
    foreach my $y (-$ARGV[1]..$ARGV[1]){
        my $cur = consecutiveprimes($x,$y);
        $A=$x and $B=$y and $ans=$cur if $cur>$ans;
    }
}

print "\n\tAnswer: $ans ($A, $B). -> ", $A*$B, "\n";

=problem
Considering quadratics of the form:
n² + an + b, where |a| < 1000 and |b| < 1000

Find the product of the coefficients, a and b,
for the quadratic expression that produces
the maximum number of primes for consecutive 
values of n, starting with n = 0.
=cut