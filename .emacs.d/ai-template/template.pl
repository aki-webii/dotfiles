#!/usr/bin/env perl
#---------------------------------------------
# %file% - ????
# 
#   Copyright (C) %cyear% rakuten 
#     by %name% <%mail%> 
#     Date : %cdate%
#---------------------------------------------

use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;

use locale;
use POSIX qw(setlocale strftime mktime LC_ALL);

my $l    = setlocale(LC_ALL,"C");
my $d = strftime "%d/%b/%Y:%H:%M:%S", localtime( time() );

# use Dumpvalue;
# my $dmp = new Dumpvalue();

my %options = (
	       y   		  => 0,
	       debug              => undef,
	       );

# Option proc.
GetOptions(
	   'help' 		    => sub {pod2usage( -verbose => 3 , -exitval => 0 );},
	   'y'    		    => \$options{y},
	   'debug:n'   		    => \$options{debug},
	   ) or pod2usage( -verbose => 0 , -exitval => 1 );


__END__
=head1 NAME

%file% - ???? 

=head1 SYNOPSIS

%file%  [options] [???]

=head1 OPTIONS

=over 18

=item -y

Auto 'y' answar.

=item -help

View help document.

=back

=head1 TODO

=over 18

=item 

=back

=cut
