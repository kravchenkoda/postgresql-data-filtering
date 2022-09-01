#! /usr/bin/env bash
file=./.env
gr=$(grep -c "PGROLE\|PGUSER\|PGHOST\|PGPORT\|PGDATABASE\|PGPASSWORD" $file 2>/dev/null)
scripts=$(ls -v ./sql_scripts/{1..10}_*.sql)
count="./sql_scripts/11_result.sql"
do='$do$'

if
        test -f $file;
then
        if
                 [ "$gr" -lt 6 ]
        then
                           read -p 'Please enter the database name: ' PGDATABASE
                           read -p 'Please enter a role name: ' PGROLE
                           read -p 'Please enter a username: ' PGUSER
                           sudo -u postgres psql postgres -c "SELECT 1 FROM pg_roles WHERE rolname='$PGUSER'" | grep -q 1 \
                           && echo "The user '$PGUSER' already exists in Postgres. Please enter a valid password to avoid password authentication error."
                           read -sp 'Please enter a password: ' PGPASSWORD
                           echo -e "PGDATABASE=$PGDATABASE
                                \nPGROLE=$PGROLE
                                \nPGUSER=$PGUSER
                                \nPGHOST=localhost
                                \nPGPORT=5432
                                \nPGPASSWORD=$PGPASSWORD" > $file

        else
                           echo "The .env file with log in credentials already exists, skipping"
        fi
else
        read -p 'Please enter the database name: ' PGDATABASE
        read -p 'Please enter a role name: ' PGROLE
        read -p 'Please enter a username: ' PGUSER
        sudo -u postgres psql postgres -c "SELECT 1 FROM pg_roles WHERE rolname='$PGUSER'" | grep -q 1 \
        && echo "The '$PGUSER' user already exists in Postgres. Please enter a valid password to avoid password authentication error."
        read -sp 'Please enter a password: ' PGPASSWORD
        touch .env
        echo -e "PGDATABASE=$PGDATABASE
              \nPGROLE=$PGROLE
              \nPGUSER=$PGUSER
              \nPGHOST=localhost
              \nPGPORT=5432
              \nPGPASSWORD=$PGPASSWORD" > $file

fi

set -o allexport
source .env

#Role, user and database creation

sudo -u postgres psql postgres -c "

DO
$do
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname like '$PGROLE')
   THEN
      RAISE NOTICE 'Role $PGROLE already exists, skipping.';
   ELSE
      CREATE ROLE $PGROLE;
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

#Schema creation

PGPASSWORD=$PGPASSWORD psql -h $PGHOST -U $PGUSER -c "
CREATE SCHEMA
    IF NOT EXISTS beer;
GRANT ALL
    ON SCHEMA beer
    TO $PGROLE;
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