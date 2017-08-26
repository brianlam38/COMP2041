#!/usr/bin/perl

# use warnings;

# grab args as scalar
$n = $ARGV[0];
$string = $ARGV[1];

# count no. of args
$numArgs = @ARGV;
# print "$numArgs\n";

# run tests
if ($numArgs <= 0 || $numArgs > 2) {
        print "Usage: ./echon.pl <number of lines> <string>\n";
        exit;
} elsif ($n =~ /\D/) {
        print "$0: argument 1 must be a non-negative integer\n";
        exit;
} elsif ($n =~ /^[-]/) {
        print "$0: argument 1 must be a non-negative integer\n";
        exit:
}

# print output
for ($i = 0; $i < $n; $i++) {
        print $string."\n";
}