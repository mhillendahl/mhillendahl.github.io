use warnings;
use strict;

my $linear_dimension = $ARGV[0];
my $solutions = 0;

sub balanced{
	my $num = $_[0];
	my $count = 0;
	my $digits = 2*$linear_dimension;
	foreach (reverse(0..$digits-1)){
		if ($num>(2**$_)){
			$num-=2**$_;
			$count++;
		}
		else{
			$count--;
		}
	}
	#print "\n\t$_[0], $count";
	return 1 if ($count==0);
	return 0;		
}

foreach (0..2**(2*$linear_dimension)-1){$solutions++ if (balanced($_)==1);}
print "\n\tAnswer: $solutions.\n"