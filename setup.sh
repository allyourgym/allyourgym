#!/bin/bash

set -e

# Variables
DB_CONTAINER_NAME="allyourgym_postgres_dev"
DB_USER="dev_user"
DB_PASSWORD="dev_password"
DB_NAME="allyourgym_dev"
PG_VOLUME="${PWD}/pgdata_dev"

# Step 1: Remove existing PostgreSQL container if running
if [ "$(docker ps -q -f name=$DB_CONTAINER_NAME)" ]; then
  echo "Stopping and removing existing PostgreSQL container..."
  docker stop $DB_CONTAINER_NAME
fi

# Step 2: Run PostgreSQL in Docker
echo "Starting PostgreSQL container..."
docker run --rm -d \
  --name $DB_CONTAINER_NAME \
  -e POSTGRES_USER=$DB_USER \
  -e POSTGRES_PASSWORD=$DB_PASSWORD \
  -e POSTGRES_DB=$DB_NAME \
  -v $PG_VOLUME:/var/lib/postgresql/data \
  -p 5433:5432 \
  postgres:alpine

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to be ready..."
until PGPASSWORD=$DB_PASSWORD psql -U $DB_USER -h localhost -p 5433 -c "\q" $DB_NAME; do
  echo "PostgreSQL is unavailable - retrying in 1 second..."
  sleep 1
done
echo "PostgreSQL is ready."

# Step 3: Run migrations locally
echo "Running database migrations locally..."
DATABASE_URL=postgres://$DB_USER:$DB_PASSWORD@localhost:5433/$DB_NAME mix ecto.migrate

# Step 4: Start the app locally
echo "Starting the application locally..."
DATABASE_URL=postgres://$DB_USER:$DB_PASSWORD@localhost:5433/$DB_NAME mix phx.server
