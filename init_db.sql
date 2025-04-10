-- table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL
);

-- Admin User
CREATE USER admin_user WITH PASSWORD 'admin_pass';
GRANT ALL PRIVILEGES ON DATABASE book_library TO admin_user;

-- View User
CREATE USER view_user WITH PASSWORD 'view_pass';
GRANT CONNECT ON DATABASE book_library TO view_user;

-- Permissions
GRANT USAGE ON SCHEMA public TO view_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO view_user;
