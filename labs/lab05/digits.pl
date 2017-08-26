#!/usr/bin/perl

use warnings;

# read in each line
while ($line = <STDIN>) {
		# separate into chars
        @list = split(//, $line);
        foreach $c (@list) {
        		# if not digits, print char
                if (!($c =~ /[0-9]/)) {
                        print "$c";
                } elsif ($c < 5) {
                        print "<";
                } elsif ($c > 5) {
                        print ">";
                } else {
                        print "5";
                }
        }
}

