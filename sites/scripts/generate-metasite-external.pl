#!/usr/bin/perl -w

foreach my $file (split /\n/, `find /var/lib/myfrdcsa/codebases/minor/metasite-extractor/data/download-auditing/data-git/downloads/`) {
  if (-f $file) {
    if ($file !~ /wget-(STDOUT|STDERR)-\d+.log/) {
      print "<$file>\n";
    }
  }
}
