#! /usr/bin/perl -w
# project: N/A
# file: geocode-canada.pl
# purpose: find Lat/Lon values from Canadian Postal Code values
#
# created: 2007-03-22 , chad clark , chad.clark AT gmail DOT com
# $Id$

use strict;
use Data::Dumper;
use Geo::Coder::Canada;


print qq/
Enter a Canadian Postal Code and press enter.
Repeat until you are done.  Press control-c or control-d to exit.

/;

LINE: while(my $line = <>) {

    my $postal;
    unless ($line =~ m/([A-Z]\d[A-Z]\s*\d[A-Z]\d)/i) {
	print "No postal code found in input\n";
	next LINE;
    }
    $postal = $1;

    my $g = Geo::Coder::Canada->new;
    $g->postal($postal);

    if ($g->geocode) {

	#print Dumper($g);
	my $result = $g->geo_result();
	my $latitude  = $result->latt;
	my $longitude = $result->longt;

	print $g->postal(), "\t, Lat: " , $latitude , "\t, Long: " , $longitude , "\n";

    } else {

	#print Dumper($g);
	my $geodata = $g->geodata();
	#print Dumper($geodata);
	print $geodata->{error}->{description} ,
	      "(code ", $geodata->{error}->{code} , ")" ,
	      "\n";
    }

}
