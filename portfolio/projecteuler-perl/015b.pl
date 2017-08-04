#euler 15, perl

use warnings;
use strict;

my %h = ();
foreach my $i (0..20){foreach my $j (0..20){
    (exists($h{$i,$j-1}) && exists($h{$i-1,$j})) ? ($h{$i,$j} = $h{$i,$j-1}+$h{$i-1,$j}) : ($h{$i,$j}=1);
}}
print "\n\tAnswer: $h{20,20}.\n";

=problem
Starting in the top left corner of a 2×2 grid,
and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=cut