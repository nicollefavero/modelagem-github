import json
import psycopg2
from psycopg2 import Error
from contextlib import contextmanager

def readFileWithCredentials():
    with open('credentials.json', 'r') as json_file:
        dados = json.load(json_file)
        values = list(dados.values())
        return "host={} dbname={} user={} password={}".format(values[0], values[1], values[2], values[3])

@contextmanager
def new_cursor():
    connection = psycopg2.connect(readFileWithCredentials())
    cursorObj = connection.cursor()
    try:
        yield cursorObj
    finally:
        if (connection):
            cursorObj.close()
            connection.close()
            print('PostgesSQL connection is closed')

# CONSULTA 1: Para cada usuário, mostrar nickname do usuário, nome do repositório e número de estrelas (se for 0, não entra no resultado) ordenado pelo número de estrelas.
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

# CONSULTA 2: Para cada repositório, mostrar o repositório e quantos tópicos estão associados a eles se tiverem mais de dois tópicos, ordenados decrescentemente pelas quantidade de tópico.
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

# CONSULTA 3: O nome dos usuários que deram estrelas nos repositórios de um usuário com um dado nickname (P)
def consulta3(nickname: str):
    with new_cursor() as cursor:
        try:
            query = """
            select distinct U.nameUser
            from Users U join Stars S on (U.idUser = S.idContrib)
            where S.idRepo in (select R.idRepo
            from Repositories R join Users U using (idUser)
            where nickname = %s);"""
            cursor.execute(query, (nickname,))
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 3:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

# CONSULTA 4: Os issues e comentários dos repositórios de um usuário de nickname (P)
def consulta4(nicknameOrg: str):
    with new_cursor() as cursor:
        try:
            query = """
            select Repositories.idRepo, Issues.idIssue, Issues.description, text as issueComments
            from Repositories join Users using (idUser)
                    join Issues on (Issues.idRepo = Repositories.idRepo)
                    join Comments on (Issues.idIssue = Comments.idIssue and Issues.idRepo = Comments.idRepo)
            where nickname = %s;
            """
            cursor.execute(query, (nicknameOrg, ))
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 5:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

# CONSULTA 5: Os repositórios que tenham licensa (P1) ou (P2) e o numero de commits que eles tem
def consulta5(license1: str, license2: str):
    with new_cursor() as cursor:
        try:
            query = """
            select Repositories.nameRepo, count(distinct hashcode) as commits
            from Repositories join Commits on (Repositories.idRepo = Commits.idRepo) 
            where idLicense in (select idLicense 
		                        from Licenses 
		                        where type = %s or type = %s)
            group by nameRepo;"""
            cursor.execute(query, (license1, license2, ))
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 5:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

# CONSULTA 6: O nome dos contribuidores e quantas pessoas ele segue
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

# CONSULTA 7: O nome do usuário, o nome dos seus repositórios que fazem parte do tópico (P)
def consulta7(topico: str):
    with new_cursor() as cursor:
        try:
            query = """
            select nameUser, nameRepo
            from Users join usersRepositoriesTopics using (idUser)
                       join Repositories using (idRepo)
                       join Topics using (idTopic)
            where nameTopic = %s"""
            cursor.execute(query, (topico, ))
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 7:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

# CONSULTA 8: Nome dos repositórios em que nenhum arquivo commitado foi implementado na linguagem (P1) e nem na linguagem (P2)
def consulta8(linguagem1:str , linguagem2: str):
    with new_cursor() as cursor:
        try:
            query = """
            select nameRepo
            from Repositories R
            where not exists (select *
                             from Commits C join Items I on (I.idItem = C.idItem)
                                            join Implementations Imp on (Imp.idFile = I.idItem)
                             where R.idRepo = C.idRepo and I.idItem in (select distinct F.idFile
                                                                        from Files F join Implementations Imp on (F.idFile = Imp.idFile)
                                                                                     join Languages L on (L.idLang = Imp.idLang)
                                                                        where L.nameLang = %s or L.nameLang = %s))"""
            cursor.execute(query, (linguagem1, linguagem2, ))
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 8:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

# CONSULTA 9: O nome das organizações e o id dos seus membros.
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

# CONSULTA 10: Dado o nome de um repositorio (P), listar as pastas e os arquivos que ela tem dentro
def consulta10(repositoryName: str):
    with new_cursor() as cursor:
        try:
            query = """
            select nameFolder, nameFile, termination as files
            from Folders join Saves on (Folders.idFolder = Saves.idFolder)
            join Items on (Saves.idItem = Items.idItem)
            join Files on (Saves.idItem = Files.idFile)
            join Repositories on (Items.idRepo = Repositories.idRepo)
            where nameRepo = %s"""
            cursor.execute(query, (repositoryName,))
            result = cursor.fetchall()
            print('RESULTADOS DA CONSULTA 10:')
            [print(row) for row in result]
        except Exception as error:
            raise error
        else:
            print('Query well executed.')

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

def checkAnotherQuery(userAnswer: str):
    if userAnswer == "sim" or userAnswer == "s":
        return True
    else:
        return False


if __name__ == "__main__":

    keep = True
    while(keep):

        showAvailableQueries()

        print('\nEntre com o numero da consulta que deseja fazer: ')
        num_consult = input()

        if num_consult == "1":
            consulta1()

        elif num_consult == "2":
            consulta2()

        elif num_consult == "3":
            print('\nInsira um nickname para consultar: ')
            nickname = input()
            consulta3(nickname)

        elif num_consult == "4":
            print('\nInsira o nickname da organização: ')
            nickname = input()
            consulta4(nickname)

        elif num_consult == "5":
            print('\nInsira a licensa 1: ')
            license1 = input()
            print('\nInsira a licensa 2: ')
            license2 = input()
            consulta5(license1, license2)

        elif num_consult == "6":
            consulta6()

        elif num_consult == "7":
            print('\nInsira o topico:')
            topico = input()
            consulta7(topico)

        elif num_consult == "8":
            print('\nInsira a linguagem 1: ')
            linguagem1 = input()
            print('\nInsira a linguagem 2: ')
            linguagem2 = input()
            consulta8(linguagem1, linguagem2)

        elif num_consult == "9":
            consulta9()

        elif num_consult == "10":
            print('\nInsira o nome de um repositório: ')
            repositoryName = input()
            consulta10(repositoryName)
        
        else:
            print('\nNumero de consulta INVALIDO')

        
        print('\nDeseja fazer outra consulta?')
        anotherQuery = input()
        keep = checkAnotherQuery(anotherQuery.lower())