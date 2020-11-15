-- CONSULTA 1: Para cada usuário, nickname do usuário, nome do repositório e número de estrelas (se for 0, não entra no resultado) ordenado pelo número de estrelas.
-- ORDER BY
-- GROUP BY

select nickname, nameRepo, count(Stars.idRepo) as quantStars 
from Stars join Repositories on (Stars.idRepo = Repositories.idRepo)
           join Contributors on (Repositories.idUser = Contributors.idContrib)
           join Users on (Contributors.idContrib = Users.idUser)
group by nickname, nameRepo
order by quantStars desc;


-- CONSULTA 2: Para cada repositório, o repositório e quantos tópicos estão associados a eles se tiverem mais de dois tópicos, ordenados decrescentemente pelas quantidade de tópico.
-- GROUP BY
-- HAVING
-- VISÃO

select nameRepo, count(distinct idTopic) as quantTopics
from Repositories join usersRepositoriesTopics using (idRepo)
group by nameRepo
having count(distinct idTopic) > 2
order by quantTopics desc


-- CONSULTA 3: O nome dos usuários que deram estrelas nos repositórios do usuário com nickname = 'matheusazambuja'
-- SUBCONSULTA

select distinct U.nameUser
from Users U join Stars S on (U.idUser = S.idContrib)
where S.idRepo in (select R.idRepo
                  from Repositories R join Users U using (idUser)
                  where nickname = 'matheusazambuja');


-- CONSULTA 4: Os issues dos repositórios do usuário de nickname = PET_COMPUTACAO e seus comentários.

select Repositories.idRepo, Issues.idIssue, Issues.description, text as issueComments
from Repositories join Users using (idUser)
                    join Issues on (Issues.idRepo = Repositories.idRepo)
                    join Comments on (Issues.idIssue = Comments.idIssue and Issues.idRepo = Comments.idRepo)
where nickname = 'google';


-- CONSULTA 5: Os repositórios que tenham licensa 'Microsoft Public License' (9) ou 'Apache License 2.0' (5) e o numero de commits que eles tem.
-- GROUP BY
-- SUBCONSULTA

select Repositories.nameRepo, count(distinct hashcode) as commits
from Repositories join Commits on (Repositories.idRepo = Commits.idRepo) 
where idLicense in (select idLicense 
		    from Licenses 
		    where type = 'Microsoft Public License' or type = 'Apache License 2.0')
group by nameRepo;


-- CONSULTA 6: O nome dos contribuidores e quantas pessoas ele segue
--GROUP BY

select U.nameUser, count(idFollower) as quantFollows
from Users U join Contributors C on (U.idUser = C.idContrib)
             join Follows on (idUser = idFollower)
group by U.nameUser

-- CONSULTA 7: O nome do usuário, o nome dos seus repositórios que fazem parte do tópico 'fbd'.
-- VISAO

select nameUser, nameRepo
from Users join usersRepositoriesTopics using (idUser)
           join Repositories using (idRepo)
           join Topics using (idTopic)
where nameTopic = 'fbd'


-- CONSULTA 8: Nome dos repositórios em que nenhum arquivo commitado foi implementado na linguagem Java e nem em Ruby
-- NOT EXISTS

select nameRepo
from Repositories R
where not exists (select *
                  from Commits C join Items I on (I.idItem = C.idItem)
                                   join Implementations Imp on (Imp.idFile = I.idItem)
                  where R.idRepo = C.idRepo and I.idItem in (select distinct F.idFile
                                                             from Files F join Implementations Imp on (F.idFile = Imp.idFile)
                                                                           join Languages L on (L.idLang = Imp.idLang)
                                                             where L.nameLang = 'Java' or L.nameLang = 'Ruby'))

-- CONSULTA 9: O nome da organização e o id dos seus membros.
-- ORDER BY

select nameUser as nameOrg, idContrib
from Organizations left join Users on (Organizations.idOrg = Users.idUser)
                    join Members using (idOrg)
order by nameUser

-- CONSULTA 10: Listar suas pastas e os arquivos que ela tem dentro (concatenar nomeFile + termination) do repositorio 'Info Animes'

select nameFolder, nameFile, termination as files
from Folders join Saves on (Folders.idFolder = Saves.idFolder)
         join Items on (Saves.idItem = Items.idItem)
         join Files on (Saves.idItem = Files.idFile)
         join Repositories on (Items.idRepo = Repositories.idRepo)
where nameRepo = 'Info Animes'














