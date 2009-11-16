package DBIx::Class::Relationship::Predicate;

use warnings;
use strict;
use parent 'DBIx::Class';
use Sub::Name ();

=head1 NAME

DBIx::Class::Relationship::Predicate - Predicate methods for relationship accessors

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

   ...
    __PACKAGE__->load_components(qw( Relationship::Predicate ... Core ));
   ...

=head1 DESCRIPTION

=cut

sub register_relationship {
    my ($class, $rel, $info) = @_;
    my $attrs = $info->{'attrs'};
    if (my $acc_type = $attrs->{'accessor'}) {
        if ( defined($attrs->{'predicate'}) || !exists($attrs->{'predicate'}) ) {
            $class->add_relationship_predicate(
                $rel, $acc_type, $attrs->{'predicate'}
            );
        }
    }
    $class->next::method($rel, $info);
}

sub add_relationship_predicate {
    my ( $class, $relname, $accessor_type, $predicate ) = @_;
    $predicate ||= "has_${relname}";
    my $name = join '::', $class, $predicate;

    my $predicate_meth;
    if ( $accessor_type =~ m{single|filter}i ) {
        $predicate_meth = Sub::Name::subname($name, sub {
            return shift->$relname ? 1 : 0;
        });
    } elsif ( $accessor_type eq 'multi' ) {
        $predicate_meth = Sub::Name::subname($name, sub {
            return shift->$relname->count;
        });
    }

    {
        no strict 'refs';
        no warnings 'redefine';
        *$name = $predicate_meth;
    }
}

=head1 AUTHOR

Wallace Reis, C<< <wreis at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-dbix-class-relationship-predicate at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=DBIx-Class-Relationship-Predicate>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc DBIx::Class::Relationship::Predicate

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=DBIx-Class-Relationship-Predicate>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/DBIx-Class-Relationship-Predicate>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/DBIx-Class-Relationship-Predicate>

=item * Search CPAN

L<http://search.cpan.org/dist/DBIx-Class-Relationship-Predicate/>

=back

=head1 COPYRIGHT

Copyright 2009 Wallace Reis.

=head1 LICENSE

This library is free software and may be distributed under the same terms as perl itself.

=cut

1;
