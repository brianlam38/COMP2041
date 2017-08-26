#!/usr/bin/perl

# use warnings;

$n = 10;

####################
# NO TXT FILE ARGS #
####################
$num_args = @ARGV;
if ($num_args == 0) {
	# count lines in file
	@file = <STDIN>;
	$num_lines = @file;

	# count lines to skip
	if ($n > $num_lines) {
		$skip = 0;
	} else {
		$skip = $num_lines - $n;
	}

	# print tail lines
	$i = 0;
	foreach $line (@file) {
		if ($i < $skip) {
			$i++;
		} else {
			print $line;
		}
	}
}

#################   
# TXT FILE ARGS #
#################  

foreach $arg (@ARGV) {
	if ($arg =~ /-/) {
		$n = substr($arg, 1);
		# print $n."\n";
	} else {
		push @files, $arg;
	}
}

# Open each file in @files array for use
foreach $f (@files) {
	open F, '<', $f or die "$0: can't open $f\n";
	
	# print filename if no. files supplied > 1
	$NUM_FILES = @files;
	if ($NUM_FILES > 1) {
		print "==> $f <==\n"
	}

	# count no. lines to skip
	$NUM_LINES = `wc -l < $f`;
	if ($n > $NUM_LINES) {
		$skip = 0;
	} else {
		$skip = $NUM_LINES - $n;
	}

	# print tail lines
	$i = 0;
	foreach $line (<F>) {
		if ($i < $skip) {
			$i++;
		} else {
			print $line;
		}
	}	
	
	close F;
}


