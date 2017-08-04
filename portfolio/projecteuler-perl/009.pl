#perl

=pod

project euler problem 9

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

=cut

use warnings;
use strict;

my $i=0;

sub solve{foreach my $a (2..$_[0]-2){foreach my $b (2..$_[0]-$a){
            $i++;
            my $c = 1000-$a-$b;
            return ($a*$b*$c) if ($a**2+$b**2==$c**2);
        }
    }
}

print "\n\tAnswer: ", solve(1000), ", found after $i attempts.\n";