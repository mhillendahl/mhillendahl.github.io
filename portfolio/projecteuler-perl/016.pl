use warnings;
use strict;

my $carry=0;
my @arr=(1);
my $power = 1000;
my $sum =0;
foreach (1..$power){    
    LOOP: for (my $_=0;$_<$#arr+1;$_++){            #for each digit
        $arr[$_]<<=1;                                 #multiply by 2
        if ($carry==1){$arr[$_]++;$carry=0;}          #carry from previous overflow
        if ($arr[$_]>9){$arr[$_]-=10;$carry=1;        #handle overflow       
            if ($#arr==$_){push(@arr,0);$carry = 1;}    #if last digit, init next digit
}}}
foreach (@arr){$sum+=$_;}
print "\t\nAnswer: $sum.\n";