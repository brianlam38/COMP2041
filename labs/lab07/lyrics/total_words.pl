#!/usr/bin/perl

# count total num words in <STDIN>
# word = sequence of chars next to each other (not separated by space, punctuation etc.)

$counter = 0;
$start = 1;
$stop = 0;
while ($line = <STDIN>) {
	print $line;
	@array = split(//, $line);
	foreach $c (@array) {
		
		last;
	}
}