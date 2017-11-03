#!/usr/bin/perl

while ($line = <STDIN>) {
	@array = split(' ', $line);
	@sorted = ();
	foreach $c (sort(@array)) {
		push(@sorted, $c);
	}
	foreach $item (@sorted) {
		print $item." ";
	}
	print "\n";
}
