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
			$item =~ s/[a-zA-Z]?[\$]?//g;	# remove alphabet, -, $
			#print "item to push = ".$item."\n";
			push(@final, $item);		# add num values for each line
		}
	}
	# only map lines with numbers
	$count = @final;
	#print "count = ".$count;
	#print "NUMBERS IN LINE = ".$count."\n";
	if ($count > 0) {
		#print max(@final)."\n";
		$map{$lineNum} = max(@final);
		#print $map{$lineNum}."\n";
	}
	$lineNum++;
}

$largest = -1;
$k = 0;
@largest_lines;
foreach $key (keys %map) {
	# post-processing: removing duplicate dash e.g. --90 -> -90
	if ($map{$key} =~ /--/) {
		$map{$key} =~ s/--/-/g;
	}
	#print "val = ".$map{$key}."\n";
	#print "largest = ".$largest."\n";
	# add diff line with same value
	if ($map{$key} == $largest) {
		push (@largest_lines, $key);
		next;
	}
	# add largest val line
	if ($map{$key} > $largest) {		# if larger or equal
		$largest = $map{$key};			# update largest num
		$k = $key;
	}
}

if ($largest == -1) {
	exit;
}

push (@largest_lines, $k);	# add line with largest num into array

# numeric ascending sort line indices
@largest_lines = sort {$a <=> $b} @largest_lines;
foreach $index (@largest_lines) {
	print $lines[$index];
}



