use utf8;
package Priem::Result::Priem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Priem::Result::Priem

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::InflateColumn::DateTime::Duration>

=back

=cut

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "InflateColumn::DateTime::Duration",
);

=head1 TABLE: C<priem>

=cut

__PACKAGE__->table("priem");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'priem_id_seq'

=head2 prime

  data_type: 'bigint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "priem_id_seq",
  },
  "prime",
  { data_type => "bigint", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<priem_prime_key>

=over 4

=item * L</prime>

=back

=cut

__PACKAGE__->add_unique_constraint("priem_prime_key", ["prime"]);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2025-01-29 03:41:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qZs5AG9T3Yza/NkItzTk4w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
