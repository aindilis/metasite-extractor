#!/usr/bin/perl -w

use BOSS::Config;
use PerlLib::SwissArmyKnife;

use WWW::Mechanize;
use WWW::Mechanize::Link;

$specification = q(
	-u <url>		URL to parse
);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;
# $UNIVERSAL::systemdir = "/var/lib/myfrdcsa/codebases/minor/system";

if (exists $conf->{'-u'}) {
  my $mech = WWW::Mechanize->new();
  $mech->get($conf->{'-u'});
  foreach my $link ($mech->links) {
    print $link->URI->abs."\n";
  }

}
