use inc::Module::Install;

name     'DBIx-Class-Relationship-Predicate';
all_from 'lib/DBIx/Class/Relationship/Predicate.pm';
author   q{Wallace Reis <wreis@cpan.org>};
license  'perl';

test_requires 'DBD::SQLite';
test_requires 'Test::More';
test_requires 'SQL::Translator' => 0.11006;

requires 'DBIx::Class';
requires 'parent';
requires 'Sub::Name';

auto_install;

WriteAll;

