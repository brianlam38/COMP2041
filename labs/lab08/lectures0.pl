#!/usr/bin/perl

# For each course code argument, print lecture details of the course

use LWP::Simple;

$base = "http://timetable.unsw.edu.au/2017/";
$html = ".html";
foreach $arg (@ARGV) {
        # set up url, get url content, split content by line
        $url = $base.$arg.$html;
        $content = get $url;
        @array = split(/\n/, $content);
        $count = 0;
        # reset @final for each course
        @final = ();
        # grab lecture time string for each course, push in array
	%prev = {};
        foreach $line (@array) {
                if ($line =~ /(<td class="data"><a href="(.*)">Lecture<\/a>)/) {
			# remove all but S1 S2
			$line =~ s/(( *)<td class="data"><a href="#)//g;
			$line =~ s/((-[0-9]*)">Lecture<\/a><\/td>)//g;
			$sem = $line;
			# grab lecture time string
                        $str = $array[$count + 6];
			$str =~ s/(( *)<td class="data">)//g;
			$str =~ s/(<\/td>( *))//g;
			# skip empty lecture details and duplicates
			if ($str eq "" || exists $prev{$str}) {
				#print $str."\n";
				#print $prev."\n";
				$count++;
				next;
			}
			# skip string if no lecture details
			if ($str =~ /([0-9]+\/[0-9]+\*?)/) {
				$count++;
				next;
			}
			$prev{$str} = 1;
                	print $arg.": ".$sem." ".$str."\n";
                }
                $count++;
        }
}
