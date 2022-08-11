CREATE EXTENSION dblink_exec;

DO
$do$
BEGIN
   IF EXISTS (SELECT FROM pg_database WHERE datname = 'breweries') THEN

      RAISE NOTICE 'Database "breweries" already exists. Skipping.';
   ELSE
      PERFORM dblink_exec('dbname=' || current_database()
                        , 'CREATE DATABASE breweries');
   END IF;
END
$do$;

DO
$do$
BEGIN
   IF EXISTS (
      SELECT FROM pg_user
      WHERE  usename = 'admin_1') THEN

      RAISE NOTICE 'User "admin_1" already exists. Skipping.';
   ELSE
      CREATE USER admin_1 WITH ENCRYPTED PASSWORD '12345678';
   END IF;
END
$do$;

GRANT admins TO admin_1;

GRANT CONNECT ON DATABASE breweries TO admins;