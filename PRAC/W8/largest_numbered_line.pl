#!/usr/bin/perl

@lines;
$largest = -100;
while ($line = <STDIN>) {
	if ($line !~ /[0-9]/) {
		next;
	}
	push(@lines, $line);
	@array = split(' ', $line);
	foreach $item (@array) {
		# remove double --
		if ($item =~ /--/) {
			$item =~ s/--//g;
			$item = "-".$item;
		}
		# remove non digit-related chars
		$item =~ s/[^0-9.-]//g;
		# replace largest number
		if ($item > $largest && $item =~ /[0-9]/) {
			$largest = $item;
		}
	}
}

# Run through array of lines and check existence of largest number in each
foreach $item (@lines) {
	if ($item =~ /$largest/) {
		print $item;
	}
}
