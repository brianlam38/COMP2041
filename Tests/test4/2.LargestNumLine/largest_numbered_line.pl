#!/usr/bin/perl

use List::Util 'max';
use List::Util 'min';

%map;
$lineNum = 0;
@lines;
while ($line = <STDIN>) {
	push(@lines, $line);
	@array = split(/ /, $line);
	@final = ();
	#$map{$line} = @final;
	foreach $item (@array) {
		# remove all but numbers, add to line's array
		chomp($item);
		if ($item =~ /\d/) {
			$item =~ s/[a-zA-Z]?[\$]?[-]?//g;	# remove alphabet, -, $
			#print $item."\n";
			push(@final, $item);		# add num values for each line
		}
	}
	# only map lines with numbers
	$count = @final;
	#print "NUMBERS IN LINE = ".$count."\n";
	if ($count > 0) {
		$map{$lineNum} = max(@final);
		#print $map{$line}."\n";
	}
	$lineNum++;
}

$largest = 0;
@largest_lines;
foreach $key (keys %map) {
	#print $key;
	#print $map{$key}."\n";
	if ($map{$key} >= $largest) {		# if larger or equal
		push (@largest_lines, $key);	# add line with largest num into array
		$largest = $map{$key};			# update largest num
	}
}

# numeric ascending sort line indices
@largest_lines = sort {$a <=> $b} @largest_lines;
foreach $index (@largest_lines) {
	print $lines[$index];
}



