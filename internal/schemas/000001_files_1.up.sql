--DROP TABLE IF EXISTS users CASCADE;
--DROP TABLE IF EXISTS news CASCADE;
DROP TABLE IF EXISTS schema_migrations;

CREATE EXTENSION IF NOT EXISTS CITEXT;

-- Especially We think about users in this sql file, i forgot naming users_sql :)
CREATE TABLE users (
   user_id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
   first_name CITEXT NOT NULL CHECK (first_name <> ''),
   last_name VARCHAR(32) NOT NULL CHECK (last_name <> ''),
   email VARCHAR(64) UNIQUE NOT NULL CHECK (email <> ''),
   password VARCHAR(250) NOT NULL CHECK (octet_length(password) <> 0),
   role VARCHAR(10) NOT NULL DEFAULT 'user',
   about TEXT DEFAULT '',
   avatar VARCHAR(512),
   phone_number VARCHAR(20),
   address VARCHAR(250),
   city VARCHAR(30),
   country VARCHAR(30),
   gender VARCHAR(20) NOT NULL DEFAULT 'male',
   postcode INT,
   birthday DATE DEFAULT NULL,
   created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
   updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
   login_date TIMESTAMP(0) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);