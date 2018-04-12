package TestPath::Controller::Two;
use Moose;
use namespace::clean -except => [ 'meta' ];

BEGIN { extends 'Catalyst::Controller' }

sub two :Path() {
    my ( $self, $c ) = @_;
    $c->response->body( 'OK' );
}

__PACKAGE__->meta->make_immutable;
