#!/usr/bin/perl
use warnings;
use strict;

# open file handle
open(FH, '+<', $ARGV[0]) or die $!;

# dump entire file as string
my $file_dump = do { local $/; <FH>};

# modify sim ID
my ($curr_sim_id) = $file_dump =~ /\$dumpfile\((.+)\);/; 
print $curr_sim_id;
if($curr_sim_id !~ /\$dumpfile\(.+_$ARGV[1]\.vcd\);/) {
    $file_dump =~ s/(\$dumpfile\(.+_)\d+.*(\.vcd)/$1$ARGV[1]$2/;
}

# sdf_annotate for post-synthesis only
my $sdf_cmd = q($sdf_annotate("./results/counter.sdf", DUT1, , "./logs/counter_sdf.log", "MAXIMUM"););
if($file_dump =~ /POSTSYN/) {
    $file_dump =~ s/(initial begin\n).*(\$dumpfile.+)/$1\t\t$sdf_cmd\n\t\t$2/;
}
elsif($ARGV[1] !~ /POSTSYN/ and $file_dump =~ /\$sdf_annotate/) {
    $file_dump =~ s/\t\t\Q$sdf_cmd\E\n(.*)/$1$2/;
}

# set termination delay of sim
if(($#ARGV + 1) == 3 and $file_dump !~ /initial #\Q$ARGV[2] \$finish;/) {
    $file_dump =~ s/(initial #)\d+( \$finish)/$1$ARGV[2]$2/;
}

# overwrite file
seek(FH, 0, 0);
print FH "$file_dump";
truncate(FH, tell(FH));

# close file
close(FH);
