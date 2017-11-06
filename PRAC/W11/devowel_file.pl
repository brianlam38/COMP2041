#!/usr/bin/perl

$file = $ARGV[0];

open F, '<', $file;

@array;
while ($line = <F>) {
	$line =~ s/[aeiouAEIOU]//g;
	push(@array, $line);
}
close F;

open F, '>', $file;
close F;

open F, '>>', $file;

foreach $item (@array) {
	print F $item;
}

