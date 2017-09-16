#!/usr/bin/perl

# scraping course codes
# print course codes with a given prefix of all UNSW courses

# form URL
use LWP::Simple;
$base = "http://timetable.unsw.edu.au/2017/";
$course = $ARGV[0];
$kens = "KENS.html";
$url = $base.$course.$kens;

# grab HTML string with LWP
$content = get $url;

# loop through html text, target lines with course codes
# push the regex into @final array
$prev = "";
@array = split(/\n/, $content);
foreach $line (@array) {
	if ($line =~ /($course[0-9]{4})/) {
		if ($prev ne $1) {
			print $1."\n";
			$prev = $1;
		}
	}
}


