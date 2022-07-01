#!/usr/bin/python

import psycopg2
from config import config
from read_sql import read_sql

def inserir_mestre(email, nome, dataNasc, telefone=None):

    sql = """INSERT INTO mestre(email, nome, data_nasc, telefone)
                VALUES(%s,%s,%s,%s);"""
    conn = None
    erro = 0
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql, (email.upper(), nome.upper(), dataNasc, telefone))
        conn.commit()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print("ERRO", error)
        erro = 1
    finally:
        if conn is not None:
            conn.close()
    return erro

def show_mestres():
    sql = """TABLE mestre"""
    conn = None
    erro = 0
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(sql, ())
        conn.commit()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print("ERRO", error)
        erro = 1
    finally:
        if conn is not None:
            conn.close()
    return erro