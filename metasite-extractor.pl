#!/usr/bin/perl -w

use MyFRDCSA qw ( Dir ConcatDir );
use MDR;

use Data::Dumper;
use HTTP::Cache::Transparent;
use LWP::Simple;
use XML::Simple;

HTTP::Cache::Transparent::init
  ({
    BasePath => '/var/lib/myfrdcsa/codebases/minor/metasite-extractor/data/cache',
   });

my $metasites;

sub LoadMetasitesFromRADAR {
  my $systems = ConcatDir(Dir("internal codebases"),"radar","data","systems.dat");
  my $contents = "<systems>".`cat "$systems"`."</systems>";
  # use an xml tool here
  $metasites = XMLin($contents)->{item};
}

sub ProcessMetasites {
  foreach my $entry (@$metasites) {
    if ($entry->{class} =~ /metasite/i) {
      ExtractRecords($entry->{url});
    }
  }
}

sub ExtractRecords {
  my $site = shift;
  my $data = get( $site );
  my $mdr = MDR->new(Contents => $data);
  $mdr->ExtractRecords;
}

if (@ARGV) {
  foreach my $url (@ARGV) {
    ExtractRecords($url);
  }
} else {
  LoadMetasitesFromRADAR;
  ProcessMetasites;
}
