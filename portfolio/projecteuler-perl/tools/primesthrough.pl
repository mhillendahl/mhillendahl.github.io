sub primesthrough{
    my @arr=(1,2,3,5,7);
    for (my $i=9;$i<=$_[0];$i+=2){push(@arr,$i) if ($i%3!=0 && $i%5!=0 && $i%7!=0);}
    my %hash = map { $_ => 1 } (@arr);
    foreach our $i(3..$_[0]){if(exists($hash{$i})){foreach(2..int($_[0]/$i)){delete($hash{$_*$i}) if(exists($hash{$_*$i}));}}}
    return sort {$a<=>$b} keys(%hash);
}

1;

#print isprime($ARGV[0]);