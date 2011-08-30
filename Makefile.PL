#!/usr/bin/env perl

use warnings;
use strict;

use 5.010001;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME       => 'umph',
  DISTNAME   => 'umph',
  VERSION_FROM => 'bin/umph',
  PREREQ_PM => {
'Getopt::ArgvFile' => 1.11,
'XML::DOM' => 1.44,
  },
  BUILD_REQUIRES => {
    'ExtUtils::MakeMaker' => 0,
  },
  CONFIGURE_REQUIRES => {
    'ExtUtils::MakeMaker' => 0,
  },
  MIN_PERL_VERSION => 5.010001,
  ($] >= 5.005 ?
    (ABSTRACT_FROM => 'doc/man1/umph.1.pod',
     AUTHOR => 'Toni Gundogdu <legatvs@cpan.org>') : ()),
  'LICENSE' => 'gpl',
  'EXE_FILES'    => ['bin/umph'],
  'MAN1PODS' =>
    {'doc/man1/umph.1.pod' => '$(INST_MAN1DIR)/umph.$(MAN1EXT)'},
  dist => {
    PREOP => '@if test -f .git/HEAD; then \
	git log --stat --name-only --date=short --abbrev-commit \
		--after="Thu Feb 24 22:09:34 2011" > ChangeLog; \
fi',
    POSTOP => '@if test -f .git/HEAD; then \
	git checkout ChangeLog; \
fi',
  },
);
