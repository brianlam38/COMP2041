#!/usr/bin/perl

@array;

foreach $arg (@ARGV) {
        push(@array, $arg);
}

@sorted;
foreach $arg (sort {$a <=> $b} @array) {
        push(@sorted, $arg);
}

$num_args = @sorted;

$num_args = $num_args / 2;
#print $num_args."\n";

print $sorted[$num_args]."\n";
