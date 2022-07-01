# MultimediaPlataform

Projeto para a disciplina de Bases de Dado.

Plataforma de Tutoriais de Apoio a Universitários

You'll need Python, pip and psql installed to run the application. If you don't have them installed, check the links below:
https://www.python.org/downloads/

Pre-install:
```
pip install configparser
pip install psycopg2
```

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

After that, simply run
```
python app.py
```
