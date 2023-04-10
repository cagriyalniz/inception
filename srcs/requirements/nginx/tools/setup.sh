#!/bin/bash

# Start nginx
nginx

# Start MariaDB
mysql_safe --skip-grant-tables &
sleep 5

# Run the command passed to this script
exec "$@"