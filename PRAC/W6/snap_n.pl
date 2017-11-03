#!/usr/bin/perl

$nth = $ARGV[0];

if ($nth == 0) {
	exit;
}

%seen;
while ($line = <STDIN>) {
	$seen{$line}++;
	if ($seen{$line} == $nth) {
		print "Snap: $line";
		last;
	}
}
