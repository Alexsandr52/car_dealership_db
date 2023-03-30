drop database car_dealership;
create database car_dealership;
use car_dealership;

create table if not exists cars(
	id BIGINT unsigned not null auto_increment primary key,
    stamp VARCHAR(50),
    country_of_origin ENUM ('UK', 'GR', 'USA', 'RU') default 'UK',
    country_of_use ENUM ('UK', 'RU') default 'RU',
    year_of_release DATETIME default CURRENT_TIMESTAMP
);


create table if not exists preference(
	car_id BIGINT unsigned not null,
    price BIGINT,
    model VARCHAR(50) not null,
    fuel VARCHAR(50) not null,
    colour VARCHAR(50) not null,
    `type` VARCHAR(50) not null,
    class CHAR(1) COMMENT 'класс',
	equipment VARCHAR(50),
	description text,
	foreign key (car_id) references cars(id),
	PRIMARY KEY (car_id)
);

create table if not exists media_types(
	id BIGINT unsigned not null auto_increment primary key,
    name VARCHAR(255) not null,
    created_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table if not exists media(
	id BIGINT unsigned not null auto_increment primary key,
    media_type_id BIGINT unsigned not null,
    car_id BIGINT unsigned not null,
  	body text,
    filename VARCHAR(255),
    size INT,
    created_at DATETIME default NOW(),
    updated_at DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
	index (car_id),
    foreign key (car_id) references cars(id),
    foreign key (media_type_id) references media_types(id)
);

create table if not exists `user`(
	id BIGINT unsigned not null auto_increment primary key,
	firstname VARCHAR(50) not null,
    lastname VARCHAR(50) not null,
    country ENUM ('UK', 'GR', 'USA', 'RU') default 'UK',
    birthday DATETIME default NOW(),
    email VARCHAR(120) unique,
    phone BIGINT  not null unique
);

create table if not exists orders(
	id BIGINT unsigned not null auto_increment primary key,
	car_id BIGINT unsigned not null,
	user_id BIGINT unsigned not null,
	order_time DATETIME default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
	paid BOOLEAN,
	foreign key (car_id) references cars(id),
	foreign key (user_id) references `user`(id)
);

	
create table if not exists staff(
	user_id BIGINT unsigned not null,
	post VARCHAR(50),
	salary BIGINT,
	description TEXT,
	foreign key (user_id) references `user`(id),
	PRIMARY KEY (user_id)
);	

create table if not exists comments(
	id BIGINT unsigned not null auto_increment primary key,
	user_id BIGINT unsigned not null,
	car_id BIGINT unsigned not null,
	value TEXT,
	`rank` INT,
	`read` CHAR(1),
	foreign key (car_id) references cars(id),
	foreign key (user_id) references `user`(id)
);

create table if not exists message(
	id BIGINT unsigned not null auto_increment primary key,
	user_id BIGINT unsigned not null,
	value TEXT,
	is_delivered BOOLEAN,
	`date` DATETIME default NOW(), 
	foreign key (user_id) references `user`(id)
);

create table if not exists support_chat(
	id BIGINT unsigned not null auto_increment primary key,
	support_id BIGINT unsigned not null,
	message_id BIGINT unsigned not null,
	is_read BOOLEAN,
	foreign key (support_id) references staff(user_id),
	foreign key (message_id) references message(id)
);


#inserts
-- INSERT INTO `cars` VALUES (1,' \'opel\'','GR','UK','1973-03-25 22:44:58'),(2,' \'toyota\'','GR','UK','2009-01-26 01:42:08'),(3,' \'opel\'','UK','UK','1994-04-30 14:14:13'),(4,' \'opel\'','RU','UK','1971-07-29 17:48:22'),(5,' \'patriot\'','RU','UK','2001-01-19 12:20:11'),(6,' \'toyota\'','RU','RU','2008-02-26 06:48:54'),(7,' \'patriot\'','RU','RU','1985-07-16 18:13:00'),(8,'\'audi\'','GR','UK','2000-04-24 00:28:03'),(9,' \'opel\'','GR','UK','2007-03-25 19:29:49'),(10,' \'patriot\'','GR','UK','1997-03-03 08:19:22');
-- INSERT INTO `preference` VALUES (1,74047477,'\'camry\'',' \'diesel\'',' \'green\'','\'hatchbag\'','\'','\'1/3\'','Rem quidem ut consequatur et ut. Et id sit et itaque officia incidunt. Est dolores quia rerum fuga. Consequatur consequatur qui error.'),(2,17681101,' \'p300\'','\'petrol\'','\'red\'','\'hatchbag\'','\'',' \'2/3\'','Odio inventore sed dolore. Unde necessitatibus consectetur voluptatem non omnis. Ad ea excepturi repudiandae cupiditate consequuntur quia.'),(3,81094852,' \'A1\'','\'petrol\'','\'red\'','\'hatchbag\'','\'',' \'2/3\'','Odit impedit iusto enim cum esse reprehenderit optio. Fuga eum non neque et occaecati. Iste est omnis maiores aliquid voluptatem voluptas.'),(4,44840956,' \'p300\'',' \'diesel\'',' \'green\'',' \'sedan\'','\'','\'1/3\'','Autem necessitatibus qui voluptatibus delectus qui nam dicta. Voluptas omnis est ea esse eos dolor. Quae cum eos doloremque est. Dolore in qui explicabo natus iusto quia.'),(5,15566932,' \'p300\'',' \'diesel\'','\'red\'','\'hatchbag\'','\'','\'1/3\'','Voluptatem laudantium eveniet rem nisi reiciendis voluptatibus corrupti a. Aperiam itaque nostrum non sit voluptatem nisi temporibus. Ut autem qui consequuntur rerum sapiente rerum eveniet.'),(6,84205599,' \'A1\'',' \'diesel\'','\'red\'','\'hatchbag\'','\'','\'1/3\'','Molestiae voluptatem consequatur eligendi. A deserunt ab est. Qui explicabo veniam corporis vel dolores. Blanditiis in consequuntur est aut qui.'),(7,78260564,'\'camry\'','\'petrol\'',' \'green\'','\'hatchbag\'','\'',' \'2/3\'','Expedita iure voluptatem est eum ut. Sunt amet aspernatur qui. Provident aut optio occaecati a recusandae. Voluptatem accusantium in totam et doloribus numquam.'),(8,60744104,' \'A1\'','\'petrol\'',' \'green\'','\'hatchbag\'','\'','\'1/3\'','Hic et assumenda et molestiae et similique nobis. Et qui deleniti voluptate soluta ut cupiditate. Officia qui quia nesciunt modi vero.'),(9,20356308,' \'A1\'',' \'diesel\'',' \'green\'','\'hatchbag\'','\'',' \'2/3\'','Tempore corporis corrupti sapiente. Ipsa qui nam quaerat error. Ullam suscipit eveniet ut. Quae non eaque facere est rerum est. Sunt quis numquam cupiditate vel maiores similique nesciunt est.'),(10,47132557,' \'p300\'','\'petrol\'','\'red\'',' \'sedan\'','\'','\'1/3\'','Dicta suscipit ut consequatur deleniti nulla. Aut sit fugit laboriosam. Molestiae eveniet et sed corporis possimus velit. Perferendis minus ut sunt quod debitis nostrum aut.');
-- INSERT INTO `media_types` VALUES (1,' mp4','2012-09-21 03:27:43'),(2,'mp3','1985-08-25 05:30:06'),(3,'mp3','1993-02-19 13:35:06'),(4,' png','2011-09-05 11:24:54'),(5,' jpg','1992-04-30 06:06:45'),(6,' png','1991-09-27 21:07:42'),(7,' png','1971-08-11 14:18:55'),(8,' png','2020-02-27 10:02:38'),(9,' jpg','1991-03-02 21:54:10'),(10,' png','1990-07-18 20:29:05');
-- INSERT INTO `media` VALUES (1,1,1,'Sunt id sunt adipisci repudiandae mollitia. Nemo enim sit consequatur consequatur assumenda voluptas. Quia facilis corporis at cumque odio.','ut',4977,'2006-12-16 04:12:37','2000-04-05 14:52:41'),(2,2,2,'Dolorem amet quod quibusdam voluptas cum nostrum. Eos qui pariatur ex dignissimos quos quae rerum. Fugit doloremque reprehenderit est consequuntur dolorem soluta veritatis ea.','perferendis',1941,'1984-06-04 18:46:18','1973-08-06 21:00:51'),(3,3,3,'Aspernatur dolorem error dolore pariatur sit perspiciatis id. Corporis reiciendis exercitationem tenetur quia sapiente animi temporibus. Molestiae ad voluptatem ex tenetur est quo.','quos',1229,'2006-02-07 16:07:20','1988-02-16 12:09:30'),(4,4,4,'Quidem minus incidunt quos qui pariatur. A adipisci id est nemo alias quia et ea. Ut ullam ducimus culpa aut ut ut voluptatem. Asperiores quis autem tenetur aut.','et',2733,'2003-12-31 19:49:12','1984-11-05 19:42:33'),(5,5,5,'Odio est a est. Aut magni impedit ullam aut et sed. Eum nostrum ex ex illum et odit tenetur. Magnam quia culpa voluptatem et eius.','et',3561,'2015-01-09 17:22:53','2020-12-12 20:27:09'),(6,6,6,'Ex voluptas optio aut voluptate veritatis et. Assumenda architecto itaque minima et dolorem et ut. Eos quia voluptas et libero et sit. Soluta eos optio recusandae sint suscipit sunt commodi.','nihil',1553,'1994-03-29 01:03:48','2001-09-13 08:34:20'),(7,7,7,'Perspiciatis voluptas eos maxime deleniti dolor molestias. Saepe sit officiis rem aut minus dolores voluptatem. Ea possimus neque repudiandae quo. Non ab velit voluptatum.','nihil',844,'2007-06-24 22:01:05','2020-08-05 23:54:10'),(8,8,8,'Quod placeat enim et optio quo et nam. Aut impedit soluta consequatur consequatur.','corporis',3337,'2013-02-16 14:02:08','2013-10-27 16:21:00'),(9,9,9,'Iure quo vel illo tempore. Nihil quasi ipsa quia harum totam laborum. Error quo sit neque incidunt voluptatum laborum iure magnam. Voluptatem perferendis porro nulla deleniti fugit.','vitae',914,'2007-08-14 17:00:23','1977-11-06 03:39:46'),(10,10,10,'Sit aut iure aspernatur maiores eaque dolor. Est modi dolor nisi error aut aliquam aliquid. Et earum nulla vel officiis aliquam qui.','aut',2918,'1978-09-04 08:20:36','2016-11-05 14:53:45');
-- INSERT INTO `user` VALUES (11,'Jonathan','McLaughlin','GR','2016-11-14 02:08:28','tiara19@example.net',0),(12,'Bernadine','Franecki','GR','1998-07-02 15:34:45','coby.mcglynn@example.com',241074),(13,'Antonietta','Dickinson','UK','1972-10-02 10:57:04','wkuvalis@example.net',63),(14,'Liliana','Kozey','GR','1978-12-23 00:40:31','kutch.adalberto@example.org',706),(15,'Marquis','Lubowitz','USA','1996-02-14 02:56:47','marshall99@example.org',898783),(17,'Jenifer','Jakubowski','GR','2021-09-16 22:17:46','rkrajcik@example.com',278),(18,'Anastasia','Little','USA','2000-03-23 00:07:22','hmurray@example.org',6460864345),(19,'Lilla','Wilkinson','USA','1989-07-13 03:17:08','flittel@example.com',3347),(20,'Mireille','Halvorson','RU','2012-07-06 21:46:40','jedidiah27@example.com',514464);
-- INSERT INTO `orders` VALUES (1,1,11,'1998-04-30 17:02:29',1),(2,2,12,'1993-10-29 11:02:41',1),(3,3,13,'1990-10-05 18:15:42',0),(4,4,14,'2021-07-11 03:16:16',1),(5,5,15,'1980-05-07 20:58:13',0),(6,6,17,'2007-07-10 20:05:35',1),(7,7,18,'1974-08-06 01:14:47',1),(8,8,19,'2022-02-07 08:46:43',1),(9,9,20,'1994-08-28 14:09:07',0),(10,10,11,'1974-10-28 16:12:08',0);
-- INSERT INTO `staff` VALUES (11,' salesman',38976,'Consequatur ab qui praesentium ut animi et. Iste deleniti perferendis sint. Eos esse aliquam velit et perferendis impedit non.'),(12,'mechanic',50311,'Aut qui unde quis rerum corporis enim aliquid. Necessitatibus incidunt tenetur minima ducimus quod rerum. Ullam reiciendis repellendus illum dignissimos fugit et.'),(13,' salesman',32102,'At voluptatem veritatis fugiat minima eveniet fugit eaque. Velit necessitatibus maxime iure quisquam ratione sed. Voluptatem non sed consequuntur et aperiam voluptatem occaecati.'),(14,' marketing specialist',57694,'Nam dicta praesentium aut. Et et repellat est eum mollitia voluptatem et. Quas enim tenetur nostrum quo non assumenda. Placeat laboriosam doloribus numquam voluptatum.'),(15,'mechanic',82906,'Doloremque fugiat itaque facere. Maxime blanditiis ad omnis. Est quia magni aliquid nisi veniam laboriosam aliquid.');
-- INSERT INTO `comments` VALUES (1,11,1,'Eum quisquam ratione facere. Incidunt sit ut nam. Voluptatem sapiente pariatur totam nihil quis voluptate.',1,'1'),(2,12,2,'Beatae nemo nulla est aut aperiam sint dignissimos. Cum delectus eligendi et voluptas eum quasi at eos. Provident quibusdam voluptates quam reprehenderit enim. Dignissimos aut sed nihil officiis sit numquam in. Minima nobis quia sed cupiditate ullam.',6,'1'),(3,13,3,'Cumque pariatur omnis velit laboriosam sit. Quas illum id itaque. Quo sit eveniet nobis consectetur culpa. Repudiandae eius veniam voluptatem neque voluptatum amet. Consequatur velit aliquid quibusdam et.',5,'1'),(4,14,4,'Perferendis in ut alias vitae. Nihil a modi sapiente dolor ducimus ex.',3,'1'),(5,15,5,'Officiis repellendus nam occaecati est error maxime. Voluptatem et debitis doloribus facilis id. Et dolorum ut quam asperiores error. Consequatur sunt est aut dolores cupiditate qui doloremque.',10,''),(6,17,6,'Et cumque eveniet quo est illum ipsam. Velit cumque voluptas esse rem consequatur. Voluptatum facilis dolor laborum nostrum adipisci nam. Aperiam accusantium optio rerum at et fugiat voluptas.',10,''),(7,18,7,'Ea et dignissimos quia est assumenda non. Exercitationem et voluptas cumque omnis et nisi. Vel quisquam doloribus laboriosam laborum voluptas.',9,'1'),(8,19,8,'Dolorem tempora eum dicta illum qui in dolore maiores. Consequatur dolor autem ipsum adipisci distinctio non. Illo maxime optio suscipit eaque ipsam. Qui minima sunt error mollitia. Et minima laudantium reprehenderit distinctio.',6,''),(9,20,9,'Quidem voluptatem neque laboriosam excepturi facilis dicta. Est ipsum ex laudantium consectetur sed possimus nulla. Qui cumque vero ullam cum corporis voluptatem dolore.',1,'1'),(10,11,10,'Libero harum voluptas molestiae voluptates beatae perferendis. Nobis doloribus ipsum ipsa dolore. Quis omnis est enim non. Impedit molestias beatae labore distinctio qui qui. Delectus autem impedit voluptas assumenda eaque enim ducimus sit.',10,'1');
-- INSERT INTO `message` VALUES (1,11,'Qui sit ut animi officiis. Cumque esse occaecati qui aspernatur. Praesentium placeat vero accusamus dolor debitis debitis. Aut deleniti est sed assumenda et.',0,'2010-02-23 21:56:29'),(2,12,'Sed aut ut omnis fugit vel consectetur sequi. Unde impedit ab sed. Nihil molestiae maxime cupiditate possimus.',1,'2013-12-01 01:56:37'),(3,13,'Saepe excepturi in quas nobis laboriosam tempora modi. Aut inventore ut possimus consequatur error in facilis.',0,'2000-01-16 07:14:20'),(4,14,'Nihil ea ratione consequatur libero velit ad. Excepturi qui tenetur et quia sit. Voluptas unde corrupti libero omnis delectus accusamus.',1,'1990-12-09 05:12:51'),(5,15,'Ex beatae voluptatibus commodi nostrum. Rerum facere laborum maiores aut porro occaecati. Possimus cupiditate ratione architecto et. Ea voluptas voluptatem itaque necessitatibus nihil dolorum qui. Illum accusantium deleniti voluptatem facilis ipsa placeat.',0,'1982-11-26 09:29:27'),(6,17,'Qui fugit deserunt non cumque autem excepturi magnam. Iste aut dolores consectetur aspernatur itaque. Dicta ad sunt assumenda vel. Excepturi sapiente non occaecati accusamus velit odit assumenda.',1,'1988-02-09 12:09:59'),(7,18,'Quo voluptas laudantium et est. Natus soluta laboriosam vel reprehenderit. Et modi qui est officiis ad quas.',1,'1982-11-02 18:46:21'),(8,19,'Est aspernatur impedit quisquam est et mollitia ut. Sapiente ut sint facere.',1,'1998-12-20 01:59:58'),(9,20,'Sed veniam est iste aut rerum earum ratione. Reprehenderit rerum et voluptatem ut occaecati. Eaque et sit dicta voluptas. Quis quo nobis natus.',1,'2012-09-24 16:57:09'),(10,11,'Quia totam quod velit voluptates sed iure eos. Et doloremque cum porro illo fugit odio dolorem. Fugit ea ut cumque dolorem accusamus quis omnis minus. Voluptatem perferendis error perspiciatis et placeat consequatur neque.',1,'1996-10-23 11:51:22');
-- INSERT INTO `support_chat` VALUES (11,11,1,1),(12,12,2,1),(13,13,3,0),(14,14,4,1),(15,15,5,0),(20,11,10,1);


