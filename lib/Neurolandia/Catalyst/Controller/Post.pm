package Neurolandia::Catalyst::Controller::Post;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Neurolandia::Catalyst::Controller::Post - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( {template => 'post/list.tt', posts => [$c->model('NCModel::Post')->all]} );
}

sub show :Chained('/') :PathPart('post/show') :Args(1) {
    my ( $self, $c, $id ) = @_;

    my $post = $c->model('NCModel::Post')->find({id => $id});
    
    $c->stash( {template => 'post/show.tt', post => $post} );
}

sub create_form :Local {
    my ( $self, $c ) = @_;
    
    $c->stash( {template => 'post/create_form.tt'} );
}

sub create :Local {
    my ( $self, $c ) = @_;

    my $title = $c->request->params->{title};
    my $content = $c->request->params->{content};
    my $author = $c->request->params->{author};

    my $post = $c->model('NCModel::Post')->create({
        title => $title,
        content => $content,
        author => $author,
                                                  });

    $c->stash( {template => 'post/create_done.tt', post => $post} );
}

sub edit_form :Chained('/') :PathPart('post/edit_form') :Args(1) {
    my ( $self, $c, $id ) = @_;

    my $post = $c->model('NCModel::Post')->find( {id => $id} );

    $c->stash( {template => 'post/edit_form.tt', post => $post} );
}

sub edit :Local {
    my ( $self, $c ) = @_;

    my $post_id = $c->request->params->{id};
    my $title = $c->request->params->{title};
    my $content = $c->request->params->{content};
    my $author = $c->request->params->{author};

    my $post = $c->model('NCModel::Post')->find({id => $post_id});
    $post->title($title);
    $post->content($content);
    $post->author($author);
    $post->update;

    $c->stash( {template => 'post/edit_done.tt', post => $post} );
}

sub delete :Chained('/') :PathPart('post/delete') :Args(1) {
    my ( $self, $c, $id ) = @_;

    $c->model('NCModel::Post')->find({id => $id})->delete;

    $c->stash( {template => 'post/delete_done.tt'} );
}

=encoding utf8

=head1 AUTHOR

momozor,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
