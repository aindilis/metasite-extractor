#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

foreach my $file (split /\n/, `find /var/lib/myfrdcsa/codebases/minor/metasite-extractor/data/download-auditing/data-git/downloads/`) {
  if ($file !~ /wget-(STDERR|STDOUT)-\d+.log$/) {
    if (-f $file and -l $file) {
      print "<$file>\n";
    }
  }
}
