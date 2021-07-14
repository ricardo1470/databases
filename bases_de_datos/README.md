> # Data Bases
---
> ## Mysql

* sudo service mysql start
    # inicio de secion
    ** `mysql -u root -p` (forma 1)
    ** `mysql -u root --password='root@root'` (forma 2)
---
### ver bases de datos
SHOW DATA BASES;
### elegir base de datos
USE DATABASE (NOMBRE DE LA BASE DE DATOS);

---
> ## Postgres

## Install PostgreSQL
* `sudo apt update`
* `sudo apt install postgresql postgresql-contrib`
* `sudo service postgresql start [stop, status, reload, restart]`

## rum server in dev
* `npm run dev`

## start postgres shell
* `sudo -u postgres psql`
* `pass= root`

## Basic postgres commands
* `\q`: Quit
* `\c` __database__: Connect to a database
* `\d` __table__: Show table definition including triggers
* `\dt` *.*: List tables from all schemas (if *.* is omitted will only show SEARCH_PATH ones)
* `\l`: List databases
* `\dn`: List schemas
* `\df`: List functions
* `\dv`: List views
* `\timing`: Show query timing stats
---
> ## Mongo
* `sudo service mongodb start`
* `sudo service mongodb status`
    ** iniciar mongo db: `mongo`
---
> ## FireBase
---