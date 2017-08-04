use warnings;
use strict;

require 'tools\primesthrough.pl';

my @p = primesthrough(500000);
shift(@p);
my %pr = map { $_ => 1 } (@p);
my $target = 15499/94744;
#my $target = .2;
my $denom=2;

sub candidate { #my $ans = candidate($denominator)
    foreach (3,5,7,11,13){
        return 0 if $_[0]%$_!=0;
    }
    return 1;
}


sub reducible { #my $ans = reducible($numerator, $denominator)
    return 1 if ($_[0]&1==0 and $_[1]&1==0); #skip if num & denom are even
    return 0 if exists($pr{$_[0]});
    #print "\n\treducible($_[0],$_[1]): ";
    foreach (@p){
        #print $_, ", ";
        return 0 if $_>sqrt($_[1]);
        return 1 if ($_[0]%$_==0 and $_[1]%$_==0);
    }
}

sub resilience { #my $ans = resilience($denominator)
    my $out=0;
    return 1 if exists($pr{$_[0]});
    LOOP: foreach (1..$_[0]-1) {next LOOP if reducible($_,$_[0])!=0; $out++;}
    print "\nresilience($_[0]) = ", $out/$_[0];
    return $out/$_[0]; 
}

LOOP: while (1){
    $denom+=2;
    next LOOP if candidate($denom)==0;
    last LOOP if resilience($denom) < $target;
}

print "\n\tAnswer: $denom";