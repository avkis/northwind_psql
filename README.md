# Northwind database for Postgres
### Northwind business scheme

<img src=images/scheme.png />

A simple sql script that will populate a database with the famous northwind example, adapted for postgres.

<img src=images/ER.png />

## Getting started:

### Manually

Use the provided sql file `nortwhind.sql` in order to populate your database.

### With Docker and docker compose

#### Pre-requirement: install docker and docker-compose

 https://www.docker.com/get-started

 https://docs.docker.com/compose/install/

#### Pre-requirement: define environment variable DATA_PATH_HOST
````bash
# Add this line to your .bashrc file
export DATA_PATH_HOST=/path/to/your/storage
````

#### Pre-requirement: change owner for pgadmin storage folder

 https://www.pgadmin.org/docs/pgadmin4/latest/container_deployment.html#mapped-files-and-directories

````bash
sudo chown -R 5050:5050 pgadmin
```` 


#### 1. Run docker-compose

````bash
docker-compose up -d
````
Or, if you have the make utility installed, you can run
```bash
make up
```

#### 2. Run psql client:

##### Method 1: Via the docker-compose container

Open another terminal window, and type:

````bash
docker exec -it postgres_container psql -U postgres -d northwind

psql (17.2 (Debian 17.2-1.pgdg120+1))
Type "help" for help.

northwind=# select * from us_states;
 state_id |      state_name      | state_abbr | state_region
----------+----------------------+------------+--------------
        1 | Alabama              | AL         | south
        2 | Alaska               | AK         | north
        ...
````

##### Method 2: Direct access via the port 5432

The "postgres" service of the docker-compose exposes postgres on the port 5432. If you have psql on your path, you may connect to it via:

````bash
# Run this directly from your computer (this will connect to the docker db)
psql -U postgres northwind -p 5432
````

#### 3. Connect PgAdmin

Access to PgAdmin at the url: http://localhost:5050

Then, select database "northwind".
Run sql script from /sql/northwind.sql

#### 4. Stop docker-compose

Stop and remove the containers via:

```bash
docker-compose down
```
Or, if you have the make utility installed, you can run
```bash
make down
```

#### 5. Files & persistence

Your modifications to the postgres database(s)will be persisted in the `postgresql_data` docker volume, and can be retrieved once you restart `docker compose up -it`. 

If you need to delete the database data, run `docker-compose down -v` (the database will then be repopulated from scratch when running `docker-compose up`).

If you need to upload any files into your postgres_container container, just copy and paste them to the `files` local folder. They will be available at the `/files` path inside the db container.
