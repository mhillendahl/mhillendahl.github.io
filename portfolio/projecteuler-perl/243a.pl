use warnings;
use strict;

require 'tools\primesthrough.pl';

my @p = primesthrough(500000);
#my @p = primesthrough(25);
my %pr = map { $_ => 1 } @p;
#my $target = 15499/94744;
my $target = .3;
my $denom=1;

sub resilience { #my $ans = resilience($denominator)
    return 1 if $_==1;
    my %hash = ();
    LOOP: foreach my $pri (@p){ last LOOP if $pri>$_[0]-1;
        next LOOP if $pri==1;
        #print "\n\t $pr: ";
        if ($_[0]%$_==0){
            foreach (2..($_[0]/$pri)-1){
                #print ($pr*$_), ",";            
                $hash{$pri*$_}=1;
            }
        }
    }
    my @keys = sort {$a<=>$b} (keys(%hash));
    #print "\n\t keys: @keys";
    my $out=(($_[0]-1)-($#keys+1));
    print "\n\t resilience($_[0]) = $out/($_[0]-1) =", ($out/($_[0]-1));
    return ($out/$_[0]);
}

LOOP: foreach (@p){
    my $i=$_;
    LOOP1: while(1){ $i++;
        foreach my $pri (@p){
            last LOOP1 if $pri==$_;
            next LOOP1 if ($_%$pri!=0);
        }
    }
    $denom = $i;
    #print "\n\t$denom: ";
    last LOOP if resilience($denom) < $target;
}

print "\n\tAnswer: $denom";