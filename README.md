# SYNOPSIS

    package My::Schema::Result::Foo;

    __PACKAGE__->load_components(qw( Relationship::Predicate ... Core ));

    ...

    __PACKAGE__->belongs_to('baz' => 'My::Schema::Result::Baz',  'baz_id');

    __PACKAGE__->might_have(
        'buzz' => 'My::Schema::Result::Buzz',
        { 'foreign.foo_id' => 'self.id' },
        { 'predicate' => 'got_a_buzz' },
    );

    __PACKAGE__->has_many(
        'foo_baz' => 'My::Schema::Result::FooBaz',
        { 'foreign.foo_id' => 'self.id' },
        { 'predicate' => undef },
    );

    __PACKAGE__->has_many('bars' => 'My::Schema::Result::Bar', 'foo_id');

    1;

# DESCRIPTION

[DBIx::Class](https://metacpan.org/pod/DBIx%3A%3AClass) component to automatically create predicates for relationship accessors in a result class.
By default, it creates `"has_${rel_accessor_name}"` methods and injects into the class,
thus for that case we would have 'has\_baz', 'has\_buzz' and 'has\_bars' methods on `$foo` row object. You can
define the name for each one (or also disable its creation using `undef` as value) by setting 'predicate'
key in the relationship's attrs hashref.

    __PACKAGEE_->might_have(
        'buzz' => 'My::Schema::Result::Buzz', 'foo_id',
        { 'predicate' => 'got_a_buzz' }
    );

    or

    __PACKAGEE_->might_have(
        'buzz' => 'My::Schema::Result::Buzz', 'foo_id',
        { 'predicate' => undef }
    );

# AUTHOR

Wallace Reis, `<wreis at cpan.org>`

# BUGS

Please report any bugs or feature requests on the bugtracker website
[https://github.com/wreis/DBIC-Relationship-Predicate/issues](https://github.com/wreis/DBIC-Relationship-Predicate/issues)

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

# SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc DBIx::Class::Relationship::Predicate

You can also look for information at:

- Github Issues

    [https://github.com/wreis/DBIC-Relationship-Predicate/issues](https://github.com/wreis/DBIC-Relationship-Predicate/issues)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/DBIx-Class-Relationship-Predicate](http://annocpan.org/dist/DBIx-Class-Relationship-Predicate)

- CPAN Ratings

    [http://cpanratings.perl.org/d/DBIx-Class-Relationship-Predicate](http://cpanratings.perl.org/d/DBIx-Class-Relationship-Predicate)

- Search CPAN

    [http://search.cpan.org/dist/DBIx-Class-Relationship-Predicate/](http://search.cpan.org/dist/DBIx-Class-Relationship-Predicate/)

# AUTHOR

Wallace Reis, `<wreis at cpan.org>`

# COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Wallace Reis, `<wreis at cpan.org>`.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
