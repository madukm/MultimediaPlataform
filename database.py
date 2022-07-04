#!/usr/bin/python

import psycopg2
from config import config

class Postgres():
    _instance = None
    def __new__(cls):
        if cls._instance is None:
            cls._instance = object.__new__(cls)
            db_config = config()
            try:
                print('Connecting to PostgreSQL database...')
                connection = Postgres._instance.connection = psycopg2.connect(**db_config)
                cursor = Postgres._instance.cursor = connection.cursor()
                cursor.execute('SELECT VERSION()')
                db_version = cursor.fetchone()

            except Exception as error:
                print('Error: connection not established {}'.format(error))
                Postgres._instance = None

            else:
                print('Connection established\n{}'.format(db_version[0]))

        return cls._instance

    def __init__(self):
        self.conn = self._instance.connection
        self.cur = self._instance.cursor

    def query(self, query, params=None):
        try:
            result = self.cur.execute(query, params)
        except Exception as error:
            #print('Error executing query "{}", error: {}'.format(query, error))
            return None
        else:
            return result

    def __del__(self):
        self.cur.close()
        self.conn.close()
    