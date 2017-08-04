use warnings;
use strict;

my @ones=('','one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen');
my @tens = ('','ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety');

my $sum=0;
foreach (1..$ARGV[0]){
    my $s = '';
    my @num=split('',$_); unshift(@num,'0') until $#num==3;
    $s.=$ones[$num[0]]." thousand" if $num[0]>0; shift(@num);
    $s.=$ones[$num[0]]." hundred" if $num[0]>0; shift(@num);
    $s.=" and" if join('',@num)>0 and length($s)>0;	
    $s.=" ".$tens[$num[0]]." ".$ones[$num[1]] if join('',@num)>19;
    $s.=" ".$ones[join('',@num)] if join('',@num)<20;
    $s =~ s/ //g;
    $sum+=length($s);
}

print "\n\n\tAnswer: $sum.";