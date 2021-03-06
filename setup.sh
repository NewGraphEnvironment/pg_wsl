#!/bin/bash
set -euxo pipefail




# change to postgres user, alter password
sudo su - postgres
psql -c "alter user postgres with password 'postgres'"
# create a new general user for the db
createuser -P -s -e newgraph
# create new db to do stuff in
createdb postgis
# exit postgres user
exit

# save pg typing
echo 'export PGDATA=/etc/postgresql/13/main' >> ~/.profile
echo 'export PGHOST=localhost' >> ~/.profile
echo 'export PGPORT=5434' >> ~/.profile
echo 'export PGDATABASE=postgis' >> ~/.profile
echo 'export PGUSER=newgraph' >> ~/.profile
echo 'export PGPASSWORD=postgres' >> ~/.profile
echo 'export DATABASE_URL=postgresql://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE' >> ~/.profile
echo "export PGOGR='host=$PGHOST user=$PGUSER dbname=$PGDATABASE password=$PGPASSWORD port=$PGPORT'" >> ~/.profile
source .profile

# open up the database to the world
echo "local  all  all                trust" >> $PGDATA/pg_hba.conf
echo "host   all  all  127.0.0.1/32  trust" >> $PGDATA/pg_hba.conf
echo "host all all 0.0.0.0/0 md5" >> $PGDATA/pg_hba.conf
echo "listen_addresses = '*'" >> /etc/postgresql/13/main/postgresql.conf
