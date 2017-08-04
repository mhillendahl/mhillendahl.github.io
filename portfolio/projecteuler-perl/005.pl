#perl

=pod

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

=cut

use warnings;
use strict;

sub factor{
	my $num=$_[0];
	my @o;
	foreach (1..$num){
		$o[$#o+1]=$_ if $num%$_==0;
	}
	return @o;
}

sub gcf{
	my $o;
	my @x = reverse(sort {$a <=> $b } (factor($_[0])));
	my @y = reverse(sort {$a <=> $b } (factor($_[1])));
	my %yfac = map { $_ => 1 } @y;
	LOOP: foreach (@x){
		if(exists($yfac{$_})){
			$o = $_;
			last LOOP;
		}
	}
	return $o;
}

sub lcm{return ($_[0]*$_[1])/(gcf($_[0],$_[1]));}

sub lcm_many{
	my @factors = @_;
	my $o=1;
	while ($#factors!=-1){
		$o = lcm($o,shift(@factors));
	}
	return $o;
}

print "\n\n\tAnswer: ", lcm_many (1..20),".\n"