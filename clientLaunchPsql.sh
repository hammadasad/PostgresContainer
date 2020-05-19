#!/bin/bash

# Client container used to connect to postgres server.
docker run -it --rm --link postgresDB:postgres postgres psql -h postgres -U postgres