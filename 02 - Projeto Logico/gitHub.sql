create table Users
(id         integer      notnull,
 name       varchar(40)  notnull,
 nickname   varchar(30)  notnull,
 biografia  varchar(160) notnull,
 email      varchar(50)  notnull,
 primary key(id)
 unique(nickname)); -- NICKNAME É UNICO??

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

create table Stars
(idContrib    integer notnull,
 idRepository integer notnull,
 date         Date    notnull,
 primary key(idContrib, idRepository),
 foreign key(idContrib) references Contributors,
 foreign key(idRepository) references Repositories);

-- LICENSES É ATRIB-MULTVALOR?? OU N-M TALVEZ??
-- create table Licenses
-- (cod          integer     notnull,
--  idRepository integer     notnull,
--  type         varchar(60) notnull,
--  primary key(cod, idRepository),
--  foreign key(idRpository) references Repositories);

create table Issues
(number       integer       notnull,
 description  varchar(2500) notnull,
 date         Date          notnull,
 idRepository integer       notnull,
 idContrib    integer       notnull,
 primary key(number, idRepository),
 foreign key(idRepository) references Repositories,
 foreign key(idContrib) references Contributors);

-- COMENTAR SOBRE PRECISAR DE DESCRIPTION EM COMMENT
-- create table Comment
-- (idContrib   integer notnull,
--  numIssue    integer notnull,
--  date        Date    notnull,
--  description integer nontnull,
--  primary key(idContrib, numIssue, date),
--  foreign key(idContrib) references Contributors,
--  foreign key(numIssue) references Issues);

create table Topics
(cod     integer     notnull,
 name    varchar(60) notnull,
 primary key(cod),
 unique(name));

create table Category
(idRepository integer notnull,
 codTopic     integer notnull,
 primary key(idRepository, codTopic),
 foreign key(idRepository) references Repositories,
 foreign key(codTopic) references Topics);

create table Items
(id           integer      notnull,
 name         varchar(100) notnull,
 idRepository integer      notnull,
 primary key(id),
 foreign key(idRepository) references Repositories)

create table Folders
(id         integer notnull,
 idItem     integer notnull,
 primary key(id),
 foreign key(idItem) references Items);

create table FullWith
(idItem integer notnull,
 idFolder integer notnull,
 primary key(idItem),
 foreign key(idItem) references Items,
 foreign key(idFolder) references Folders);

create table Files
(id          integer    notnull,
 idItem      integer    notnull,
 termination varchar(5) notnull,
 primary key(id),
 foreign key(idItem) references Items);

create table Languages
(cod integer notnull,
 name varchar(25),
 primary key(cod));

create table Implementations
(idFile      integer notnull,
 codLanguage integer notnull,
 primary key(idFile),
 foreign key(idFile) references Files,
 foreign key(codLanguage) references Languages);

-- create table Commits()