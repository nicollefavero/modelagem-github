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
insert into Users values (3, 'Nicolle Favero', 'nicollefavero', 'Computer Science Student @ UFRGS', 'nfavero@inf.br');
insert into Users values (4, 'Netflix, Inc.', 'Netflix', 'Netflix Open Source Platform', 'netflixoss@netflix.com');
insert into Users values (5, 'Google', 'google', 'Google :heart: Open Source', 'opensource@google.com');
insert into Users values (6, 'João da Silva', 'jsilva', null, 'jsilva35@gmail.com');
insert into Users values (7, 'Golang', 'golang', 'Go is a programming language built to resemble a simplified version of the C programming language.', 'golang@golang.google.com');
insert into Users values (8, 'Docker', 'docker', 'Docker is a platform built for developers to build and run applications.', 'docker@docker.docker.br');
insert into Users values (9, 'Victoria Duarte', 'vic_ic', 'Estudante de Ciencia da Computacao na UFRGS', 'vicvic@inf.ufrgs.com');
insert into Users values (10, 'PET COMPUTACAO UFRGS', 'PET_COMPUTACAO', 'PET do Instituto de Informática', 'petcomp@inf.ufrgs.br');

create table Licenses
(idLicense      integer     not null,
 type           varchar(150) not null,
 primary key(idLicense),
 unique(type));

insert into Licenses values (1, 'GNU-3');
insert into Licenses values (2, 'GNU-2');
insert into Licenses values (3, 'MIT Licenses');
insert into Licenses values (4, 'The Unlicense');
insert into Licenses values (5, 'Apache License 2.0');
insert into Licenses values (6, 'GNU General Public License v3.0');
insert into Licenses values (7, 'Amazon Digital Services License');
insert into Licenses values (8, 'JSON License');
insert into Licenses values (9, 'Microsoft Public License');


create table Repositories
(idRepo       integer not null,
 idUser       integer not null,
 nameRepo     varchar(60) not null,
 description  varchar(300),
 creationDate timestamp not null,
 idLicense    integer,
 primary key(idRepo),
 foreign key(idUser) references Users on delete cascade,
 foreign key(idLicense) references Licenses on delete set null,
 unique(idUser, nameRepo));
 
-- insert into Repositories values (1, 1, 'Computer Science College', 'computer-science-college', '2018-08-08 00:00:00 UTC', 1);
-- insert into Repositories values (2, 2, 'Fundamentos de Banco de Dados', 'rep-fbd', '2020-01-01 00:00:00 UTC', 1);
-- insert into Repositories values (3, 3, 'Java Studies', 'superjava', '2019-11-04 00:00:00 UTC', null);
-- insert into Repositories values (4, 1, 'Info Animes', 'info-animes', '2018-12-01 00:00:00 UTC', 6);
-- insert into Repositories values (5, 9, 'Project PET', 'proj-pet', '2020-11-13 09:00:00 UTC', 9);
-- insert into Repositories values (6, 7, 'Project Golang', 'proj-go', '2020-11-21 12:10:00 UTC', 7);
-- insert into Repositories values (7, 5, 'Project Google', 'proj-google', '2019-11-21 12:10:00 UTC', 5);
-- insert into Repositories values (8, 8, 'Project Docker', 'proj-docker', '2009-10-21 12:10:00 UTC', 9);
insert into Repositories values (9, 3, 'Trilha Estagio', 'trilha-estagio', '2009-10-21 12:10:00 UTC', 6);
-- insert into Repositories values (10, 3, 'Modelagem Github', 'modelagem-github', '2009-10-21 12:10:00 UTC', 6);
-- insert into Repositories values (11, 1, 'Courses', 'courses', '2019-10-21 12:10:00 UTC', null);
-- insert into Repositories values (12, 8, 'Docker Compose', 'docker-compose', '2014-10-21 12:10:00 UTC', null);


create table Items
(idItem     integer not null,
 idRepo     integer not null,
 primary key(idItem),
 foreign key(idRepo) references Repositories on delete cascade);

create table Folders
(idFolder   integer not null,
 nameFolder integer not null,
 primary key (idFolder),
 foreign key (idFolder) references Items on delete cascade);

 create table Files
(idFile     integer not null,
 nameFile   varchar(100) not null,
 content varchar(8000) not null,
 termination varchar(6) not null,
 primary key (idFile),
 foreign key (idFile) references Items on delete cascade);


 create table Saves
(idItem   integer not null,
 idFolder integer,
 primary key(idItem),
 foreign key(idItem) references Items on delete cascade,
 foreign key(idFolder) references Folders on delete cascade);
 
 





select *
from Items

select *
from Folders

select *
from Files

select *
from Saves

insert into Contributors values (1);
insert into Contributors values (2);
insert into Contributors values (3);
insert into Contributors values (6);
insert into Contributors values (9);


-- Repositório Java Studies
insert into Items values (1, 3);
insert into Items values (2, 3);
insert into Items values (5, 3);
insert into Items values (6, 3);

-- Repositório Computer Science College
insert into Items values (3, 1);
insert into Items values (4, 1);
insert into Items values (7, 1);
insert into Items values (8, 1);
insert into Items values (9, 1);
insert into Items values (10, 1);

-- Repositório Info Animes
insert into Items values (11, 4);
insert into Items values (12, 4);
insert into Items values (13, 4);

-- Repo Fundamentos de Banco de Dados
insert into Items values (14, 2);
insert into Items values (15, 2);
insert into Items values (16, 2);

-- Repositório Project PET
insert into Items values (17, 5);
insert into Items values (18, 5);
insert into Items values (19, 5);

-- Repositório Project Golang
insert into Items values (20, 6);
insert into Items values (21, 6);
insert into Items values (22, 6);

-- Repositório Project Google
insert into Items values (23, 7);
insert into Items values (24, 7);
insert into Items values (25, 7);
insert into Items values (26, 7);

-- Repositório Project Docker
insert into Items values (27, 8);
insert into Items values (28, 8);

-- Repositório Trilha Estágio
insert into Items values (41, 9);
insert into Items values (42, 9);
insert into Items values (43, 9);
insert into Items values (44, 9);
insert into Items values (45, 9);
insert into Items values (46, 9);

-- Repositório Modelagem Github
insert into Items values (29, 10);
insert into Items values (30, 10);
insert into Items values (31, 10);
insert into Items values (32, 10);
insert into Items values (33, 10);

-- Repositório Courses
insert into Items values (34, 11);
insert into Items values (35, 11);
insert into Items values (36, 11);
insert into Items values (37, 11);
insert into Items values (38, 11);

-- Repositório Docker Compose
insert into Items values (39, 12);
insert into Items values (40, 12);

