DO
$do$
BEGIN
   IF EXISTS (
        SELECT FROM pg_catalog.pg_roles
        WHERE  rolname = 'admins')
      THEN
        RAISE NOTICE 'Role "admins" already exists. Skipping.';
      ELSE
        CREATE ROLE admins;
        RAISE NOTICE 'Role "admins" has been created';
   END IF;
END
$do$;