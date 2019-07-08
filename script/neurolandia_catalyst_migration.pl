#!/usr/bin/env perl

use strict;
use warnings;
use lib 'lib';
use v5.10;
use Neurolandia::Catalyst::CLI::Migration;

my $app = Neurolandia::Catalyst::CLI::Migration->new_with_options;

sub run_populate_db {
    die "[ERROR]: Cannot overwrite database\n" if $app->migrate_db != 1;
    say
        '[SUCCESS]: SQLite database migration has been successfully completed.';
}

sub run_model_and_schema_migration {
    die "[Error]: Cannot overwrite schema file\n"
        if $app->migrate_schema_and_model != 1;
    say
        '[SUCCESS]: Model and Schema file(s) migration has been successfully completed.';
}

if ( $app->migrate != 0 ) {
    run_populate_db;
    run_model_and_schema_migration;
}

elsif ( $app->migrate_and_populate != 0 ) {
    run_populate_db;
    die "[ERROR]: Cannot populate test fixtures into database."
        if $app->populate_db != 1;

    # need to be last because most of the time
    # nobody would delete the model and schema files
    # just to create tables and populate the tables
    # this also will result into unpopulated database
    # which controller_post.t depends on to run properly
    run_model_and_schema_migration;
}

elsif ($app->migrate != 1
    && $app->rollback != 1
    && $app->migrate_and_populate != 1 )
{
    $app->print_usage_text( $app->usage );
}

