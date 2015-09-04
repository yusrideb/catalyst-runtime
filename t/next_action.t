use warnings;
use strict;
use HTTP::Request::Common;

{
  package MyApp::Controller::Root;
  $INC{'MyApp/Controller/Root.pm'} = __FILE__;

  use Moose;
  use MooseX::MethodAttributes;

  extends 'Catalyst::Controller';

  sub one :Chained(/) CaptureArgs(0) { 
    my ($self, $c) = @_;
    warn 1;
    warn $c->next(2);
    warn 3
  }

  sub two :Chained(one) CaptureArgs(0) { 
    my ($self, $c) = @_;

    warn $c->state;
    warn $c->next(5);
    warn 3
  }

  sub three :Chained(two) Args(0) { 
    my ($self, $c) = @_;
    warn 1;
    warn $c->next(2);
    warn 3
  }

  MyApp::Controller::Root->config(namespace=>'');

  package MyApp;
  use Catalyst;

  MyApp->setup;
}

use Catalyst::Test 'MyApp';

{
  my $res = request '/an_int/1';
  is $res->content, 'an_int';
}


done_testing;
