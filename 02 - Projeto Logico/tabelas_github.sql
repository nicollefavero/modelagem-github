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

------------ CONTRIBUIDORES ---------------------------------------------------------------------------
create table Contributors
(idContrib integer not null,
 primary key(idContrib),
 foreign key(idContrib) references Users on delete cascade);

------------ ORGANIZAÇÕES -------------------------------------------------------------------------------
create table Organizations
(idOrg integer not null,
 primary key(idOrg),
 foreign key(idOrg) references Users on delete cascade);

------------ MEMBERS -------------------------------------------------------------------------------
create table Members
(idContrib  integer not null,
 idOrg      integer not null,
 primary key(idContrib, idOrg),
 foreign key(idContrib) references Contributors on delete cascade,
 foreign key(idOrg) references Organizations on delete cascade);

------------ FOLLOWS -------------------------------------------------------------------------------
create table Follows
(idFollower   integer   not null,
 idFollowed   integer   not null,
 dateFollow   timestamp not null,
 primary key(idFollower, idFollowed),
 foreign key(idFollower) references Contributors on delete cascade,
 foreign key(idFollowed) references Contributors on delete cascade);

------------ LICENSES -------------------------------------------------------------------------------
 create table Licenses
(idLicense      integer     not null,
 type           varchar(150) not null,
 primary key(idLicense),
 unique(type));

------------ REPOSITORIES ----------------------------------------------------------------------------
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
 

------------ STARS -------------------------------------------------------------------------------
create table Stars
(idContrib    integer      not null,
 idRepo       integer      not null,
 dateStar     timestamp    not null,
 primary key(idContrib, idRepo),
 foreign key(idContrib) references Contributors on delete cascade,
 foreign key(idRepo) references Repositories on delete cascade);

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

------------ COMMENTS -------------------------------------------------------------------------------
create table Comments
(idContrib   integer       not null,
 idIssue     integer       not null,
 idRepo      integer       not null,
 dateComment timestamp     not null,
 text        varchar(2500) not null,
 primary key(idContrib, idIssue, idRepo, dateComment),
 foreign key(idContrib) references Contributors on delete set null,
 foreign key(idIssue, idRepo) references Issues on delete cascade);

------------ TOPICS -------------------------------------------------------------------------------
create table Topics
(idTopic     integer     not null,
 nameTopic   varchar(30) not null,
 primary key(idTopic),
 unique(nameTopic));

------------ CATEGORY -------------------------------------------------------------------------------
 create table Categories
(idRepo    integer not null,
 idTopic   integer not null,
 primary key(idRepo, idTopic),
 foreign key(idRepo) references Repositories on delete cascade,
 foreign key(idTopic) references Topics on delete cascade);

------------ ITEMS -------------------------------------------------------------------------------
create table Items
(idItem     integer not null,
 idRepo     integer not null,
 primary key(idItem),
 foreign key(idRepo) references Repositories on delete cascade);

------------ FOLDERS -------------------------------------------------------------------------------
create table Folders
(idFolder   integer not null,
 nameFolder varchar(100) not null,
 primary key (idFolder),
 foreign key (idFolder) references Items on delete cascade);

------------ SAVES -------------------------------------------------------------------------------
create table Saves
(idItem   integer not null,
 idFolder integer,
 primary key(idItem),
 foreign key(idItem) references Items on delete cascade,
 foreign key(idFolder) references Folders on delete cascade);

------------ FILES -------------------------------------------------------------------------------
create table Files
(idFile      integer not null,
 nameFile    varchar(100) not null,
 content     varchar(8000) not null,
 termination varchar(6) not null,
 primary key (idFile),
 foreign key (idFile) references Items on delete cascade);

------------ LANGUAGES -------------------------------------------------------------------------------
create table Languages
(idLang    integer     not null,
 nameLang  varchar(25) not null,
 primary key(idLang),
 unique(nameLang));

------------ IMPLEMENTATIONS -------------------------------------------------------------------------------
create table Implementations
(idFile   integer not null,
 idLang   integer,
 primary key(idFile),
 foreign key(idFile) references Files on delete cascade,
 foreign key(idLang) references Languages on update cascade);

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
