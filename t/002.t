use strict;
use Test::More tests => 1;
use HTML::HiLiter;

my $file = 't/docs/test.html';

my @q = (
    'foo = "quick brown" and bar=(fox* or run)',
    'runner', '"over the too lazy dog"',
    '"c++ filter"', '"-h option"', 'laz', 'fakefox'
);

#select(STDERR);
my $hiliter = HTML::HiLiter->new( Links => 1 );

$hiliter->Queries( \@q, [qw(foo bar)] );
$hiliter->CSS;

ok( $hiliter->Run($file) );
