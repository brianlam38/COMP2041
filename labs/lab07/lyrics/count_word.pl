#!/usr/bin/perl

$word = $ARGV[0];
$count = 0;

while ($line = <STDIN>) {
	if ($line =~ /$word/i) {
		$count += 1;
	}
}

print "$word occurred $count times\n";