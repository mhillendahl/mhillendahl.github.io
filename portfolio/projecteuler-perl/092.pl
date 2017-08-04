use Time::HiRes; my $time = [Time::HiRes::gettimeofday()];

#my $max=$ARGV[0];
my %h = (1=>1,89=>89);
#$h{1}=1;
#$h{89}=89;
#my @chain=();
my $ans=0;

sub sum{my $o=0; foreach (@_){$o+=$_}; return $o;}

LOOP: foreach (1..$ARGV[0]-1){
    #my $last = 0; foreach (split('',$_)){next LOOP if ($_ < $last); $last=$_;}
    my $x=$_;
    my @chain = ();
    while(!exists($h{$x})){
        push(@chain,$x);
        $x = sum(map {$_**2} split('',$x));
    }
    foreach (@chain){$h{$_}=$h{$x} if !exists($h{$_});}
}

print "\n\t1: ", Time::HiRes::tv_interval($time)*100;
foreach (1..$ARGV[0]-1){$ans++ if ($h{$_}==89);}
print "\n\tAnswer: $ans. (", Time::HiRes::tv_interval($time), " seconds)\n";