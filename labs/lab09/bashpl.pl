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
	if ($line eq '#!/bin/bash') {
		push(@perl, '#!/bin/perl -w');
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

	# copy var decl + init
	# var=value
	if ($line =~ /([a-zA-Z]+=[0-9])/) {
		$var = $line;
		$val = $line;
		$var =~ /(^[a-zA-Z]+)/; $var_pl = $1;
		$val =~ /([0-9]+$)/; $val_pl = $1;
		$values{$var} = $val;
		$str = '$'.$var_pl.'='.$val_pl.';'."\n";
		#print "string = ".$str;
		push(@perl, $str);
	}
}

# complete bash -> perl output
$count = 0;
foreach $item (@perl) {
	print $count." ".$item;
	$count += 1;
}

# checking var val pairs are correct
print "\n"."VAR VAL PAIRS"."\n";
foreach $key (keys %values) {
	print $values{$key};
}

# print perl file
#open PERL, '<', $perl;
#foreach $line (<PERL>) {
#	print $line;
#}





