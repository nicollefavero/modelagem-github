create table Users
(id         integer      notnull,
 name       varchar(40)  notnull,
 nickname   varchar(30)  notnull,
 biografia  varchar(160) notnull,
 email      varchar(50)  notnull,
 primary key(id));

create table Contributors
(id         integer      notnull,
 idUser     integer      notnull,
 primary key(id),
 foreign key(idUser));

create table Follows
(idFollower integer      notnull,
 idFollowed integer      notnull,
 date       Date         notnull,
 primary key(idFollowed, idFollower),
 foreign key(idFollowed) references Contributors,
 foreign key(idFollower) references Contributors);

create table Organizations
(id         integer      notnull,
 idUser     integer      notnull,
 primary key(id),
 foreign key(idUser));

create table Members
(idContributor  integer notnull,
 idOrg          integer notnull,
 primary key(idContributor, idOrg),
 foreign key(idContributor) references Contributors,
 foreign key(idOrg) references Organizations);

create table Repositories
(idRepository integer      notnull,
 idUser       integer      notnull,
 name         varchar(60)  notnull,
 creationDate Date         notnull,
 primary key(id),
 foreign key(idUser) references Users,
 unique(idUser, name));

-- create table License
-- (id          integer       notnull,
--  type        varchar(60)   notnull,
--  primary key(id));

create table Topics
(cod     integer     notnull,
 name    varchar(60) notnull,
 primary key(cod),
 unique(name));

create table Category
(idRepository integer notnull,
 codTopic     integer notnull,
 primary key(idRepository, codTopic),
 foreign key(idRepository) references Repository,
 foreign key(codTopic) references Topics);