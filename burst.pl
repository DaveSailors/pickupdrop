#!/usr/bin/perl
    $path = "/root/gitstuff/pickupdrop";
    $script = "picture.sh";
    $cmd = "$path/$script";
    for ($i = 0; $i <= 2; $i++)
     {
        print "$i\n";
        print "$cmd\n";
        $return = `$cmd`;
        print "$return\n";  
     }
