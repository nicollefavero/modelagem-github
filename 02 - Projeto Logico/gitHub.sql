------------ USUARIOS -------------------------------------------------------------------------------
create table Users
(idUser     integer      not null,
 nameUser   varchar(60),
 nickname   varchar(30)  not null,
 biografia  varchar(160),
 email      varchar(50)  not null,
 primary key(idUser),
 unique(nickname),
 unique(email));

insert into Users values (1, 'Matheus Azambuja', 'matheusazambuja', 'Studying Science Computer at UFRGS', 'matheusazambuja35@gmail.com');
insert into Users values (2, 'Karin Becker', 'karinbecker', null, 'kbecker@inf.br');
insert into Users values (3, null, 'nicollefavero', null, 'nfavero@inf.br');
insert into Users values (4, 'Netflix, Inc.', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');
insert into Users values (5, 'Google', 'google', 'Google ❤️ Open Source', 'opensource@google.com');
insert into Users values (6, 'João da Silva', 'jsilva', null, 'jsilva35@gmail.com');
insert into Users values (7, 'Facebook', 'facebook', 'Facebook', 'facebook@facebook.com');

-- inserindo elemento repetido com id repetido
-- insert into Users values (4, 'Netflix', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');

-- inserindo elemento com nome repetido
-- insert into Users values (8, 'Netflix, Inc.', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');

-- inserindo elemento com nickname null
-- insert into Users values (9, 'Gradle' , null, 'Dependency Manager', 'gradle@email.com');

-- inserindo elemento com email null
-- insert into Users values (9, 'Gradle' , 'gradle', 'Dependency Manager', null);

select * from Users; 

------------ CONTRIBUIDORES ---------------------------------------------------------------------------
create table Contributors
(idContrib integer not null,
 primary key(idContrib),
 foreign key(idContrib) references Users on delete cascade);

insert into Contributors values (1);
insert into Contributors values (2);
insert into Contributors values (3);
insert into Contributors values (6);

-- inserindo de contributor já cadastrado
-- insert into Contributors values (1);

-- atualizando chave estrangeira
-- update Users set id = 9 where id = 3;

select * from Contributors;

------------ ORGANIZAÇÕES -------------------------------------------------------------------------------
create table Organizations
(idOrg integer not null,
 primary key(idOrg),
 foreign key(idOrg) references Users on delete cascade);

insert into Organizations values (4);
insert into Organizations values (5);
insert into Organizations values (7);

-- inserindo organization já cadastrado
-- insert into Organizations values (4);

-- atualizando chave estrangeira
-- update Users set id = 8 where id = 4;

select * from Organizations;

------------ MEMBERS -------------------------------------------------------------------------------
create table Members
(idContrib  integer not null,
 idOrg      integer not null,
 primary key(idContrib, idOrg),
 foreign key(idContrib) references Contributors on delete cascade,
 foreign key(idOrg) references Organizations on delete cascade);

insert into Members values (1, 4);
insert into Members values (1, 5);
insert into Members values (2, 4);
insert into Members values (2, 5);
insert into Members values (3, 4);

-- inserindo par (contrib, org) já cadastrado
-- insert into Members values (1, 4)

select * from Members;

------------ FOLLOWS -------------------------------------------------------------------------------
create table Follows
(idFollower   integer   not null,
 idFollowed   integer   not null,
 dateFollow   timestamp not null,
 primary key(idFollower, idFollowed),
 foreign key(idFollower) references Contributors on delete cascade,
 foreign key(idFollowed) references Contributors on delete cascade);

insert into Follows values (1, 2, '2020-10-02 00:00:00 UTC');
insert into Follows values (2, 3, '2020-10-02 00:00:00 UTC');
insert into Follows values (2, 1, '2020-10-02 00:00:00 UTC');
insert into Follows values (6, 2, '2020-10-02 00:00:00 UTC');

-- inserindo par (follower, followed) já cadastrado
-- insert into Follows values (1, 2, '2019-10-02 09:12:10 UTC');

select * from Follows;

------------ LICENSES -------------------------------------------------------------------------------
 create table Licenses
(idLicense      integer     not null,
 type           varchar(150) not null,
 primary key(idLicense),
 unique(type));

insert into Licenses values (1, 'GNU-3');
insert into Licenses values (2, 'GNU-2');
insert into Licenses values (3, 'MIT Licenses');

-- inserindo licensa já existente
-- insert into Licenses values (1, 'No-License');

select * from Licenses;

------------ REPOSITORIES ----------------------------------------------------------------------------
create table Repositories
(idRepo       integer not null,
 idUser       integer not null,
 nameRepo     varchar(60) not null,
 description  varchar(300),
 creationDate timestamp not null,
 idLicense    integer not null,
 primary key(idRepo),
 foreign key(idUser) references Users on delete cascade,
 foreign key(idLicense) references Licenses on delete set null,
 unique(idUser, nameRepo));
 
insert into Repositories values (1, 1, 'Computer Science College', 'computer-science-college', '2018-08-08 00:00:00 UTC', 1);
insert into Repositories values (2, 2, 'Repositório da Karin', 'repo-da-karin', '2020-01-01 00:00:00 UTC', 1);
insert into Repositories values (3, 3, 'SuperJava Advanced', 'superjava-advanced', '2019-11-04 00:00:00 UTC', 2);

-- inserindo par (idUser, name) ja cadastrado
-- insert into Repositories values (4, 1, 'computer-science-college', '2020-08-08 00:00:00 UTC');

-- alterando id do usuário (chave estrangeira)
-- update Users set id = 9 where id = 2;

select * from Repositories;

------------ STARS -------------------------------------------------------------------------------
create table Stars
(idContrib    integer      not null,
 idRepo       integer      not null,
 dateStar     timestamp    not null,
 primary key(idContrib, idRepo),
 foreign key(idContrib) references Contributors on delete cascade,
 foreign key(idRepo) references Repositories on delete cascade);

insert into Stars values (1, 2, '2020-01-02 00:00:00 UTC');
insert into Stars values (2, 3, '2019-09-10 12:01:59 UTC');
insert into Stars values (1, 3, '2019-09-10 12:01:59 UTC');
insert into Stars values (3, 2, '2019-09-10 12:01:59 UTC');

-- inserindo par (idContrib, idRepo) já existe
-- insert into Stars values (1, 3, '2020-05-10 12:01:59 UTC');

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;


select * from Stars;

------------ ISSUES -------------------------------------------------------------------------------
 create table Issues
(idIssue      integer       not null,
 description  varchar(2500) not null,
 openingDate  timestamp     not null,
 idRepo       integer       not null,
 idContrib    integer       not null,
 primary key(idIssue, idRepo),
 foreign key(idRepo) references Repositories on delete cascade,
 foreign key(idContrib) references Contributors on delete set null);

insert into Issues values (1, 'Não está funcionando', '2020-01-01 00:00:00 UTC', 1, 3);
insert into Issues values (2, 'Sabe nada de Java', '2020-01-01 00:00:00 UTC', 3, 1);
insert into Issues values (2, 'Sabe nada de Java', '2020-01-01 00:00:00 UTC', 2, 1);
insert into Issues values (3, 'Arquivo aulaEspecializacao não está abrindo', '2020-01-01 00:00:00 UTC', 3, 1);

-- inserindo par (idIssue, idRepo) ja existe
-- insert into Issues values (3, 'Arquivo aulaEspecializacao não está abrindo', '2020-01-01 00:00:00 UTC', 3, 3);

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;

select * from Issues;

------------ COMMENTS -------------------------------------------------------------------------------
create table Comments
(idContrib   integer       not null,
 idIssue     integer       not null,
 idRepo      integer       not null,
 dateComment timestamp     not null,
 text        varchar(2500) not null,
 primary key(idContrib, idIssue, idRepo),
 foreign key(idContrib) references Contributors on delete set null,
 foreign key(idIssue, idRepo) references Issues on delete cascade);

insert into Comments values (3, 2, 3, '2020-01-01 00:00:00 UTC', 'Sei sim!');
insert into Comments values (2, 1, 1, '2020-01-01 00:00:00 UTC', 'Muito bom! Parabééns!');
insert into Comments values (6, 2, 2, '2020-01-01 00:00:00 UTC', 'Muito bom! Parabééns!');

-- (idContrib, idIssue, idRepo) já existe
-- insert into Comments values (6, 2, 2, '2020-01-01 00:00:00 UTC', 'Muito bom! Parabééns!');

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;

-- alterando id de um Issue
-- update Issues set idIssue = 4 where idIssue = 1;

-- deletando um contribuidor
-- delete * from Contributor where id = 2;

select * from Comments;

------------ TOPICS -------------------------------------------------------------------------------
create table Topics
(idTopic     integer     not null,
 nameTopic   varchar(30) not null,
 primary key(idTopic),
 unique(nameTopic));

insert into Topics values (1, 'sgbds-fbd');
insert into Topics values (2, 'ufrgs');
insert into Topics values (3, 'python');
insert into Topics values (4, 'java');
insert into Topics values (5, 'fbd');

-- inserindo id ja existente
-- insert into Topics values (4, 'c-like');

select * from Topics;

------------ CATEGORY -------------------------------------------------------------------------------
 create table Categories
(idRepo    integer not null,
 idTopic   integer not null,
 primary key(idRepo, idTopic),
 foreign key(idRepo) references Repositories on delete cascade,
 foreign key(idTopic) references Topics on delete cascade);

insert into Categories values (2, 1);
insert into Categories values (1, 2);
insert into Categories values (3, 5);

-- inserindo par (idRepo, codTopic) ja existe
-- insert into Categories values (3, 5);

-- alterando id de um repositório
-- update Repositories set idRepo = 4 where idRepo = 3;


select * from Categories;

------------ ITEMS -------------------------------------------------------------------------------
create table Items
(idItem     integer      not null,
 idRepo     integer      not null,
 primary key(idItem, idRepo),
 foreign key(idRepo) references Repositories on delete cascade);

insert into Items values (1, 1);
insert into Items values (2, 3);
insert into Items values (3, 2);
insert into Items values (4, 1);
insert into Items values (5, 1);
insert into Items values (6, 2);
insert into Items values (7, 3);

-- idItem já existe
-- insert into Items values (7, 'FBD', 3);

select * from Items;

------------ FOLDERS -------------------------------------------------------------------------------
create table Folders
(idFolder   integer not null,
 idRepo     integer not null,
 nameFolder varchar(100) not null,
 primary key(idFolder),
 foreign key(idFolder, idRepo) references Items on delete cascade,
 unique(idRepo, nameFolder));

insert into Folders values (4, 1, "botDiscord"); -- Item botDiscord
insert into Folders values (5, 1, "Python"); -- Item Python
insert into Folders values (6, 2, "Java"); -- Item Java
insert into Folders values (7, 3, "Aula"); -- Item Aula

-- idFolder já existe
-- insert into Folders values (4, 3);

select * from Folders;

------------ SAVES -------------------------------------------------------------------------------
create table Saves
(idItem   integer not null,
 idFolder integer,
 primary key(idItem),
 foreign key(idItem) references Items on delete cascade,
 foreign key(idFolder) references Folders on delete cascade);

insert into Saves values (1, 2); -- Item scriptPython em Python
insert into Saves values (2, 4); -- Item aulaEspecilizacao em Aula
insert into Saves values (3, 3); -- Item main em Java
insert into Saves values (4, null); -- Item botDiscord nao associado a nenhuma pasta
insert into Saves values (5, null); -- Item Python nao associado a nenhuma pasta
insert into Saves values (6, null); -- Item Java nao associado a nenhuma pasta
insert into Saves values (7, null); -- Item Aula nao associado a nenhuma pasta

-- idItem ja existe
-- insert into Saves values (7, null);

select * from Saves;

------------ FILES -------------------------------------------------------------------------------
create table Files
(idFile      integer        not null,
 idRepo      integer        not null,
 content     varchar(30000) not null,
 termination varchar(6)     not null,
 nameFile    varchar(100)   not null,
 primary key(idFile),
 foreign key(idFile, idRepo) references Items on delete cascade,
 unique(nameFile, termination, idRepo));

insert into Files values (1, 1, "print('Hello World!')", ".py", "scriptPython");
insert into Files values (2, 3, "Apresentação do Trabalho de FBD\n\nConteúdo!", ".ppt", "aulaEspecializacao");
insert into Files values (3, 2, "System.Out.println('Hello World')!;", ".java", "main");

-- idItem ja existe
-- insert into Files values (3, 3, 'System.Out.println("Hello World")!;', '.java');

select * from Files;

------------ LANGUAGES -------------------------------------------------------------------------------
create table Languages
(idLang    integer     not null,
 nameLang  varchar(25) not null,
 primary key(idLang),
 unique(nameLang));

insert into Languages values (1, 'Python');
insert into Languages values (2, 'Java');
insert into Languages values (3, 'C');
insert into Languages values (4, 'C+');
insert into Languages values (5, 'JavaScript');
insert into Languages values (6, 'Assembly');
insert into Languages values (7, 'SQL');

-- codLang ja existe
-- insert into Languages values (7, 'SQL');

select * from Languages;

------------ IMPLEMENTATIONS -------------------------------------------------------------------------------
create table Implementations
(idFile   integer not null,
 idLang   integer,
 primary key(idFile),
 foreign key(idFile) references Files on delete cascade,
 foreign key(idLang) references Languages on update cascade);

insert into Implementations values (1, 1);
insert into Implementations values (2, null);
insert into Implementations values (3, 2);

-- idFile ja existe
-- insert into Implementations values (1, null);

select * from Implementations;

------------ COMMITS -------------------------------------------------------------------------------
create table Commits
(hashCode   integer      not null,
 idItem     integer      not null,
 idRepo     integer      not null,
 idContrib  integer      not null,
 dateCommit timestamp    not null,
 message    varchar(160) not null,
 primary key(idItem, idRepo, idContrib, dateCommit),
 foreign key(idItem) references Items on delete set null,
 foreign key(idRepo) references Repositories on delete cascade,
 foreign key(idContrib) references Contributors on delete set null,
 unique (hashCode, idRepo));

 insert into Commits values (1, 1, 2, 3, '2019-02-12 01:12:32 UTC', 'Mensagem 1');
 insert into Commits values (2, 1, 2, 3, '2020-10-15 10:32:19 UTC', 'Mensagem 2');
 insert into Commits values (3, 3, 2, 1, '2019-02-12 01:12:32 UTC', 'Mensagem 3');
 insert into Commits values (4, 1, 3, 1, '2020-10-15 10:32:19 UTC', 'Mensagem 4');

 -- hashCode ja existe
 -- insert into Commits values (1, 2, 2, 1, '2020-12-12 01:12:32 UTC', 'Mensagem 10');

 -- (idItem, idRepo, idContrib, date) ja existe
 -- insert into Commits values (5, 1, 3, 1, '2020-10-15 10:32:19 UTC', 'Mensagem 9999');

select * from Commits;
