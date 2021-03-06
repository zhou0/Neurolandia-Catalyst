use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'Test::WWW::Mechanize::Catalyst' => 'Neurolandia::Catalyst' );
    use_ok('Neurolandia::Catalyst::Controller::User');
}

my $root = 'http://127.0.0.1:3000';
my $ua1  = Test::WWW::Mechanize::Catalyst->new;

$ua1->get_ok( $root . '/user/login_form' );
$ua1->title_is('Login | Neurolandia');
$ua1->submit_form(
    fields => {
        email_address => 'admin@email.com',
        password      => 'whatever5'
    }
);
$ua1->title_is('Login Successful | Neurolandia');

$ua1->get_ok( $root . '/user/logout' );
$ua1->title_is('Home | Neurolandia');

done_testing;
