#!/usr/bin/perl

while ($line = <STDIN>) {
	$line =~ s/[0-9]//g;
	print $line;
}
