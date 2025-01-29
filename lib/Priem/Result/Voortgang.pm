use utf8;
package Priem::Result::Voortgang;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Priem::Result::Voortgang

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

=head1 TABLE: C<voortgang>

=cut

__PACKAGE__->table("voortgang");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'voortgang_id_seq'

=head2 hoogste_blok

  data_type: 'bigint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "voortgang_id_seq",
  },
  "hoogste_blok",
  { data_type => "bigint", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2025-01-29 03:41:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iMj+dxpuW5fVH37oKi9pDg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
