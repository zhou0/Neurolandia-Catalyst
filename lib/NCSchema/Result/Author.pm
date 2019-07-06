use utf8;

package NCSchema::Result::Author;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

NCSchema::Result::Author

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<author>

=cut

__PACKAGE__->table("author");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
    "id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "name", { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 posts

Type: has_many

Related object: L<NCSchema::Result::Post>

=cut

__PACKAGE__->has_many(
    "posts", "NCSchema::Result::Post",
    { "foreign.author_id" => "self.id" },
    { cascade_copy        => 0, cascade_delete => 0 },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-07-06 23:02:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:S3Rz+izq60xE3P7qwCjoCg

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;