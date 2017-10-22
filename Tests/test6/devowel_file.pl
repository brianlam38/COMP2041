#!/usr/bin/perl

$file = $ARGV[0];

open FILE, '<', $file;

@final;
foreach $line (<FILE>) {
	@array = split("", $line);
	foreach $i (@array) {
		if ($i =~ /[aeiouAEIOU]/) {		
			next;
		}
		push(@final, $i);
	}
}
close FILE;

#/a.*e.*i.*o.*u/

open FILE, '>', $file;
print FILE @final;
close FILE;
