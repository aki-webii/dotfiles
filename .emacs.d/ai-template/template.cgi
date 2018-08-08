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

use warnings;
use strict;

my $buffer;
read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});


my $res_value = "";
my $response_fmt = <<_RES_
Content-Type: application/xml

<?xml version='1.0' encoding='UTF-8'?><xmlroot>%s</xmlroot>
_RES_
;

printf($response_fmt,$res_value);
