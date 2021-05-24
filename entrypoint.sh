#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Create database if it doesn't exist
rake db:create

# Run pending migrations
bin/rails db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
