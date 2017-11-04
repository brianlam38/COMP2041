#!/usr/bin/perl

open F, '<', $ARGV[0];

while ($line = <F>) {
	$num_lines++;
	push(@array, $line);
}

$mid = $num_lines/2;
#print "MID = $mid\n";

if ($num_lines % 2 == 1) {
	print $array[$mid];
} else {
	print $array[$mid - 1];
	print $array[$mid];
}
