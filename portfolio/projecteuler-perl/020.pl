#euler 20, perl

use warnings;
use strict;

#my @ans = factorial(100);

sub factorial{
    my @o = (1);
    foreach (1..$_[0]){
        x($_,\@o);
    }
    #print @o;
}

=block
sub x1{
    my $carry = int(($_[0]*$_[1])/10);
    my $result = ($_[0]*$_[1])%10;
    return ($result,$carry);
}
=cut
sub x10{my @arr = push(@_[0],0);return @arr};
sub x100{my @arr = push(@_[0],(0,0));return @arr};

sub x1{ #  $int, @num 
    my $carry=0;
    foreach (@{$_[1]}){
        my $prod = ($_*$_[0])+$carry;    
        $_ = $prod%10;
        $carry = int($prod/10);
    }
    push (@{$_[1]},$carry) if $carry !=0;
}

sub x{ #   $int, \@num
    my @temp=@{$_[1]};
    my @int= split('',$_[0]);
    unshift(@int,'0') until $#int==2;
    print @int, ",";
    x1(@int[0],@temp)+10*
}


#my @test = x1(3,3);

#print $test[0], $test[1];

print "\n\n";
factorial(3);