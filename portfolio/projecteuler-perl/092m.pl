use strict;
#use warnings;
use 5.016;
use List::Util 'sum';

#my @times = map qx/perl 092.pl 3.5E5/, 1..10;
my @times = map qx/092.pl 3.5E5/, 1..10;
chomp @times;

say "@times";
say "mean:  ", mean(@times);
say "sigma: ", sigma(@times);

sub mean { sum(@_)/@_ }

sub sigma {
    my $mean = mean(@_);
    my $variance = sum(map { ($_-$mean)**2 } @_) / @_;
    sqrt $variance;
}