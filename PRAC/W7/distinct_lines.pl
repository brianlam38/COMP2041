#!/usr/bin/perl

$n = $ARGV[0];
$read = 0;
$distinct = 0;

%seen;
while ($line = <STDIN>) {
	# transform line
	$line =~ s/ //g;
	$line =~ tr/[A-Z]/[a-z]/;

	if (exists($seen{$line})) {
		$seen{$line}++;
	} else {
		$distinct++;
		$seen{$line}++;
	}
	$read++;
	
	if ($distinct == $n) {
		print "$distinct distinct lines seen after $read lines read.\n";
		exit;
	}
}

print "End of input reached after $read lines read - $n different lines not seen.\n";


