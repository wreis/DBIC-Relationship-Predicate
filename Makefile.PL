use inc::Module::Install;

name     'DBIx-Class-Relationship-Predicate';
all_from 'lib/DBIx/Class/Relationship/Predicate.pm';
author   q{Wallace Reis <wreis@cpan.org>};
license  'perl';

requires 'DBIx::Class';
requires 'parent';
requires 'Sub::Name';

build_requires 'DBD::SQLite';
build_requires 'Test::More';

auto_install;

WriteAll;

