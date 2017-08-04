use warnings;
use strict;

require "tools/isprime.pl";
require "tools/primesthrough.pl";

print isprime($ARGV[0]);
print "\t";
print join(', ',primesthrough($ARGV[0]));