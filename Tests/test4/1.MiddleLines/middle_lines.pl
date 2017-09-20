#!/usr/bin/perl

$file = $ARGV[0];

open FILE, '<', $file;

@array;
while ($line = <FILE>) {
	push(@array, $line);
}

$count = @array;

if ($count == 0) {			# no lines, print nothing
	exit;
}

if (($count % 2) == 1) {	# odd
	$index = $count/2 - 0.5;
	print $array[$index];
} else {					# even
	$index = $count/2;
	print $array[$index-1];
	print $array[$index];
}