#!/usr/bin/perl

# count total num words in <STDIN>
# word = sequence of chars next to each other (not separated by space, punctuation etc.)

$counter = 0;
while ($line = <STDIN>) {
	chomp $line;
	$line = `sed s/[^a-zA-Z]/' '/g`;
	@array = split(/[ ][ ]*/, $line);
	# any char NOT a-zA-Z -> 0 or more times
	foreach $c (@array) {
		print $c, "\n";
		$counter += 1;
		#print $c;
	}
}

print $counter, " words\n";
