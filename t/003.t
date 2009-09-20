use strict;
use Test::More tests => 1;
use HTML::HiLiter;

my $file = 't/docs/test.html';

my @q = (
    'foo = "quick brown" and bar=(fox* or run)',
    'runner', '"Over the Too Lazy dog"',
    '"c++ filter"', '"-h option"', 'laz', 'fakefox'
);

my $hiliter = HTML::HiLiter->new(
    Links => 1,
    Print => 0,

    #debug=>1
);

$hiliter->Queries( \@q, [qw(foo bar)] );
$hiliter->CSS;

ok( $hiliter->Run($file) );

