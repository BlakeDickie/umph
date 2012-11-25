# umph
# Copyright (C) 2012  Toni Gundogdu <legatvs@cpan.org>
#
# This file is part of umph <http://umph.googlecode.com/>.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
use warnings;
use strict;

use Test::More;
plan skip_all => 'Define TEST_INTERNET to enable' unless $ENV{TEST_INTERNET};

eval 'use LWP::UserAgent';
plan skip_all => 'LWP::UserAgent required for tests' if $@;

eval 'use XML::DOM';
plan skip_all => 'XML::DOM required for tests' if $@;;

eval 'use Getopt::ArgvFile';
plan skip_all => 'Getopt::ArgvFile required for tests' if $@;;

my $c = "$ENV{HOME}/.umphrc";
diag '~/.umphrc will be read' if -s $c && -r $c;

my @url = qw(
  http://www.youtube.com/playlist?list=PLuzuQWCPP75rIQ7BhECPx4VftKyMwrQUN
  http://www.youtube.com/playlist?list=PL0D48F17F49C3355E
  AAF3A1D0CA1E304F
  http://www.youtube.com/watch?feature=player_embedded&list=PLyALKMPGOR5dJs6G6ZsJslZODdb1G35Eu&v=3N69hRav3WI
  PLlbnzwCkgkTBBXWz595XaKs_kkXek0gQP
  PLn83-N7Bdu2aHMVgBPoJfr0gmvXLVBMlF
);

plan tests => scalar @url;

foreach (@url)
{
  my ($r, $o) = test_url($_);
  is($r, 0, "umph exit status == 0")
    or diag "$_\n$o";
}

sub test_url {
  my ($url) = @_;
  my $C = "perl -I./blib/lib/ blib/script/umph -q 2>&1 $url";
  note "run: $C";
  my $o = join '', qx/$C/;
  my $r = $? >> 8;
  ($r,$o);
}

