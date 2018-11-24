#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

my $contents = read_file('output.dat');
my $data = DeDumper($contents);

foreach my $entry (@$data) {
  WriteFile
    (
     File => 'toget',
     Contents => $entry->{URL},
    );
  my $command = 'radar-web-search --urls toget '.shell_quote($entry->{Name});
  print $command."\n";
  system $command;
}
