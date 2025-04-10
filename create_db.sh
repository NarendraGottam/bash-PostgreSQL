#!/bin/bash

DB_NAME="book_library"
DB_USER="postgres"
DB_HOST="localhost"

echo "Waiting for PostgreSQL to be ready..."
sleep 10

echo "Running procedures..."
psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -f procedures.sql

echo "Creating views..."
psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -f views.sql

echo "Setup complete!"
