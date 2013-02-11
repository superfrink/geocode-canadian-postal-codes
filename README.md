geocode-canadian-postal-codes
=============================

Lookup latitude and longitude for Canadian postal code

A friend does some geographic statistics work. He told me he was manually
entering postal codes into a program one at a time to get the latitude and
longitude.

I figured there might be a module on CPAN. I wrote a short program using
http://search.cpan.org/~jettra/Geo-Coder-Canada-0.01/ Geo::Coder::Canada
for him to use. It reads from STDIN so I just piped a CSV file he gave me
into the program.

The code finds the first postal code on each line of input so it's kind of
smart when fed a full address or quotes around the postal code. A sample run
looks like:<br>


  $ ./geocode-canada.pl
  
  Enter a Canadian Postal Code and press enter.
  Repeat until you are done.  Press control-c or control-d to exit.
  
  t2s 0b3
  t2s 0b3 , Lat: 51.037821        , Long: -114.074626
  t2e0c1
  t2e0c1  , Lat: 51.053263        , Long: -114.045510
  T3C 0X7
  T3C 0X7 , Lat: 51.039459        , Long: -114.092120
  "T3E 0B1"
  T3E 0B1 , Lat: 51.037782        , Long: -114.128998
  
  No postal code found in input
  2500 University Drive N.W.
  No postal code found in input
  Calgary, Alberta,
  No postal code found in input
  T2N 1N4
  T2N 1N4 , Lat: 51.074892        , Long: -114.129012
