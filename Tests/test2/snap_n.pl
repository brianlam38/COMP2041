#!/usr/bin/perl

# PASSED ALL CSE TESTS

# Read in lines from input until it reads a line that has been entered n times

$n = $ARGV[0];	# how many times?
$init = 1;		# counter

%hash;	# empty hash

while ($line = <STDIN>) {
	chomp($line);					# remove newline
	if (exists($hash{$line})) {		# if key exists, increment counter for key
		#print "key exists\n";
		$ctr = $hash{$line};
		$ctr += 1;
		$hash{$line} = $ctr;
		if ($ctr == $n) {			# if input has been entered n times, print line
			print "Snap: ", $line, "\n";
			last;
		}
	} else {						# else initialise key/val pair
		#print "key doesn't exists\n";
		$hash{$line} = $init;
	}
}

# issue with last line having no newline, so it counts as a separate key.
# solved with chomp() function to remove newline at end of a string / line.