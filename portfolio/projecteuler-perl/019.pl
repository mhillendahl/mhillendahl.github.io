#euler #19, perl

use warnings;
use strict;

my @dpm = (31,28,31,30,31,30,31,31,30,31,30,31);
my $day = 1;

my $sundays = 0;
foreach my $yr (0..100){foreach (0..11){
        $day=$day%7; $sundays++ if ($day==0 and $yr>0);
        $day+=$dpm[$_]; $day++ if ($_==1 and $yr%4==0 and $yr%100!=0);
}}
print "\n\n\tAnswer: $sundays\n";