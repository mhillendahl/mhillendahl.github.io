#this one takes too long.

use warnings;
use strict;

sub paths{
    return 1 if ($_[0]==0 || $_[1]==0);
    return paths($_[0]-1,$_[1])+paths($_[0],$_[1]-1);
}

my $solution = paths(12,12);

print "\n\tAnswer: $solution.\n";