#!/usr/bin/env perl

use warnings;
use strict;

use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME' => 'umph',
    VERSION_FROM => 'bin/umph',
    ( $[ >= 5.8 )
    ? ( AUTHOR => 'Toni Gundogdu <legatvs at sign gmail com>',
        'ABSTRACT' => 'Command line tool for parsing video links from Youtube feeds'
        )
    : (),
    'VERSION_FROM'  => 'bin/umph',
    'EXE_FILES'     => ['bin/umph'],
    'PREREQ_PM'     => {
# Earlier versions may work. The module has been confirmed to work with:
'Getopt::ArgvFile'  => 1.11, # <http://search.cpan.org/perldoc?Getopt::ArgvFile>
'XML::DOM'          => 1.44, # <http://search.cpan.org/perldoc?XML::DOM>
'version'           => 0.77, # <http://search.cpan.org/perldoc?version>
    },
    'LICENSE' => 'gpl'
);
