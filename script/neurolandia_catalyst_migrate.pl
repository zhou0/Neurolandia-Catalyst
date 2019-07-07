#!/usr/bin/env perl

use strict;
use warnings;

my $sqlite_db_path = './var/database.db';
my $dsn            = $ENV{NEUROLANDIA_DSN} ||= "dbi:SQLite:$sqlite_db_path";
my $user           = $ENV{NEUROLANDIA_USER} ||= '';
my $password       = $ENV{NEUROLANDIA_PASSWORD} ||= '';

if ( $user eq '' || $password eq '' ) {
    if ( -f $sqlite_db_path ) {
        die
            "sqlite database in ./var/ already exists! Remove it manually to continue!\n";
    }
    system("sqlite3 $sqlite_db_path < ./sql/NCSchema.sql");
}
system(
    "./script/neurolandia_catalyst_create.pl model NCModel DBIC::Schema NCSchema create=static '$dsn' on_connect_do='PRAGMA foreign_keys = ON'"
);

