package String::Prettify;
use Exporter;
use vars qw($VERSION @EXPORT @ISA);
@ISA=qw/Exporter/;
@EXPORT = qw(prettify);
use strict;
$VERSION = sprintf "%d.%02d", q$Revision: 1.2 $ =~ /(\d+)/g;

sub prettify {
   my $string = shift;

   _depathify(\$string);
   
   _spacing(\$string);

   _cap(\$string);

   return $string;
}


# privates.... 


sub _cap {
   my $ref = shift;
   
   
   
   #my $string = lc($$_ref);
   
   $$ref=~s/\b([a-z])/uc($1)/ge;
   return;
}
   
sub _ext {
   my $_ref = shift;
   $$_ref=~s/\.\w{1,8}$//;
   return;
}
   
   
sub _depathify {
   my $r = shift;
   $$r=~s/^.+\/+//;
   
   _ext($r);
   
   return;
}
   
sub _spacing {
   my $ref = shift;
   $$ref=~s/[\W_]/ /g;
   
   $$ref=~s/([0-9])([a-zA-Z])/$1 $2/g;
   $$ref=~s/([a-zA-Z])([0-9])/$1 $2/g;
   
   
   $$ref=~s/([a-z])([A-Z])/$1 $2/g;
   $$ref=~s/ {2,}/ /g;
   $$ref=~s/^\s+|\s+$//g;
   return;
   
}



1;

__END__

=pod

=head1 NAME

String::Prettify - subs to cleanup a filename and or garble for human eyes

=head1 SYNOPSIS

   use String::Prettify

   print prettify('~/this is a directory with a_funnything');
   

=head1 DESCRTIPTION

I was tired of turning things like '/var/www/dms/doc/Clients_ALTERNATe/Universal Title LLC/Vendors/2005/Invoices/JOE RAGANS COFFEE/092705-JOE RAGANS COFFEE-031003.pdf' into '092705 JOE RAGANS COFFEE 031003'

=head1 SUBS

Are exported on use.

=head2 prettify()

argument is string
returns prettified.

=head1 CAVEATS

In development. If you have suggestions, please notify the AUTHOR.

=head1 AUTHOR

Leo Charre leocharre at cpan dot org

=cut


