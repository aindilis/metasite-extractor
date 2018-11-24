#!/usr/bin/perl -w

use lib "/var/lib/myfrdcsa/sandbox/ccm-web-3/ccm-web-3/src";

use MyFRDCSA qw ( Dir ConcatDir );

use strict;
use warnings;
use CCM::Common;
use CCM::Debug;
use CCM::Util;
use CCM::CCM;
use HTML::TreeBuilder;
use Getopt::Long;

use Data::Dumper;
use XML::Simple;

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
  # do a wget here
  # system "cd $datadir && wget \"$site\"";
  # my $data = get( $site );
  # my $mdr = MDR->new(Contents => $data);
  # $mdr->ExtractRecords;
  Extract();
}

LoadMetasitesFromRADAR;
ProcessMetasites;

my $percent = 0.3; 

sub Extract {
  my $help = 0;
  my $keyword = 0;
  my $datadir = 0;
  GetOptions ('h|help' => \$help,
	      'k|keyword=s' => \$keyword,
              'd|datadir=s' => \$datadir);
  $datadir =~ s/(\'|\")(.*)(\'|\")/$2/;
  if ($help) {
    show_help;
    return;
  }
  if ($keyword && $datadir) {
    if (!validate_input($datadir)) {
      print "Invalid input: $datadir does not exist.\n";
      return;
    }
  }  
  elsif (!$keyword && !$datadir) {
    show_help;
    print "\n\n";
    $keyword = 'the';
    $datadir = '/var/lib/myfrdcsa/codebases/minor/metasite-extractor/data/ccm';
  }
  else { #invalid input
    show_help;
  }
  my %site_pages = get_site_pages($datadir);
  my @page_list;
  foreach my $site (keys %site_pages) {
    my @pages = @{$site_pages{$site}};
    foreach my $page (@pages) {
      push @page_list, "$site/" . $page;
    }
  }
  my $num_list;
  my $page_list_str;
  my $options;
  for my $i (1 .. ($#page_list + 1)) {
    $page_list_str .= $i . ": " . $page_list[$i-1] . "\n";
    $num_list .= $i . ', ';
    $options .= $i . "_";
  } 
  print <<Desc;
Sample test for CCM algorithm, please press ${num_list}or a.
$page_list_str
a: Test all sites.
Your choice (${num_list}a)?
Desc
  my $char;
  
#Note this input style does not work in Emacs shell.
  while (1) {
    $char = <STDIN>;
    chomp $char;
    last if (($options =~ /$char/) || 'a' eq $char);
  }

  my @option_list = split(/_/,$options);
  if ($char eq 'a') {
    foreach my $option (@option_list) {
      next if (length $option < 1);
      test_seed_page_extraction($datadir, $datadir . "/" . $page_list[$option - 1], $keyword);
    }
    return;
  }
  my $pagepath = $datadir . "/" . $page_list[$char - 1];
  print "-$pagepath-" if !(-e $pagepath);
  print Dumper([$datadir,$pagepath,$keyword]);
  test_seed_page_extraction($datadir, $pagepath, $keyword);
}

sub test_seed_page_extraction($$$){
  my ($datapath, $filepath, $keyword) = @_;
  print "Data records extraction for $filepath\n\n";
  my %site_pages = get_site_pages($datapath);
  my ($ranked_ref, $phrase_list_ref) = extract_phrases_from_site_pages($datapath, $keyword, %site_pages);
  my %ranked_phrase_list = %$ranked_ref;

  my @phrase_list = get_phrase_list_from_file($filepath, $keyword);
  #trace("phrase list: $#phrase_list");
  my ($tree, $records_list_ref, $boundary_info_list_ref, $unmatched_list_ref) = extract_seed_page($filepath, $keyword, 0.3, @phrase_list, %ranked_phrase_list);
  my @records_list = @$records_list_ref;
  my %boundary_info_list = %$boundary_info_list_ref;
  my @unmatched_list = @$unmatched_list_ref;
  my $count = $#records_list + 1;
  print "total number of record_list: $count.\n";
  output_records_list(@records_list);
  #output_unmatched_list(@unmatched_list);
  #trace("end test for single page matching...");
  $tree->delete;
}

sub validate_input{
  my ($path) = @_;
  return 1 if (-e $path && -d $path);
  return 0;
}

sub show_help{
  print <<HELP;
CCMTest.pl is to test data record extraction algrithm CCM (Cross-site Content based data record Mining).
To use, conduct keyword search on several websites of the same domain, put HTML result pages of each site into a separate directory and put all site directories under one directory. For example, a sample data directory will be:
c:/ccm-web/data/book/java/amazon/result1.htm
                         result2.htm
c:/ccm-web/data/book/java/barnes_noble/result1.htm
                               result2.htm
Usage:
CCMTest.pl [options]
--keyword   the search key word
--datadir   the data directory
--help      display this help information
Example: CCMTest.pl --keyword=Java --datadir='../data/book/java'

If no options are prvoided, sample data will be tested, which is the same as running:
CCMTest.pl --keyword=Java --datadir='../data/book/java'
HELP
}

exit 0;
