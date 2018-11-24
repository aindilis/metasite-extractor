#!/usr/bin/perl -w

use PerlLib::Util qw (SaveDataToFile);
use PerlLib::HTMLConverter;

use Data::Dumper;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new;
my $converter = PerlLib::HTMLConverter->new();

foreach my $site (@ARGV) {
  print "<$site>\n";
  #   SaveDataToFile
  #     (Append => 1,
  #      Data => $site,
  #      File => "/var/lib/myfrdcsa/codebases/internal/radar/data/metasites");

  # should really archive the site in the system somehow
  $mech->get($site);

  #   # attempt various ways now to extract the systems
  #   my $text;
  my $f = "/tmp/metasite.htm";
  #   if (0) {
  #     $text = $converter->ConvertToTxt
  #       (Contents => $mech->content);
  #   } else {
      SaveDataToFile
        (Data => $mech->content,
         File => $f);
      $text = `lynx -width 200 -dump "$f"`;
  #   }
  #   # print $text."\n";
  my @links = $mech->find_all_links;
  # just assume that each link is a system, and then extract the text after it

  # develop statistical model of names and descriptions to determine real ones

  my @systems;
  foreach my $link (@links) {
    my $name = $link->text;
    my $regex = $name;
    $regex =~ s/(\W)/\\$1/g;
    my $desc = "";
    if ($text =~ /\[\d+\]$regex\s*(.*?)\n/s) {
      $desc = $1;
    }
    push @systems,
      {
       Name => $name,
       Description => $desc,
       URL => $link->URI->abs->as_string,
      };
  }
  my $data = Dumper(\@systems);
  #   # actually do subsetselect
  #   SaveDataToFile
  #     (Append => 1,
  #      Data => $data,
  #      File => "/var/lib/myfrdcsa/codebases/internal/radar/data/metasite-links");
  print $data."\n";
}
