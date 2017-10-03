#!/usr/bin/perl
#comments = #
#var=$var
#while=while
#echo=print()

# Translate simple Bash Shell script into a Perl script

# open bash file
$file = $ARGV[0];
open F, '<', $file;

@perl;
%values;
foreach $line (<F>) {
	# initial line for interpreter
	if ($line eq "#!/bin/bash\n") {
		push(@perl, '#!/usr/bin/perl -w');
		next;
	}
	# copy empty newlines
	if ($line eq "\n") {
		push(@perl, "\n");
		next;
	}

	@array = split('', $line);
	# copy comment lines
	if ($array[0] eq '#') {
		push(@perl, $line);
		next;
	}

	# remove bash syntax lines DO, DONE
	if ($line eq 'do' || $line =~ /(then)/) {
		next;
	}

	# copy var decl + init
	# var=value
	if ($line =~ /([a-zA-Z]+=[0-9])/) {
		$var = $line;
		$val = $line;
		$var =~ /(^[a-zA-Z]+)/; $var_pl = $1;
		$val =~ /([0-9]+$)/; $val_pl = $1;
		$values{$var_pl} = $val_pl;
		$str = '$'.$var_pl.'='.$val_pl.';'."\n";
		#print "string = ".$str;
		push(@perl, $str);
		next;
	}

	# copy while loop
	if ($line =~ /(while)/ || $line =~ /(if)/ || $line =~ /(else)/) {
		if ($line =~ /(else)/) {
			$line =~ s/^\s//g;
			chomp($line);
			$line = "    }"." ".$line." {\n";
			push(@perl, $line);
			next;
		}
		$new = $line;
		$new =~ s/^\s//g;
		$new =~ s/[\(]//; $new =~ s/[\)]//;		# change (()) to ()

		$cmp1 = $new;
		$cmp2 = $new;
		$cmp1 =~ s/(.* \()//; $cmp1 =~ s/ .*//; # grab comparison var 1
		$cmp2 =~ s/.* //; $cmp2 =~ s/\)//;		   # grab comparison var 2
		chomp($cmp1); chomp($cmp2);
		if ($cmp1 =~ /[a-z]/) {					# if var -> add $
			$new =~ s/\($cmp1/\(\$$cmp1/;		# else nothing
		} else {
			$new =~ s/\($cmp1/\($cmp1/;		
		}
		if ($cmp2 =~ /[a-z]/) {					# if var -> add $
			$new =~ s/$cmp2\)/\$$cmp2\) {/;		# else nothing
		} else {
			$new =~ s/$cmp2\)/$cmp2\) {/
		}
		#print $new;
		if ($new =~ /(if)/) {
			$new = "    ".$new;
		}
		push (@perl, $new);
		# copy code block inside while loop
	}

	# copy arithmetic
	@array = split('=', $line);		# grab var
	$array[0] =~ s/^\s*//g;			# remove indentation
	if (exists($values{$array[0]})) {
		if ($line =~ /\$\(\(/) {
			$line =~ /([+\-\*\/])/;
			$operator = $1;
			$val1 = $line;
			$val2 = $line;	
			$val1 =~ s/.*\$\(\(//;	# grab LHS var of formula
			$val1 =~ s/ .*//; chomp($val1);
			$val2 =~ s/.* //;		# grab RHS var of formula
			$val2 =~ s/\)\)//; chomp($val2);
			if ($val1 =~ /[a-z]/) {
				$val1 = "\$".$val1;
			}
			if ($val2 =~ /[a-z]/) {
				$val2 = "\$".$val2;
			}
			$str = "        \$".$array[0]." = ".$val1." ".$operator." ".$val2.";"."\n";
			push(@perl, $str);
		}
	}

	# copy closing loop
	if ($line eq "done\n") {
		push(@perl, "}\n");
	}

	# copy closing if statement
	if ($line =~ /fi$/) {
		push(@perl, "    }\n");
	}

	# copy echo
	#@array = split(' ', $line);
	if ($line =~ /echo/) {
		$line =~ s/(.*echo )//;
		chomp($line);
		$str = "    print \"".$line."\\n\";\n";
		push(@perl, $str);
	}
}

# complete bash -> perl output
#$count = 0;
#foreach $item (@perl) {
#	print $count." ".$item;
#	$count += 1;
#}

foreach $item (@perl) {
	print $item;
}

# checking var val pairs are correct
#print "\n"."VAR VAL PAIRS"."\n";
#foreach $key (keys %values) {
#	print $key." = ".$values{$key}."\n";
#}




