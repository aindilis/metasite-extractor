#!/usr/bin/perl -w

use MyFRDCSA qw(ConcatDir);
use PerlLib::SwissArmyKnife;

use Version::Compare;

my $dir = '/var/lib/myfrdcsa/codebases/minor/software-finder/data-git/searches';
my $versions = {};
my $bestversions = {};
foreach my $file (split /\n/, `ls -1 $dir`) {
  my $fullfilename = ConcatDir($dir,$file);
  # print $fullfilename."\n";
  my $c = read_file($fullfilename);
  my $data = DeDumper($c);
  # print Dumper($data);
  foreach my $site (@$data) {
    GetLatestOnly(Links => $site->{Links});
  }
}

# print Dumper($versions);

ExtractBestVersions();

sub GetLatestOnly {
  my (%args) = @_;
  my $links = $args{Links};
  foreach my $link (sort @$links) {
    # print $link."\n";
    my $res1 = ExtractVersionNumber(Link => $link);
  }
  # print "\n";
}

sub ExtractVersionNumber {
  my (%args) = @_;
  my $link = $args{Link};
  my $l = $link;
  if ($l =~ /^(.*?)((\.[a-zA-Z]{1,4})\.[a-zA-Z0-9]{1,4})$/) {
    my $l2 = $1;
    my $ext = $2;
    if ($l2 =~ /^(.*?[-_]?)v?([0-9\._-]+)$/) {
      my $basename = $1;
      my $version = $2;
      # print "<$basename><$version><$ext>\n";
      $versions->{$basename}{$version}{$ext} = 1;
    }
  }
}

sub ExtractBestVersions {
  my (%args) = @_;
  print "hey\n";
  foreach my $basename (keys %$versions) {
    my @versions = sort {&Version::Compare::version_compare($b,$a)} keys %{$versions->{$basename}};
    my $bestversion = shift @versions;
    $bestversions->{$basename}{$bestversion} = $versions->{$basename}{$bestversion};
  }
}

# print Dumper($bestversions);

foreach my $basename (keys %$bestversions) {
  foreach my $version (keys %{$bestversions->{$basename}}) {
    foreach my $ext (keys %{$bestversions->{$basename}{$version}}) {
      my $file = $basename.$version.$ext;
      next if $file =~ /github.com/;
      print $file."\n";
      my $command = '/var/lib/myfrdcsa/codebases/minor/metasite-extractor/sites/scripts/download-auditing.sh '.shell_quote($file);
      print $command."\n";
      system $command;
      print "\n";
    }
  }
}

