#!/usr/bin/perl -w

# from https://superuser.com/questions/613576/how-to-know-the-the-size-of-a-file-before-downloading-it

use LWP::UserAgent;

sub GetFileSize{
    my $url=shift;
    $ua = new LWP::UserAgent;
    $ua->agent("Mozilla/5.0");
    my $req = new HTTP::Request 'HEAD' => $url;
    $req->header('Accept' => 'text/html');
    $res = $ua->request($req);
    if ($res->is_success) {
	   my $headers = $res->headers;
	   return $headers;
       }
       return 0;
}

$link = $ARGV[0]; # 'http://www.domain.com/anyfile.zip';
$header = GetFileSize($link);

print "File size: " . $header->content_length . " bytes\n";
print "Last modified: " . localtime($header->last_modified) . "\n";
exit;

