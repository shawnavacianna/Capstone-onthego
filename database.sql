create database onthego;
use onthego;

create table User(
	user_id int,
	password varchar(40),
	username varchar(12),
	user_type varchar(10),
	primary key (user_id)
);

create table Driver(
	driver_id int,
	firstname varchar(15),
	lastname varchar(15),
	status varchar(20),
	lat float(10,6),
	lng float(10,6),
	contact_number varchar(10),
	password varchar(40),
	primary key (driver_id,contact_number)
);

create table randomclients(
	random_id int NOT NULL auto_increment,
	latitude float,
	longitude float,
	primary key(random_id)
);
alter table randomclients auto_increment = 40000;

create table randomclients2(
	id int NOT NULL auto_increment,
	location varchar(200),
	primary key(id)
);	
alter table randomclients2 auto_increment = 50000;

create table Vehicle(
	vehicle_id int auto_increment not null,
	driver_id int,
	license_number varchar(10),
	year int,
	make varchar(12),
	model varchar(20),
	primary key(vehicle_id,license_number)
	
);

create table Rating(
	rating_id int auto_increment,
	driver_id int,
    client_id int,
	stars int,
	review varchar(40),
	primary key (rating_id)
	
);

create table Jobs(
	job_id int auto_increment,
	driver_id int,
	client_id int,	
	client_location varchar(40),
	client_destination varchar(40),
	pick_up_instructions varchar(100),
	drop_off_instructions varchar(100),
	status varchar(40),
	alias varchar (40),
	job_time time,
	additional_info varchar(400),
	jobdate date,
	primary key (job_id)
		
); 

create table Client(
	client_id int,
	fname varchar(15),
	lname varchar(15),	
	contact_number varchar (10),
	password varchar(40),
	additional_info varchar(500),
	primary key (client_id)
);

create table Client_location(
	client_id int,
	latitude float,
	longitude float,
	location varchar(80),
	primary key(client_id),
	foreign key(client_id) references Client(client_id) on delete cascade on update cascade
); 

create table Driver_Vehicle(
	dv_id int auto_increment,
	driver_id int,
	vehicle_id int,
	primary key(dv_id)
);

create table Lastdriveridused(
	driverid int,
	primary key(driverid)
);

create table Lastclientidused(
	clientid int,
	primary key(clientid)
);

create table lastvehicleidused(
	vehicle_id int,
	primary key(vehicle_id)
);

create table other_info(
	other_id int,
	avg_speed int,
	time_poling int,
	vicinity int,
	response_time int,
	primary key (other_id)
); 
	

create table jobinfo(
	alias varchar (50),
	destination varchar(500),
	pick_up_instructions varchar(500),
	drop_off_instructions varchar (500)
);


/******************INSERTING DUMMY DATA BELOW***************************************/ 

insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20000','Greg', 'Edwards','876-9090', md5('password'),'client has bad roads');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20001','Fred', 'Red', '876-9098', md5('password'),'always falls asleep');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20002','Kayla', 'Green','234-6879', md5('password'),'n/a');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20003','Langi', 'Gayle','444-3234', md5('password'),'n/a');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20004','Colin', 'White','765-3425', md5('password'),'very vulgar');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20005','Carl', 'Beckford','872-8909', md5('password'),'n/a');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20006','Bob', 'Black','872-8409', md5('password'),'never at location on time');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20007','Shorna', 'Henry','832-8909', md5('password'),'n/a');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20008','Nicholas', 'George','272-8409', md5('password'),'n/a');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20009','Ryan', 'Morris','832-4909', md5('password'),'n/a');
insert into Client (client_id, fname, lname, contact_number, password, additional_info) values ('20010','Aundre', 'Edwards','678-9325', md5('password'),'n/a');

insert into Client_location (client_id, latitude, longitude, location) values ('20000','18.02','76.97','half way tree');
insert into Client_location (client_id, latitude, longitude, location) values ('20001','17.49','76.39','mona');
insert into Client_location (client_id, latitude, longitude, location) values ('20002','17.56','76.59','spanishtown');
insert into Client_location (client_id, latitude, longitude, location) values ('20003','17.54','76.49','molynes');
insert into Client_location (client_id, latitude, longitude, location) values ('20004','17.52','76.89','ensome');
insert into Client_location (client_id, latitude, longitude, location) values ('20005','17.51','76.99','eltham');
insert into Client_location (client_id, latitude, longitude, location) values ('20006','17.23','76.19','ardenne road');
insert into Client_location (client_id, latitude, longitude, location) values ('20007','17.44','76.60','spanishtown road');
insert into Client_location (client_id, latitude, longitude, location) values ('20008','17.57','76.23','boulevard');
insert into Client_location (client_id, latitude, longitude, location) values ('20009','18.59','76.54','mandela');

insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000000','Aundre','Edwards','unavailable','18.003498', '-76.792091','333-3456',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000001','Sharna','Velow','available','18.001499','-76.782089','444-9087',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000002','Saran','Wilson','available',' 18.003300', '-76.702087','333-0987',md5('passowrd')); 
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000003','South','West','available','18.002468','-76.992088','211-8765',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000004','Dre','Frank','unavailable',' 18.001499',' -76.781090','333-4444',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000005','Shorna','White','available',' 18.003300','-76.702019','544-0000',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000006','Nick','Red','available',' 18.003139','-76.702187','555-0098',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000007','Sharon','Black','available','18.001240','-76.703087','999-9777',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000008','Cristiano','Ronaldo','available','18.001299','-76.802094','999-1777',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000009','Lionel','Richards','available','18.004299','-76.302094','919-9777',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000010','Marvin','Dewight','available','18.002310','-76.792091','299-9777',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000011','Riddim','Boss','available','18.002499','-76.788849','999-9277',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000012','Saran','Wilson','unavailable','18.003300','-76.702087','999-9777',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000013','Jonathon','South','available','18.004236','-76.801018','991-9777',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000014','Shawna-kay','Vacianna','unavailable','18.005135','-76.811829','999-9077',md5('passowrd'));
insert into Driver (driver_id,firstname, lastname, status, lat, lng, contact_number,password) values ('10000015','Richard','Blake','unavailable','17.998442','-76.760780','339-9777',md5('passowrd'));

insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000000','10000000','1234ER','2016','honda','civic');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000001','10000001','2234GH','2012','toyota','corolla');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000002','10000002','3234HH','2015','mazda','rx8');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000003','10000003','1534YU','2017','toyota','camry');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000004','10000004','5234LO','2018','nissan','sunny');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000005','10000005','1234FF','2011','honda','accord');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000006','10000006','1234SS','2010','honda','fit');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000007','10000007','1234FT','2013','toyota','townace');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000008','10000008','1234GH','2012','hyundai','accent');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000009','10000009','1234BN','2011','suzuki','swift');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000010','10000010','1034NN','2015','suzuki','vitara');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000011','10000011','123RNN','2016','toyota','hiace');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000012','10000012','224EBN','2010','mazda','dimeo');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000013','10000013','0234BN','2011','honda','accord');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000014','10000014','1634TN','2011','honda','odyssey');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000015','10000015','1234BY','2016','nissan','skyline');
insert into Vehicle (vehicle_id, driver_id,license_number, year, make, model) values ('60000016','10000015','1234BB','2017','nissan','b13');

insert into Driver_Vehicle (dv_id,driver_id, vehicle_id) values ('1','10000000','60000000');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000001','60000001');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000002','60000002');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000003','60000003');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000004','60000004');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000005','60000005');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000006','60000006');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000007','60000007');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000008','60000008');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000009','60000009');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000010','60000010');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000011','60000011');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000012','60000012');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000013','60000013');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000014','60000014');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000015','60000015');
insert into Driver_Vehicle (driver_id, vehicle_id) values ('10000015','60000016');

insert into Jobs (job_id,driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('1','10000001','20000','mona road', 'spanishtown','toot horn at gate twice','stop at green house','completed','Greg Edwards','12:30:00','bad roads','2018-08-09'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000002','20001','portmore', 'half way tree','call me upon arrival','press 65 at gate','in progress','southy','16:33:09','alot of traffic','2018-11-09'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000003','20002','mona road', 'ochi rios','toot horn at gate twice','stop at green house','completed','Kayla Green','18:35:06','violent area','2017-08-09'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000005','20003','mona road', 'Montego Bay','toot horn at gate twice','stop at blue house','completed','Langi Gayle','16:35:06','nice community','2014-08-09'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000006','20004','portmore', 'molynes road','call me upon arrival','press 55 at gate','in progress','riddim','15:35:06','bad dogs at gate','2018-02-09');
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000007','20005','mona road', 'hope road','toot horn at gate twice','stop at green house','completed','Carl Beckford','17:35:06','n/a','2018-03-19'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000008','20006','portmore', 'half way tree','call me upon arrival','press 55 at gate','in progress','shawnshawn','14:35:06','n/a','2018-08-02'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000009','20007','mona road', 'spanishtown','toot horn at gate twice','stop at green house','completed','Shorna Henry','11:35:06','n/a','2018-08-19'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000009','20010','mona road', 'spanishtown','toot horn at gate twice','stop at green house','completed','Aundre Edwards','11:35:06','n/a','2017-08-09'); 
insert into Jobs (driver_id, client_id, client_location, client_destination, pick_up_instructions, drop_off_instructions, status, alias, job_time, additional_info,jobdate) values ('10000009','20008','downtown', 'spanishtown','call my cell','stop at green shop','completed','Nic George','11:35:06','n/a','2018-08-09'); 

insert into jobinfo (alias, destination, pick_up_instructions, drop_off_instructions) values ('gazaman','mona road','toot horn at gate twice','stop at green house');
insert into jobinfo (alias, destination, pick_up_instructions, drop_off_instructions) values ('breezy','portmore','call me upon arrival','press 65 at gate');

insert into other_info (other_id,avg_speed, time_poling, vicinity, response_time) values ('1','50','5','50','5');

insert into randomclients (random_id, latitude, longitude) values ('4000','18.0196','-76.9649');
insert into randomclients (random_id, latitude, longitude) values ('4001','18.0296','-76.9644');
insert into randomclients (random_id, latitude, longitude) values ('4002','18.0186','-76.9645');
insert into randomclients (random_id, latitude, longitude) values ('4003','18.0176','-76.9642');
insert into randomclients (random_id, latitude, longitude) values ('4004','18.0206','-76.9643');

insert into randomclients2 (id,location) values ('50000','Half Way Tree');
insert into randomclients2 (id,location) values ('50001','Morant Bay');
insert into randomclients2 (id,location) values ('50002','Portmore');
insert into randomclients2 (id,location) values ('50003','Spanish Town');
insert into randomclients2 (id,location) values ('50004','Molynes Road');
insert into randomclients2 (id,location) values ('50005','Clarendon');

insert into Lastclientidused (clientid) values ('20010');
insert into Lastdriveridused (driverid) values ('10000015');
insert into lastvehicleidused (vehicle_id) values ('60000016');

insert into Rating (rating_id,driver_id, client_id, stars, review) values ('1','10000000','20000','5','amazing driving'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000001','20001','3','ok driving'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000002','20002','5','amazing driving'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000003','20003','2','satisfactory driving'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000004','20004','1','shakey driving'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000005','20005','4','good driving'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000006','20006','3','not bad around the wheel'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000007','20007','2','he swerves too much'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000008','20008','1','drives way too fast'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000009','20009','5','i felt safe'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000010','20010','5','amazing driving'); 
insert into Rating (driver_id, client_id, stars, review) values ('10000010','20005','5','amazing driving'); 

insert into User (user_id, password, username, user_type) values ('10000000',md5('password'),'eddi','driver');
insert into User (user_id, password, username, user_type) values ('10000001',md5('password'),'svaaz','driver');
insert into User (user_id, password, username, user_type) values ('10000002',md5('password'),'swilson','driver');
insert into User (user_id, password, username, user_type) values ('10000003',md5('password'),'swest','driver');
insert into User (user_id, password, username, user_type) values ('10000004',md5('password'),'fredre','driver');
insert into User (user_id, password, username, user_type) values ('10000005',md5('password'),'swite','driver');
insert into User (user_id, password, username, user_type) values ('10000006',md5('password'),'nred','driver');
insert into User (user_id, password, username, user_type) values ('10000007',md5('password'),'sblaxx','driver');
insert into User (user_id, password, username, user_type) values ('10000008',md5('password'),'cr7','driver');
insert into User (user_id, password, username, user_type) values ('10000009',md5('password'),'m10','driver');
insert into User (user_id, password, username, user_type) values ('10000010',md5('password'),'marvindibeast','driver');
insert into User (user_id, password, username, user_type) values ('10000011',md5('password'),'rboss','driver');
insert into User (user_id, password, username, user_type) values ('10000012',md5('password'),'swilson','driver');
insert into User (user_id, password, username, user_type) values ('10000013',md5('password'),'southy','driver');
insert into User (user_id, password, username, user_type) values ('10000014',md5('password'),'shawnamhm','driver');
insert into User (user_id, password, username, user_type) values ('10000015',md5('password'),'richi','driver');

insert into User (user_id, password, username, user_type) values ('20000',md5('password'),'gazaman','client');
insert into User (user_id, password, username, user_type) values ('20001',md5('password'),'breezy','client');
insert into User (user_id, password, username, user_type) values ('20002',md5('password'),'hottaz','client');
insert into User (user_id, password, username, user_type) values ('20003',md5('password'),'coolkidd','client');
insert into User (user_id, password, username, user_type) values ('20004',md5('password'),'thebossman','client');
insert into User (user_id, password, username, user_type) values ('20005',md5('password'),'cleandon','client');
insert into User (user_id, password, username, user_type) values ('20006',md5('password'),'rastaman','client');
insert into User (user_id, password, username, user_type) values ('20007',md5('password'),'wifey','client');
insert into User (user_id, password, username, user_type) values ('20008',md5('password'),'girldemsugar','client');
insert into User (user_id, password, username, user_type) values ('20009',md5('password'),'shadow','client');
insert into User (user_id, password, username, user_type) values ('20010',md5('password'),'aedwards','client');

insert into User (user_id, password, username, user_type) values ('30000',md5('password'),'allen','admin');
insert into User (user_id, password, username, user_type) values ('30001',md5('password'),'coore','admin');
insert into User (user_id, password, username, user_type) values ('30002',md5('password'),'fokum','admin');

/*EVERYTHING BELOW IS FOR SHAWNA*/
/*select d.*, v.* from Driver d, Vehicle v where d.user_id = v.user_id and d.user_id = "10000007";


