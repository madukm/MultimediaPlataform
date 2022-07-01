#!/usr/bin/python

import psycopg2
from config import config
from read_sql import read_sql

def inserir_mestre(email, nome, dataNasc, telefone=None):

    query = """INSERT INTO mestre(email, nome, data_nasc, telefone)
                VALUES(%s,%s,%s,%s);"""
    conn = None
    sucess = True
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(query, (email, nome, dataNasc, telefone))
        conn.commit()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print("ERRO", error)
        sucess = False
    finally:
        if conn is not None:
            conn.close()
    return sucess

#def coordenador_atual(classe):


# Cadastro da solicitação
def cadastrar_solicitacao(universitario, classe, solicitacao):
    query = """INSERT INTO solicitacao(universitario, coordenador, solicitacao) 
            VALUES(%s, %s, %s);"""
    conn = None
    sucess = True
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        cur.execute(query, (universitario, classe, solicitacao))
        conn.commit()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print("ERRO", error)
        sucess = False
    finally:
        if conn is not None:
            conn.close()
    return sucess
    