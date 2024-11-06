#!/usr/local/bin/perl
# ==================================================================
#
# Written by Dave Sailors
#
# ==================================================================
print "Content-type: text/html\n\n"; 
print "<html>\n";
print "<table border 1>\n";


$skip = "NO";

foreach $env (%ENV)

{
 if ($skip eq "NO")
  {
     print "<tr><td>$env = $ENV{$env}<br></td></tr>";
     $skip = "YES";
  }
  else
    {
      $skip = "NO";
    }
}


print "</table>\n";
print "</body></html>\n";