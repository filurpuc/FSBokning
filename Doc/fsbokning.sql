drop table plats
create table plats
(
	id uniqueidentifier not null primary key,
	namn varchar(128) not null,
	kortnamn varchar(4) not null,
	adress varchar(128)
)
create unique index idx_plats_namn on plats(namn) 

drop table ledare
create table ledare
(
	id uniqueidentifier not null primary key,
	namn varchar(128) not null
)
create unique index idx_ledare_namn on ledare(namn) 

drop table pass
create table pass
(
	id uniqueidentifier not null primary key,
	passid int not null,
	plats varchar(128),
	sal varchar(128),
	ledare varchar(256),
	passtyp varchar(128) not null,
	bokningar int not null,
	max_bokningar int not null,
	starttid datetime not null,
	sluttid datetime not null,
	anlänt int default 0,
	ledarid uniqueidentifier references ledare(id),
	platsid uniqueidentifier references plats(id),
	skapad datetime not null default getdate()
)
create unique index idx_pass_passid on pass(passid)
create index idx_pass_starttid on pass(starttid)
create index idx_pass_sluttid on pass(sluttid)
create index idx_pass_ledare on pass(ledare)
create index idx_pass_plats on pass(plats)

insert into plats(id, namn, kortnamn) values(newid(), 'Annexet R&R', 'AN')
insert into plats(id, namn, kortnamn) values(newid(), 'City', 'CI')
insert into plats(id, namn, kortnamn) values(newid(), 'Farsta', 'FA')
insert into plats(id, namn, kortnamn) values(newid(), 'Gärdet', 'GÄ')
insert into plats(id, namn, kortnamn) values(newid(), 'Hornstull', 'HO')
insert into plats(id, namn, kortnamn) values(newid(), 'Karolinska', 'KA')
insert into plats(id, namn, kortnamn) values(newid(), 'Kista Entré', 'KI')
insert into plats(id, namn, kortnamn) values(newid(), 'Kungsholmen', 'KU')
insert into plats(id, namn, kortnamn) values(newid(), 'Lindhagen', 'LI')
insert into plats(id, namn, kortnamn) values(newid(), 'Ringen', 'RI')
insert into plats(id, namn, kortnamn) values(newid(), 'Råcksta', 'RÅ')
insert into plats(id, namn, kortnamn) values(newid(), 'Skarpnäck', 'SN')
insert into plats(id, namn, kortnamn) values(newid(), 'Skrapan', 'SK')
insert into plats(id, namn, kortnamn) values(newid(), 'Sveavägen', 'SV')
insert into plats(id, namn, kortnamn) values(newid(), 'Övrigt Friluft', 'FL')

drop table passtyp
create table passtyp
(
	id uniqueidentifier not null primary key,
	namn varchar(128)
)
create unique index idx_passtyp_namn on passtyp(namn)

-- Temp!
select distinct 'insert into passtyp(id, namn) values(newid(),' + '''' + passtyp + ''')' from pass

--insert into passtyp(id, namn) values(newid(),'Aerobics 1')
insert into passtyp(id, namn) values(newid(),'Cirkelfys')
/*
insert into passtyp(id, namn) values(newid(),'Cirkelgym')
insert into passtyp(id, namn) values(newid(),'Core')
insert into passtyp(id, namn) values(newid(),'Cross 75')
insert into passtyp(id, namn) values(newid(),'Dans')
insert into passtyp(id, namn) values(newid(),'Indoor walking/medel')
insert into passtyp(id, namn) values(newid(),'Jogg/intensiv 90')
insert into passtyp(id, namn) values(newid(),'Jogg/medel 90')
insert into passtyp(id, namn) values(newid(),'Jympa/Bas')
*/
insert into passtyp(id, namn) values(newid(),'Jympa/Intensiv')
/*
insert into passtyp(id, namn) values(newid(),'Jympa/Medel')
insert into passtyp(id, namn) values(newid(),'Jympa/Senior')
insert into passtyp(id, namn) values(newid(),'Ki balans')
*/
insert into passtyp(id, namn) values(newid(),'Skivstång')
insert into passtyp(id, namn) values(newid(),'SkivstångIntervall')
--insert into passtyp(id, namn) values(newid(),'Spinning/Bas')
insert into passtyp(id, namn) values(newid(),'Spinning/Medel')
insert into passtyp(id, namn) values(newid(),'Spinning/Puls')
/*
insert into passtyp(id, namn) values(newid(),'Step 1')
insert into passtyp(id, namn) values(newid(),'Yoga 1')
*/

--delete from passtyp
select * from passtyp