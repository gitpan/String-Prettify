use Test::Simple 'no_plan';
use strict;
use lib './lib';
use warnings;
use constant DEBUG => 1;
use String::Prettify;

print STDERR " - $0 started\n" if DEBUG;

ok(1);

my @strings = ( qw(ino dev udev gmail celar 238957&$*^$582606*##&$HomeEquity12444Line)


);

for my $string (@strings){
   
   my $clean = prettify($string);
  # print STDERR "\n\n# '$string'\n";

   ok($clean,"from, to..\n$string\n$clean\n");

   
}



print STDERR " - $0 ended\n" if DEBUG;

