use strict;
use warnings;
use HTML::HiLiter;
use Benchmark qw(:all);
use File::Slurp;

# example:
#                 Rate  hilite-print hilite-buffer
# hilite-print  43.6/s            --           -3%
# hilite-buffer 45.0/s            3%            --

my $html = read_file('t/docs/karman-cpan.html');

open( DEVNULL, ">/dev/null" ) or die "can't pipe to /dev/null";
my $hiliter = HTML::HiLiter->new( query => 'hiliter', fh => *DEVNULL );
my $hiliter_buf = HTML::HiLiter->new( query => 'hiliter', print_stream => 0 );

cmpthese(
    1000,
    {   'hilite-buffer' => sub {
            $hiliter_buf->run( \$html );
        },
        'hilite-print' => sub {
            $hiliter->run( \$html );
        },
    }
);
