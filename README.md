Neurolandia::Catalyst
---------------------
Neurolandia::Catalyst is a revamped version of Neurolandia Mojolicious that I made.
It is a blog with typical CRUD operations, authentication and authorization.
No registration is included due to the concept of the web app being similar to the
core Wordpress application.

Requirements
------------
* (first time) Working internet connection to download Perl dependencies
from CPAN (or now, MetaCPAN)
* At least perl 5.10+
* cpanm
* (Optional) Carton

Installing Dependencies
-----------------------
Simply run `cpanm --installdeps .` or if you have Carton, run `carton install`.

Testing
-------
Neurolandia::Catalyst (NC) development sees automated testing as one of the
most important technique for the past and the coming future.

1. First, migrate the schema by running the
./script/neurolandia_catalyst_migrate.pl script.

2. Run ./script/neurolandia_catalyst_test_more.pl to run the tests *after*
you ran the migration script

Local Server
------------
You can see how it works and looks in your browser at http://127.0.0.1:3000 by
running script/neurolandia_catalyst_server.pl.