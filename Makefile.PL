#!/usr/bin/env perl

use warnings;
use strict;

use 5.008009;
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
    'LICENSE' => 'gpl',
    'MAN1PODS' =>
        { 'man1/umph.1.pod' => '$(INST_MAN1DIR)/umph.$(MAN1EXT)' },
    dist => {
        PREOP =>
'@if test -f .git/HEAD; then \
	git log --stat --after="Thu Feb 24 22:09:34 2011" >ChangeLog; \
fi',
        POSTOP   =>
'@if test -f .git/HEAD; then \
	git checkout ChangeLog; \
fi',
    },
);
