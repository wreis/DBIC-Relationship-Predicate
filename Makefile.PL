use inc::Module::Install;

name     'DBIx-Class-Relationship-Predicate';
all_from 'lib/DBIx/Class/Relationship/Predicate.pm';
author   q{Wallace Reis <wreis@cpan.org>};
license  'perl';

requires 'DBIx::Class';
requires 'parent';
requires 'Sub::Name';

test_requires 'DBD::SQLite';
test_requires 'Test::More';
test_requires 'SQL::Translator' => 0.11006;

auto_install;

WriteAll;

