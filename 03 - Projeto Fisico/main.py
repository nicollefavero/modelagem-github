import psycopg2
from psycopg2 import Error
from contextlib import contextmanager

@contextmanager
def new_cursor():
    connection = psycopg2.connect(
        host='localhost',
        user='postgres',
        password='M4cnwsdz',
        database='githubFBD'
    )
    cursor = connection.cursor()
    try:
        yield cursor
    finally:
        if (connection):
            cursor.close()
            connection.close()
            print('PostgesSQL connection is closed')


#  CONSULTA 1: Para cada usuário, nickname do usuário, nome do repositório e número de estrelas (se for 0, não entra no resultado) ordenado pelo número de estrelas.
def consulta1():
    with new_cursor() as cursor:
        try:
            query = """
            select nickname, nameRepo, count(Stars.idRepo) as quantStars 
            from Stars join Repositories on (Stars.idRepo = Repositories.idRepo)
                       join Contributors on (Repositories.idUser = Contributors.idContrib)
                       join Users on (Contributors.idContrib = Users.idUser)
            group by nickname, nameRepo
            order by quantStars desc;"""
            cursor.execute(query)
            # Retorna uma lista de tuplas(rows) do resultado da query
            result = cursor.fetchall()
            # Para cara elemento da lista, printa o elemento
            print('CONSULTA 1: Para cada usuário, nickname do usuário, nome do repositório e número de estrelas (se for 0, não entra no resultado) ordenado pelo número de estrelas.')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

# CONSULTA 4: Os issues dos repositórios do usuário de nickname = PET_COMPUTACAO e seus comentários.
def consulta4():
    


if __name__ == "__main__":
    consulta1()
    # O que seria melhor: Abrir várias conexões com o banco, uma para cada consulta
    # Ou abrir uma única conexão com o banco e executar todas as querys?


