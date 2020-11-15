import sys
import psycopg2
from psycopg2 import Error
from contextlib import contextmanager

@contextmanager
def new_cursor():
    dns = "host={} dbname={} user={} password={}".format("localhost", "githubFBD", "postgres", "12345")

    connection = psycopg2.connect(dns)
    cursorObj = connection.cursor()
    try:
        yield cursorObj
    finally:
        if (connection):
            cursorObj.close()
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
            print('RESULTADOS DA CONSULTA 1:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

def consulta2():
    with new_cursor() as cursor:
        try:
            query = """
            select nameRepo, count(distinct idTopic) as quantTopics
            from Repositories join usersRepositoriesTopics using (idRepo)
            group by nameRepo
            having count(distinct idTopic) > 2
            order by quantTopics desc;"""
            cursor.execute(query)
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 2:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

def consulta6():
    with new_cursor() as cursor:
        try:
            query = """
            select U.nameUser, count(idFollower) as quantFollows
            from Users U join Contributors C on (U.idUser = C.idContrib)
            join Follows on (idUser = idFollower)
            group by U.nameUser;"""
            cursor.execute(query)
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 6:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

def consulta9():
    with new_cursor() as cursor:
        try:
            query = """
            select nameUser as nameOrg, idContrib
            from Organizations left join Users on (Organizations.idOrg = Users.idUser)
            join Members using (idOrg)
            order by nameUser;"""
            cursor.execute(query)
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 9:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

# essa daqui vai parametro!!!
# def consulta10():
#     with new_cursor() as cursor:
#         try:
#             query = """
#             select nameFolder, nameFile, termination as files
#             from Folders join Saves on (Folders.idFolder = Saves.idFolder)
#             join Items on (Saves.idItem = Items.idItem)
#             join Files on (Saves.idItem = Files.idFile)
#             join Repositories on (Items.idRepo = Repositories.idRepo)
#             where nameRepo = 'Info Animes'"""
#             cursor.execute(query)
#             result = cursor.fetchall()
#             print('RESULTADOS DA CONSULTA 10:')
#             [print(row) for row in result]
#         except Exception as error:
#             raise error
#         else:
#             print('Query well executed.')

def showAvailableQueries():
    print('\nConsultas possiveis:')
    print('\n(P) corresponde a um parâmetro passado pelo usuário')
    print('\nCONSULTA 1: Para cada usuário, mostrar nickname do usuário, nome do repositório e número de estrelas (se for 0, não entra no resultado) ordenado pelo número de estrelas.')
    print('\nCONSULTA 2: Para cada repositório, mostrar o repositório e quantos tópicos estão associados a eles se tiverem mais de dois tópicos, ordenados decrescentemente pelas quantidade de tópico.')
    print('\nCONSULTA 3: O nome dos usuários que deram estrelas nos repositórios de um usuário com um dado nickname (P)')
    print('\nCONSULTA 4: Os issues e comentários dos repositórios de um usuário de nickname (P).')
    print('\nCONSULTA 5: Os repositórios que tenham licensa (P1) ou (P2) e o numero de commits que eles tem.')
    print('\nCONSULTA 6: O nome dos contribuidores e quantas pessoas ele segue')
    print('\nCONSULTA 7: O nome do usuário, o nome dos seus repositórios que fazem parte do tópico (P)')
    print('\nCONSULTA 8: Nome dos repositórios em que nenhum arquivo commitado foi implementado na linguagem (P1) e nem na linguagem (P2)')
    print('\nCONSULTA 9: O nome das organizações e o id dos seus membros.')
    print('\nCONSULTA 10: Dado o nome de um repositorio (P), listar as pastas e os arquivos que ela tem dentro')

def checkAnotherQuery(userAnswer):
    if userAnswer == "sim" or userAnswer == "s":
        return True
    else:
        return False

def printNumConsulta(num_consult):
    print(num_consult)


if __name__ == "__main__":

    keep = True
    while(keep):

        showAvailableQueries()

        print('\nEntre com o numero da consulta que deseja fazer')
        num_consult = input()

        if num_consult == "1":
            printNumConsulta(num_consult)
            consulta1()
        elif num_consult == "2":
            printNumConsulta(num_consult)
            consulta2()
        elif num_consult == "3":
            printNumConsulta(num_consult)
            continue
        elif num_consult == "4":
            printNumConsulta(num_consult)
            continue
        elif num_consult == "5":
            printNumConsulta(num_consult)
            continue
        elif num_consult == "6":
            printNumConsulta(num_consult)
            consulta6()
        elif num_consult == "7":
            continue
        elif num_consult == "8":
            continue
        elif num_consult == "9":
            continue
        elif num_consult == "10":
            continue

        
        print('\nDeseja fazer outra consulta?')
        anotherQuery = input()
        keep = checkAnotherQuery(anotherQuery.lower())


    


