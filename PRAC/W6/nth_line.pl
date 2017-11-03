#!/usr/bin/perl

$nth = $ARGV[0];
$file = $ARGV[1];

#print $nth."\n";
#print $file."\n";

open F, '<', $file;
$count = 0;
while ($line = <F>) {
	$count++;
}
close F;

if ($count < $nth) {
	exit;
}

open F, '<', $file;
while ($line = <F>) {
	if ($nth == 1) {
		print $line;
		last;
	}
	$nth--;
}


