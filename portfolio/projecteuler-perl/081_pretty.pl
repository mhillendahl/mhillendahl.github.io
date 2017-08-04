#euler #81, perl

use warnings;
use strict;

open FILE, "081.txt" or die $!;
my @lines = <FILE>;
my @data = ();
foreach (@lines){push @data, split(",",$_)};
my @rows = ();
foreach (0..79){my @temp = @data[$_*($#lines+1)..$_*($#lines+1)+($#lines)]; push @rows, \@temp;}
my $ref = \@rows;

sub sum{
    my $sum=$ref->[0]->[0];
    foreach (map {substr $_[0], 0, $_} (1..length($_[0]))){
        $sum+=$ref->[$_=~tr\0\\]->[$_=~tr\1\\];
    }
    return $sum;
}

my %hash = ('' => 1);

foreach (1..$#lines){

    #create next layer of paths
    foreach my $key(keys(%hash)){
        LOOP:foreach (map {"$key"."$_"}("00","01","10","11")){
            next LOOP if ("$_")=~tr/1//>$#lines or ("$_")=~tr/0//>$#lines;
            my @value = ((("$_")=~ tr/1//) - (("$_")=~ tr/0//), sum($_));
            $hash{"$_"}= \@value;
        }
        #delete previous path, now obsolete
        delete($hash{$key});
    }

    #make hash with keys for each pos, value = path with the greatest current sum
    my %pos;
    LOOP: foreach (keys(%hash)){
        $pos{$hash{$_}->[0]}=$_ and next LOOP if not exists($pos{$hash{$_}->[0]});
        $pos{$hash{$_}->[0]}=$_ if ($hash{$_}->[1] < $hash{$pos{$hash{$_}->[0]}}->[1]);
    }
    my %sop = reverse %pos;   
    foreach (keys(%hash)){delete $hash{$_} if not exists($sop{$_});}
}

foreach (sort {$a<=>$b} (keys(%hash))){ print "\npath=$_, pos=$hash{$_}->[0], sum=$hash{$_}->[1]"; }
