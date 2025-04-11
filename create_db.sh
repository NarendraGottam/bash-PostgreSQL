#!/bin/bash

DB_NAME="book_library"
DB_USER="postgres"
DB_HOST="localhost"
DB_PASSWORD="postgres"  # password for DB 

echo "Waiting for PostgreSQL to be ready..."
sleep 10

export PGPASSWORD=$DB_PASSWORD  # password for the session

# Create the database if it doesn't exist
echo "Creating database if not exists..."
psql -h "$DB_HOST" -U "$DB_USER" -d postgres -c "SELECT 1 FROM pg_database WHERE datname = '$DB_NAME'" | grep -q 1 || psql -h "$DB_HOST" -U "$DB_USER" -d postgres -c "CREATE DATABASE $DB_NAME"

# Initialize the database (create tables, users)
echo "Running initialization script..."
psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -f init_db.sql

echo "Running procedures..."
psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -f procedures.sql

echo "Creating views..."
psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -f views.sql

echo "Setup complete!"
