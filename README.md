# MultimediaPlataform

Projeto para a disciplina de Bases de Dado.

Plataforma de Tutoriais de Apoio a Universitários

Create a database.ini file:
```
[postgresql]
host=localhost
database=multimedia_db
user=[your_user]
password=[your_password]
```
To create and feed the db, please run the following inside the repository:

```
psql -U postgres -a -q -f sql/esquema.sql
psql -U postgres -d multimedia_db -a -q -f sql/dados.sql
```
