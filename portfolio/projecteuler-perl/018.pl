# euler #18, perl

use warnings;
use strict;

open F, '018.txt';
my @f = reverse(<F>);
foreach (@f){my @line = split(' ',$_);$_ = \@line}
foreach my $i (1..$#f){foreach my $j (0..$#{$f[$i]}){
    $f[$i]->[$j] += ($f[$i-1]->[$j] > $f[$i-1]->[$j+1]) ? $f[$i-1]->[$j] : $f[$i-1]->[$j+1];
}}
print "\n\tAnswer: ", $f[$#f]->[0],"\n";