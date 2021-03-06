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
