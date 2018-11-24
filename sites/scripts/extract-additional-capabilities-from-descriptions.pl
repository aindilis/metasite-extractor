#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;
use PerlLib::ToText;
# use Capability::NER;

use Lingua::EN::Tagger;

my $contents = read_file('output.dat');
my $data = DeDumper($contents);

my @descriptions;
foreach my $entry (@$data) {
  push @descriptions, $entry->{Description};
}

my $text = join("\n",@descriptions);

$text =~ s/[^[:ascii:]]/ /sg;
# $text =~ s/\x{a}/\n/sg;
$text =~ s/[^a-zA-Z0-9\.]/ /sg;

print $text."\n";
# do NER here

# my $ner = Capability::NER->new();

# $ner->StartServer();
# sleep 10;

# my $res2 = $ner->NERExtract(Text => $text);
# print Dumper({Res2 => $res2});

my $tagger = Lingua::EN::Tagger->new();

my $tagged_text = $tagger->add_tags($text);
my @res = $tagger->get_noun_phrases($tagged_text);
# print Dumper(\@res);
my $seen = {};
while (@res) {
  my $nounphrase = shift @res;
  my $count = shift @res;
  $seen->{$nounphrase} = $count;
}

print Dumper([sort keys %$seen]);
