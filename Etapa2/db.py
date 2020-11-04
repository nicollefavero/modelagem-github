import psycopg2
from configparser import ConfigParser

def connect():
    conn = None
    try:
        print('Connecting to the PostgrsSQL database...')

        conn = psycopg2.connect(
            host='localhost',
            user='postgres',
            password='M4cnwsdz',
            database='Caronas'
        )

        #create a cursor
        cur = conn.cursor()

        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')

if __name__ == "__main__":
    connect()
