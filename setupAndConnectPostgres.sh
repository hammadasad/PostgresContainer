#!/bin/bash

# Downloads image and run the postgres server container
# maps to 5432 on the host
# container name is postgresDB
# creates a volume on the host (psql) that maps to container's data
# no password required for the user
# latest postgres version pulled 
docker container run -itd --name postgresDB -p 5432:5432 -v psql:/var/lib/postgresql/data -e POSTGRES_HOST_AUTH_METHOD=trust postgres

# Give time for the server to setup with its volume, to allow client to connect
sleep 3

# temporary client container that connects to our server above
# user is postgres
# use '\c' command to connect as postgres user while in client
docker run -it --rm --link postgresDB:postgres postgres psql -h postgres -U postgres