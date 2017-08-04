#perl

=pod

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?

=cut

use warnings;
use strict;

my $num = 600851475143;

#true if arg[0] is a multiple of arg[1]
sub multi{int( ($_[0]>$_[1]) && ($_[0]%$_[1]==0) );}

#true if arg[0] is a prime number
sub prime{
    my $sqrt=int(sqrt($_[0]))+1;
    for (my $i=2;$i<$sqrt;$i++){
        break if ( multi($i,2) || multi($i,3) || multi($i,5) || multi($i,7) );
        return 0 if ($_[0]%$i==0);
    }
    return 1;
}

#divides arg[0] by it's smallest factor, and places the factor at arg[last+1]
sub factor{
    my @o=@_; 
    my $sqrt=int(sqrt($_[0]))+1;
    for (my $i=2;$i<$sqrt;$i++){
        break unless prime($i);
        if ($_[0]%$i==0){
            @o[0]/=$i;
            @o[$#_+1]=$i;
            return @o;
        }
    }
    return @_;
}

#performs factor (above) until the output stops changing
sub factor_all{
    my @o=@_;
    do{
        @o=factor(@o);
    } while (@o!=factor(@o));
    return @o;
}

print "\n\tPrime factors of $num: ", join(', ',factor_all($num)), ".\n\n";