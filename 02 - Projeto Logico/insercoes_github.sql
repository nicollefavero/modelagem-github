-- INSERINDO USUARIOS
-- insert into Users values (idUser, nameUser, nickname, biografia, email)
insert into Users values (1, 'Matheus Azambuja', 'matheusazambuja', 'Studying Science Computer at UFRGS', 'matheusazambuja35@gmail.com');
insert into Users values (2, 'Karin Becker', 'karinbecker', null, 'kbecker@inf.br');
insert into Users values (3, 'Nicolle Favero', 'nicollefavero', 'Computer Science Student @ UFRGS', 'nfavero@inf.br');
insert into Users values (4, 'Netflix, Inc.', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');
insert into Users values (5, 'Google', 'google', 'Google ❤️ Open Source', 'opensource@google.com');
insert into Users values (6, 'João da Silva', 'jsilva', null, 'jsilva35@gmail.com');
insert into Users values (7, 'Golang', 'golang', 'Go is a programming language built to resemble a simplified version of the C programming language.', 'golang@golang.google.com');
insert into Users values (8, 'Docker', 'docker', 'Docker is a platform built for developers to build and run applications.', 'docker@docker.docker.br');
insert into Users values (9, 'Victoria Duarte', 'vic_ic', 'Estudante de Ciencia da Computacao na UFRGS', 'vicvic@inf.ufrgs.com');
insert into Users values (10, 'PET COMPUTACAO UFRGS', 'PET_COMPUTACAO', 'PET do Instituto de Informática', 'petcomp@inf.ufrgs.br');

-- select * from Users; 

-- inserindo elemento repetido com id repetido
-- insert into Users values (4, 'Netflix', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');

-- inserindo elemento com nome repetido
-- insert into Users values (8, 'Netflix, Inc.', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');

-- inserindo elemento com nickname null
-- insert into Users values (9, 'Gradle' , null, 'Dependency Manager', 'gradle@email.com');

-- inserindo elemento com email null
-- insert into Users values (9, 'Gradle' , 'gradle', 'Dependency Manager', null);


-- INSERINDO CONTRIBUIDORES
-- insert into Contributors values (idContrib);
insert into Contributors values (1);
insert into Contributors values (2);
insert into Contributors values (3);
insert into Contributors values (6);
insert into Contributors values (9);
-- select * from Contributors;

-- inserindo de contributor já cadastrado
-- insert into Contributors values (1);

-- atualizando chave estrangeira
-- update Users set id = 9 where id = 3;


-- INSERINDO ORGANIZACOES
-- insert into Organizations values (idOrg);
insert into Organizations values (4);
insert into Organizations values (5);
insert into Organizations values (7);
insert into Organizations values (8);
insert into Organizations values (10);
-- select * from Organizations;

-- inserindo organization já cadastrado
-- insert into Organizations values (4);

-- atualizando chave estrangeira
-- update Users set id = 8 where id = 4;

-- INSERINDO MEMBROS
-- insert into Members values (idContrib, idOrg);
insert into Members values (1, 4);
insert into Members values (1, 5);
insert into Members values (2, 4);
insert into Members values (2, 5);
insert into Members values (3, 5);
insert into Members values (3, 7);
insert into Members values (2, 8);
insert into Members values (9, 10);
insert into Members values (6, 10);
insert into Members values (2, 10);
-- select * from Members;

-- inserindo par (contrib, org) já cadastrado
-- insert into Members values (1, 4)


-- INSERINDO FOLLOWS
-- insert into Follows values (idFollower, idFollowed, dateFollow);
insert into Follows values (1, 2, '2020-10-02 00:00:00 UTC');
insert into Follows values (1, 3, '2020-11-12 09:33:55 UTC');
insert into Follows values (3, 1, '2020-11-12 09:40:40 UTC');
insert into Follows values (3, 2, '2020-03-10 08:30:55 UTC');
insert into Follows values (9, 3, '2020-10-02 00:01:02 UTC');
insert into Follows values (9, 1, '2020-10-02 00:00:00 UTC');
insert into Follows values (6, 3, '2020-10-02 00:00:00 UTC');
insert into Follows values (1, 9, '2020-11-13 09:33:55 UTC');
insert into Follows values (1, 6, '2020-11-13 09:33:55 UTC');
insert into Follows values (3, 9, '2020-11-12 09:33:55 UTC');
insert into Follows values (3, 6, '2020-11-12 09:33:55 UTC');
-- select * from Follows;

-- inserindo par (follower, followed) já cadastrado
-- insert into Follows values (1, 2, '2019-10-02 09:12:10 UTC');


-- INSERINDO LICENSAS
-- insert into Liceses values (idLicense, type);
insert into Licenses values (1, 'GNU-3');
insert into Licenses values (2, 'GNU-2');
insert into Licenses values (3, 'MIT Licenses');
insert into Licenses values (4, 'The Unlicense');
insert into Licenses values (5, 'Apache License 2.0');
insert into Licenses values (6, 'GNU General Public License v3.0');
insert into Licenses values (7, 'Amazon Digital Services License');
insert into Licenses values (8, 'JSON License');
insert into Licenses values (9, 'Microsoft Public License');
-- select * from Licenses;

-- inserindo licensa já existente
-- insert into Licenses values (1, 'No-License');


-- INSERINDO REPOSITORIOS
-- insert into Repositories values (idRepo, idUser, nameRepo, description, creationDate, idLicense);
insert into Repositories values (1, 1, 'Computer Science College', 'computer-science-college', '2018-08-08 00:00:00 UTC', 1);
insert into Repositories values (2, 2, 'Fundamentos de Banco de Dados', 'rep-fbd', '2020-01-01 00:00:00 UTC', 1);
insert into Repositories values (3, 3, 'Java Studies', 'superjava', '2019-11-04 00:00:00 UTC', null);
insert into Repositories values (4, 1, 'Info Animes', 'info-animes', '2018-12-01 00:00:00 UTC', 6);
insert into Repositories values (5, 9, 'Project PET', 'proj-pet', '2020-11-13 09:00:00 UTC', 9);
insert into Repositories values (6, 7, 'Project Golang', 'proj-go', '2020-11-21 12:10:00 UTC', 7);
insert into Repositories values (7, 5, 'Project Google', 'proj-google', '2019-11-21 12:10:00 UTC', 5);
insert into Repositories values (8, 8, 'Project Docker', 'proj-docker', '2009-10-21 12:10:00 UTC', 9);
insert into Repositories values (9, 3, 'Trilha Estagio', 'trilha-estagio', '2009-10-21 12:10:00 UTC', 6);
insert into Repositories values (10, 3, 'Modelagem Github', 'modelagem-github', '2009-10-21 12:10:00 UTC', 6);
insert into Repositories values (11, 1, 'Courses', 'courses', '2019-10-21 12:10:00 UTC', null);
insert into Repositories values (12, 8, 'Docker Compose', 'docker-compose', '2014-10-21 12:10:00 UTC', null);
-- select * from Repositories;

-- inserindo par (idUser, name) ja cadastrado
-- insert into Repositories values (4, 1, 'computer-science-college', '2020-08-08 00:00:00 UTC');

-- alterando id do usuário (chave estrangeira)
-- update Users set id = 9 where id = 2;


-- INSERINDO STARS
-- insert into Stars values (idContrib, idRepo, dateStar);
insert into Stars values (1, 2, '2020-01-02 00:00:00 UTC');
insert into Stars values (2, 10, '2019-09-03 12:01:59 UTC');
insert into Stars values (1, 3, '2019-09-04 12:01:59 UTC');
insert into Stars values (1, 10, '2020-10-04 12:01:59 UTC');
insert into Stars values (3, 2, '2020-09-10 12:01:59 UTC');
insert into Stars values (3, 4, '2019-09-10 12:01:59 UTC');
insert into Stars values (3, 11, '2019-09-10 12:01:59 UTC');
insert into Stars values (3, 9, '2019-09-10 12:01:59 UTC');
insert into Stars values (2, 5, '2019-09-10 12:01:59 UTC');
insert into Stars values (9, 5, '2019-09-10 12:01:59 UTC');
insert into Stars values (6, 5, '2019-09-10 12:01:59 UTC');
insert into Stars values (6, 4, '2019-09-10 12:01:59 UTC');
insert into Stars values (1, 6, '2019-09-10 12:01:59 UTC');
insert into Stars values (2, 7, '2019-09-10 12:01:59 UTC');
insert into Stars values (9, 11, '2019-09-10 12:01:59 UTC');
-- select * from Stars;

-- inserindo par (idContrib, idRepo) já existe
-- insert into Stars values (1, 3, '2020-05-10 12:01:59 UTC');

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;


-- INSERINDO ISSUES
-- insert into Issues values (idIssue, description, openingDate, idRepo, idContrib);
insert into Issues values (1, 'Muito legal! Que estudioso :o', '2020-01-01 00:00:00 UTC', 1, 3);
insert into Issues values (1, 'Como faz para instalar o openJDK?', '2020-01-01 00:00:00 UTC', 3, 1);
insert into Issues values (1, 'O que é uma entidade fraca??', '2020-10-09 08:30:01 UTC', 2, 3);
insert into Issues values (2, 'Como eu faço subconsultas?', '2020-10-09 08:30:02 UTC', 2, 1);
insert into Issues values (1, 'A Hidra esta com um bug na hora de colocar o mnemonico', '2018-11-11 10:30:02 UTC', 5, 9);
insert into Issues values (1, 'Poderia adicionar uma feature para filmes', '2019-12-20 23:50:02 UTC', 4, 6);
insert into Issues values (2, 'Eu adoro animes, como faz para usar esse bot? Não estou conseguindo!', '2019-12-20 23:51:02 UTC', 4, 9);
insert into Issues values (3, 'Eu nao assisto tanto animes mas achei muito legal', '2019-12-20 23:50:02 UTC', 4, 3);
insert into Issues values (1, 'Como faço para criar uma instância de máquina na cloud?', '2020-12-20 23:50:02 UTC', 7, 6);
insert into Issues values (1, 'Docker e Docker compose são a mesma coisa?', '2019-12-20 23:50:02 UTC', 12, 3);
insert into Issues values (2, 'Eu não consigo instalar o neander', '2019-12-20 23:50:02 UTC', 5, 1);
-- select * from Issues;

-- inserindo par (idIssue, idRepo) ja existe
-- insert into Issues values (3, 'Arquivo aulaEspecializacao não está abrindo', '2020-01-01 00:00:00 UTC', 3, 3);

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;


-- INSERINDO COMENTÁRIOS
-- insert into Comments values (idContrib, idIssue, idRepo, dateComment, text);
insert into Comments values (1, 1, 1, '2020-01-01 00:02:00 UTC', 'Obrigado!');
insert into Comments values (9, 1, 1, '2020-01-01 00:03:00 UTC', 'Eu concordo :)');
insert into Comments values (3, 1, 3, '2020-01-01 09:02:40 UTC', 'Tem que usar sudo no terminal');
insert into Comments values (2, 1, 2, '2020-10-09 08:32:59 UTC', 'Vamos call que eu te explico');
insert into Comments values (2, 2, 2, '2020-10-09 08:30:56 UTC', 'Voce pode usar as clausulas IN, NOT IN, NOT EXISTS, LIKE, por exemplo');
insert into Comments values (6, 1, 5, '2019-11-11 10:30:02 UTC', 'Corrigido!');
insert into Comments values (6, 1, 5, '2019-11-11 10:30:03 UTC', 'Obrigado por avisar!');
insert into Comments values (3, 1, 7, '2020-12-20 23:51:02 UTC', 'Voce ja criou sua conta no GPC?');
insert into Comments values (6, 1, 7, '2020-12-20 23:51:59 UTC', 'Opss, ainda nao.');
insert into Comments values (1, 1, 12, '2020-12-20 23:50:02 UTC', 'Oi Nicolle. Docker e Docker Compose nao sao a mesma coisa!');
insert into Comments values (9, 2, 5, '2020-01-01 22:50:02 UTC', 'Está bugado mesmo.');
-- select * from Comments;

-- (idContrib, idIssue, idRepo) já existe
-- insert into Comments values (6, 2, 2, '2020-01-01 00:00:00 UTC', 'Muito bom! Parabééns!');

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;

-- alterando id de um Issue
-- update Issues set idIssue = 4 where idIssue = 1;

-- deletando um contribuidor
-- delete * from Contributor where id = 2;


-- INSERINDO TÓPICOS
-- insert into Topics values (idTopic, nameTopic);
insert into Topics values (1, 'sgbds-fbd');
insert into Topics values (2, 'ufrgs');
insert into Topics values (3, 'python');
insert into Topics values (4, 'java');
insert into Topics values (5, 'fbd');
insert into Topics values (6, 'bot-python');
insert into Topics values (7, 'modelagem');
insert into Topics values (8, 'data-science');
insert into Topics values (9, 'java-script');
insert into Topics values (10, 'anime');
insert into Topics values (11, 'docker');
insert into Topics values (12, 'golang');
-- select * from Topics;

-- inserindo id ja existente
-- insert into Topics values (4, 'c-like');


-- INSERINDO CATEGORIAS
-- insert into Categorias values (idRepo, idTopic);
insert into Categories values (2, 1);
insert into Categories values (1, 2);
insert into Categories values (3, 5);
insert into Categories values (6, 12);
insert into Categories values (8, 11);
insert into Categories values (11, 9);
insert into Categories values (11, 12);
insert into Categories values (11, 11);
insert into Categories values (5, 5);
insert into Categories values (9, 8);
insert into Categories values (4, 10);
insert into Categories values (10, 7);
insert into Categories values (5, 8);
insert into Categories values (5, 9);
insert into Categories values (9, 11);
-- select * from Categories;

-- inserindo par (idRepo, codTopic) ja existe
-- insert into Categories values (3, 5);

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;


-- INSERINDO ITENS
-- insert into Items values (idItem, idRepo);
insert into Items values (1, 3);
insert into Items values (2, 3);
insert into Items values (3, 3);
insert into Items values (4, 3);
-- select * from Items;

-- idItem já existe
-- insert into Items values (4, 3);

---- Alteração: Matheus
insert into Items values (1, 3);
insert into Items values (2, 3);
insert into Items values (3, 1);
insert into Items values (4, 1);
insert into Items values (5, 3);
insert into Items values (6, 3);
insert into Items values (7, 1);
insert into Items values (8, 1);
insert into Items values (9, 1);
insert into Items values (10, 1);

insert into Items values (11, 4);
insert into Items values (12, 4);
insert into Items values (13, 4);


-- INSERINDO PASTAS
-- insert into Folders values (idFolder, idRepo);
insert into Folders values (1, 'poc');
insert into Folders values (2, 'main');
-- select * from Folders;

-- idFolder já existe
-- insert into Folders values (2, 'botDiscord');

---- Alteração: Matheus
insert into Folders values (3, 'botDiscord'); -- Item botDiscord
insert into Folders values (4, 'Python'); -- Item Python
insert into Folders values (11, 'src');


-- INSERINDO FILES
-- insert into Files values (idFile, nameFile, content, termination);
insert into Files values (5, 'Main', '@SpringBootApplication\nMain {\nprivate static void main (String[] args) {\nSpringApplication.run(Main.class)}}', '.java');
insert into Files values (6, 'Main', '#!/bin/bash\ncd ..&&gradle bootRun', '.sh');

---- Alteração: Matheus
insert into Files values (7, 'helloWorldPython', 'print("Hello World!")', '.py');
insert into Files values (8, 'main', 'import discord.api as ds\nprint("ds.foo()")', '.py');
insert into Files values (9, 'exampleNumpy', 'import numpy as np\nprint(np.foo())', '.py');
insert into Files values (10, 'commands-bot', '1001110101011111001011', '.png');
insert into Files values (12, 'exampleMath', 'import Math\nprint(Math.foo())', '.py');
insert into Files values (13, 'exampleInfoAnime', 'print("Anime Info")', '.py');

-- select * from Files;

-- idItem ja existe
-- insert into Files values (3, 'Main', 'System.Out.println("Hello World")!;', '.java');


-- INSERINDO SAVES
-- insert into Saves values (idItem, idFolder);
insert into Saves values (5, 2);
insert into Saves values (6, 1);

---- Alteração: Matheus
insert into Saves values (1, null);
insert into Saves values (2, null);
insert into Saves values (3, null);
insert into Saves values (4, null);
insert into Saves values (7, 4);
insert into Saves values (8, 3);
insert into Saves values (9, 4);
insert into Saves values (10, 3);
insert into Saves values (11, null);
insert into Saves values (12, 11);
insert into Saves values (13, 11);


-- select * from Saves;

-- idItem ja existe
-- insert into Saves values (7, null);


-- INSERINDO LANGUAGES
-- insert into Languages values (idLang, nameLang);
insert into Languages values (1, 'Python');
insert into Languages values (2, 'Java');
insert into Languages values (3, 'C');
insert into Languages values (4, 'C+');
insert into Languages values (5, 'JavaScript');
insert into Languages values (6, 'Assembly');
insert into Languages values (7, 'SQL');
insert into Languages values (8, 'Ruby');
insert into Languages values (9, 'HTML');
insert into Languages values (10, 'COBOL');
insert into Languages values (11, 'BASIC');
insert into Languages values (12, 'R');
insert into Languages values (13, 'Go');
-- select * from Languages;

-- codLang ja existe
-- insert into Languages values (7, 'SQL');


-- INSERINDO IMPLEMENTACOES
-- insert into Implementations values (idFile, idLang);
-- insert into Implementations values (1, 1);
-- insert into Implementations values (2, null);
-- insert into Implementations values (3, 2);

-- select * from Implementations;

-- idFile ja existe
-- insert into Implementations values (1, null);


-- INSERINDO COMMITS
-- insert into Commits values (hashcode, idItem, idRepo, idContrib, dateCommit, message);
--  insert into Commits values (1, 1, 2, 3, '2019-02-12 01:12:32 UTC', 'Mensagem 1');
--  insert into Commits values (2, 1, 2, 3, '2020-10-15 10:32:19 UTC', 'Mensagem 2');
--  insert into Commits values (3, 3, 2, 1, '2019-02-12 01:12:32 UTC', 'Mensagem 3');
--  insert into Commits values (4, 1, 3, 1, '2020-10-15 10:32:19 UTC', 'Mensagem 4');

-- select * from Commits;

-- hashCode ja existe
-- insert into Commits values (1, 2, 2, 1, '2020-12-12 01:12:32 UTC', 'Mensagem 10');

-- (idItem, idRepo, idContrib, date) ja existe
-- insert into Commits values (5, 1, 3, 1, '2020-10-15 10:32:19 UTC', 'Mensagem 9999');

