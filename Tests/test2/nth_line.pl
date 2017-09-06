#!/usr/bin/perl

# PASSED ALL CSE TESTS

$nth = $ARGV[0];		# take in nth line value
$file = $ARGV[1];		# take in file

$ctr = 1;				# line counter

open F, '<', $file;			# open file for reading
foreach $line (<F>) {		# for each line in file
	if ($ctr == $nth) {		# loop until nth line is reached
		print $line;		#		print line
		last;				#		break loop
	}
	#print $line, "\n";
	$ctr += 1;
}



