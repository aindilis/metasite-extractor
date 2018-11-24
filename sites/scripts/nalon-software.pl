#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;
use PerlLib::ToText;
use Capability::NER;

my $string = read_file('/var/lib/myfrdcsa/codebases/minor/metasite-extractor/sites/data/cic.unb.br/~nalon/index.html');
my $totext = PerlLib::ToText->new();

my $res1 = $totext->ToText(String => $string);
# print Dumper({Res1 => $res1});
my $text = $res1->{Text};

$text =~ s/[^[:ascii:]]/ /sg;
# $text =~ s/\x{a}/\n/sg;
$text =~ s/[^a-zA-Z0-9\.]/ /sg;

print $text."\n";
# do NER here

my $ner = Capability::NER->new();

# $ner->StartServer();
# sleep 10;

my $res2 = $ner->NERExtract(Text => $text);
print Dumper({Res2 => $res2});
