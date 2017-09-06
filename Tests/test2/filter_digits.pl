#!/usr/bin/perl

# read from stdin, remove all digits
# write to stdout

while ($line = <STDIN>) {
	@array = split(//, $line);
	foreach $c (@array) {
		if (!($c =~ /[0-9]/)) {
			print $c;
		}
	}
}
