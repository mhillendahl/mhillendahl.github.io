#perl

=pod

project euler problem 10

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million

=cut

use warnings;
use strict;

use Time::HiRes;

my $time = [Time::HiRes::gettimeofday()];
my $max = $ARGV[0];
my @arr=(2,3,5,7,11,13,17,19);

for (my $i=4;$i<$max;$i+=3){
    foreach($i,$i+1){
        push(@arr,$_) if ($_%2!=0 && $_%5!=0 && $_%7!=0 && $_%11!=0 && $_%13!=0 && $_%17!=0 && $_%19!=0);
    }
}

my %hash = map { $_ => 1 } (@arr);

foreach our $i(2..int(sqrt($max)+1)){
    if(exists($hash{$i})){foreach(2..int($max/$i)){delete($hash{$_*$i}) if(exists($hash{$_*$i}));}}
}

my $sum=0;
foreach (keys(%hash)){$sum+=$_;}
$time=Time::HiRes::tv_interval($time);
print "\n\t010.pl Answer: $sum. ($time seconds)\n";

keys(%hash);