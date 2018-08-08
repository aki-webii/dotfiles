#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
%file% - ????

???
 
"""
__author__  = "%name% <%mail%>"
__date__    = "%cdate%"
__credits__ = "Copyright (C) %cyear%, rakuten"
__version__ = "Version $Id$"

import sys , os , codecs , re , getopt , time 
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)
sys.stderr = codecs.getwriter('utf-8')(sys.stderr)

#-----------------------------
# Default valuse
#-----------------------------
encode = 'utf-8'

#-----------------------------
# Message
#-----------------------------
def usage (code):
    """
    ???
    """
    msg = """
Usage: %file%  [options]
??????????????
Options:
 -h,--help:
            This message.
 -c,--charset  <charset>:
            charset.
"""
    print >>sys.stdout,msg
    sys.exit(code)


#-----------------------------
# Option parse
try:
    optlist, args = getopt.getopt(sys.argv[1:],"ht:f:s:b:e:E:c:",longopts=["help","to=","from=","subject=","body=","ext=","ext-binary=","charset="])
    for opt, args in optlist:
        # print opt
        if opt in ('-h','--help'):
            # debug_out(DEBUG_MSG,'help')
            usage(0)
        if opt in ('-c','--charset'):
            encode = args

except SystemExit:
    raise
except:
    usage(1)

print >>sys.stdout, 'encode       : ' + encode

#-----------------------------
# Class
class %cap%:
    """
    %cap% is the ?????
    """

    def __init__(self):
        """
        ???
        """
        pass

