import psycopg2
from psycopg2 import Error
from contextlib import contextmanager

@contextmanager
def new_cursor():
    connection = psycopg2.connect(
        host='localhost',
        user='postgres',
        password='M4cnwsdz',
        database='gitHub'
    )
    cursor = connection.cursor()
    try:
        yield cursor
    finally:
        if (connection):
            cursor.close()
            connection.close()
            print('PostgesSQL connection is closed')


