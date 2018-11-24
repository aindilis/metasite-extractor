#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Deepcopy = 1;

my $text = read_file('/var/lib/myfrdcsa/codebases/minor/metasite-extractor/sites/data/github.com/johnyf/tool_lists/blob/master/verification_synthesis.md');

# print $text."\n";

my @items = split /href="\#/, $text;

my $names = {};

my @results;
foreach my $item (@items) {
  my @entries = $item =~ /(.*?)<li>(.*?)<\/li>(.*?)/sg;
  while (@entries) {
    my $tmp1 = shift @entries;
    my $target = shift @entries;
    my $tmp2 = shift @entries;
    if ($target =~ /<a href=\"(.*?)"(.*?)>(.*?)<\/a>( \((.*?)\))?:?\s*(.*?)\s*( \((.*?)\))/) {
      my $url = $1;
      my $name = $3;
      my $licenselanguages = $5 || '';
      my $description = $6;
      my $institutions = $8 || '';
      my @institutions;
      my @tmp = split /,\s*/, $institutions;
      foreach my $tmp (@tmp) {
	if ($tmp =~ /<a href="(.*?)"(.*?)>(.*?)<\/a>/) {
	  push @institutions,
	    {
	     URL => $1,
	     Name => $3,
	    };
	} else {
	  push @institutions,
	    {
	     Name => $tmp,
	    };
	}
      }
      my @items = split /\, ?/, $licenselanguages;
      my $license = shift @items || '';
      my $languages = shift @items || '';
      my @languages = split /\s*\/\s*/, $languages;

      my $entry =
	{
	 URL => $url,
	 Name => $name,
	 License => $license,
	 Languages => \@languages,
	 Description => $description,
	 Institutions => \@institutions,
	};
      push @results, $entry;
      $names->{$name} = 1;
    }
  }
}

print Dumper(\@results);
# print Dumper([sort keys %$names]);




# Symbolic
# IVy (MIT, Python): A tool for specifying, modeling, implementing and verifying protocols (MSR, Tel Aviv Univ., UCB)

# extract out the topic, name, link, license, langauge, descriptions and institutions for this software

# cut out the table of contents

# split by # links

