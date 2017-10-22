#!/usr/bin/perl

#@args = @ARGV;
#print @args;

@args;

foreach $arg (@ARGV) {
	#print $arg."\n";
	push(@args, $arg);
}

@sorted;
foreach $i (sort { $a <=> $b } @args) {
	#print("sorting = ".$i."\n");
	push(@sorted, $i);
}

$len = @sorted;
$len = $len/2;
$len = int($len);

print @sorted[$len]."\n";
