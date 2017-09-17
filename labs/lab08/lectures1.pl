#!/usr/bin/perl

# For each course code argument, print lecture details of the course

use LWP::Simple;

@last = ();

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
                	push(@last, $arg.": ".$sem." ".$str."\n");
                }
                $count++;
        }
}

%hash = {};
foreach $item (@last) {
	$prev;
	if ($ARGV[0] eq '-d') {
		$item =~ /(S1|S2)/;
		$sem = $1;
		@array = split(/ /, $item);
		$count = 0;
		foreach $n (@array) {
			if ($n =~ /(Mon|Tue|Wed|Thu|Fri)/) {
				$day = $1;
				$start = $array[$count + 1];
				$end = $array[$count + 3];
				$start =~ s/:00//;
				$end =~ s/:00//;
				$hours = $end - $start;
				$ctr = 0;
				$course = $array[0];
				$course =~ s/://;
				while ($ctr < $hours) {
					$newStart = 0;
					$newStart = $start + $ctr;
					$str = $sem." ".$course." ".$day." ".$newStart."\n";
					if (exists $hash{$str}) {
						$ctr++;
						next;
					}
					print $str;
					push(@n, $str);
					$hash{$str} = 1;
					$ctr++;
				}
			}
			$count++;
		}
	} else {
		print $item;
	}
}
