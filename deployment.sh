#! /usr/bin/env bash

var_f=./.env
password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
scripts=$(ls -v ./sql_scripts/{1..11}_*.sql)
count="./sql_scripts/12_result.sql"
do='$do$'

set -x

#Random password generation
if grep -L "PGPASSWORD" $var_f
     then echo -e "\nPGPASSWORD='$password'" >> $var_f
fi

#Role, user and database creation
set -o allexport
source .env

sudo -u postgres psql postgres -c "

DO
$do
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname like '$PGROLE')
   THEN
      RAISE NOTICE 'Role $PGROLE already exists. Skipping.';
   ELSE
      CREATE ROLE admins;
      RAISE NOTICE 'Role $PGROLE has been created';
   END IF;
END
$do;

CREATE EXTENSION IF NOT EXISTS dblink;

DO
$do
BEGIN
   IF EXISTS (
      SELECT FROM pg_database
      WHERE datname = '$PGDATABASE')
   THEN
      RAISE NOTICE 'Database $PGDATABASE already exists. Skipping.';
   ELSE
      PERFORM dblink_exec('dbname=' || current_database(), 'CREATE DATABASE $PGDATABASE');
      RAISE NOTICE 'Database $PGDATABASE has been created';
   END IF;
END
$do;

DO
$do
BEGIN
   IF EXISTS (
      SELECT FROM pg_user
      WHERE  usename like '$PGUSER')
   THEN
      RAISE NOTICE 'User $PGUSER already exists. Skipping.';
   ELSE
      CREATE USER $PGUSER WITH ENCRYPTED PASSWORD '$PGPASSWORD';
      RAISE NOTICE 'User $PGUSER has been created';
   END IF;
END
$do;

GRANT $PGROLE TO $PGUSER;
GRANT ALL ON DATABASE $PGDATABASE TO $PGROLE;
"

#Inerting data and tables creation
for file in $scripts
do
      psql -A -f "$file";
done

#Corrupted and clear rows count
psql -A -f $count > result.txt;

set +o allexport

cat result.txt

set +x