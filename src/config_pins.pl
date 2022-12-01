#!/usr/bin/perl
use warnings;
use strict;

# open file handle
open(FH, '+<', $ARGV[0]) or die $!;

# dump entire file as string
my $file_dump = do { local $/; <FH>};

# exit if pins exist
if($file_dump =~ /VDD|VSS/) {
    exit 0;
}

# insert VDD, VSS pins
$file_dump =~ s/(module.+\()\s*(.+)/$1 VDD, VSS, $2/;
$file_dump =~ s/(output.+;)\s*(.+)/$1\n  inout VDD, VSS;\n  $2/;
$file_dump =~ s/(wire)\s*(.+)/$1 VDD, VSS, $2/;
$file_dump =~ s/(\( )\s*(\..+)/$1.VDD(VDD), .VSS(VSS), $2/g;

# overwrite file
seek(FH, 0, 0);
print FH "$file_dump";
truncate(FH, tell(FH));

# close file
close(FH);
