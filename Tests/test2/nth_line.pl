#!/usr/bin/perl

# take in args
# ARG[0] = nth line
# ARG[1] = filename

$nth = $ARGV[0];
$file = $ARGV[1];

$ctr = 1;

open F, '<', $file;			# open file for reading
foreach $line (<F>) {		# for each line in file
	if ($ctr == $nth) {		# loop until nth line is reached
		print $line;		#		print line
		last;				#		break loop
	}
	#print $line, "\n";
	$ctr += 1;
}



