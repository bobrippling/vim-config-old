#!/usr/bin/perl
use warnings;

for(@ARGV){
	open F, '<', $_ or die "$_: $!\n";
	$lines{$_} = [ sort grep /^\s*hi/, <F> ];
	close F;
}

for(keys %lines){
	print "--- $_ ---\n";
	for(@{$lines{$_}}){
		s/  +/ /g;
		s/^ +//;
		print "$_";
	}
}
