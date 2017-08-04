#perl

=pod

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10,001st prime number?

=cut

use warnings;
use strict;

my @primes;
my $i=1;
my $index = 10001;

sub prime{
	return 1 if $_[0]==2;
	foreach (2..int(sqrt($_[0]))+1){
		return 0 if $_[0]%$_==0;
	}
	return 1;
}

LOOP: for (my $i=2;;$i++){
	$primes[$#primes+1]=$i if prime($i);
	last LOOP if ($#primes+1==$index);
}
print "\n\tAnswer: $primes[-1].\n";