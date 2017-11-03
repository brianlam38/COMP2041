#!/usr/bin/perl

%args;

foreach $arg (@ARGV) {
	if (exists($args{$arg})) {
		next;
	}
	$args{$arg} = 0;
	print $arg." ";
}
print "\n";
