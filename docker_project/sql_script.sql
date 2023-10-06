-- Database: users

-- DROP DATABASE IF EXISTS "users";

CREATE DATABASE "users"
    WITH
    OWNER = root
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
-- SCHEMA: users_scheme

-- DROP SCHEMA IF EXISTS users_scheme ;




\connect users;




CREATE SCHEMA IF NOT EXISTS users_scheme
    AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA users_scheme
    IS 'My test schema for skilbox';

GRANT USAGE ON SCHEMA users_scheme TO PUBLIC;

GRANT ALL ON SCHEMA users_scheme TO pg_database_owner;









-- Table: users_scheme.Position

-- DROP TABLE IF EXISTS users_scheme."Position";

CREATE TABLE IF NOT EXISTS users_scheme."Position"
(
    id integer NOT NULL DEFAULT 1,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Position_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS users_scheme."Position"
    OWNER to root;
	
	
	
	
	
-- Table: users_scheme.office

-- DROP TABLE IF EXISTS users_scheme.Office;

CREATE TABLE IF NOT EXISTS users_scheme."Office"
(
    id integer NOT NULL DEFAULT 1,
    "number" integer NOT NULL,
    phone character varying COLLATE pg_catalog."default",
	CONSTRAINT "office_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS users_scheme."Office"
    OWNER to root;











-- Table: users_scheme.Employee

-- DROP TABLE IF EXISTS users_scheme."Employee";

CREATE TABLE IF NOT EXISTS users_scheme."Employee"
(
    id integer NOT NULL DEFAULT 1,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    grade integer NOT NULL,
    salary integer NOT NULL,
    office_id integer,
    position_id integer,
    CONSTRAINT "Employee_pkey" PRIMARY KEY (id),
	FOREIGN KEY (office_id) REFERENCES users_scheme."Office" (Id) ON DELETE SET NULL ON UPDATE NO ACTION,
	FOREIGN KEY (position_id) REFERENCES users_scheme."Position" (Id) ON DELETE SET NULL ON UPDATE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS users_scheme."Employee"
    OWNER to root;
	






