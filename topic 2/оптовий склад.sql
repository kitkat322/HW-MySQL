CREATE DATABASE IF NOT EXISTS оптовий_склад;

use оптовий_склад;


CREATE TABLE клієнти
(
id INT auto_increment NOT NULL,
імя varchar(50) not null,
дата_народження DATE not null,  -- Дата в формате YYYY-MM-DD
телефон varchar(15) default 'Unknown',
e_mail varchar(30),
адреса varchar(50),
primary key(id)
);


insert into клієнти (імя, дата_народження, телефон, e_mail, адреса)
values 
('Олег Денисенко', '1995-10-22', '+380956474748', 'oleg.d@gmaol.com', 'вул. Сумська 54'),
('Яна Єгорова', '1996-09-12', '+3806389545', 'yana.y@gmaol.com', 'вул. Зернова 57'),
('Олена Колеснікова', '1999-04-02', '+38098949432', 'olena.k@gmaol.com', 'пр. Захисників 81');

ALTER TABLE клієнти DROP PRIMARY KEY, ADD PRIMARY KEY (id);

ALTER TABLE клієнти ADD UNIQUE (імя, дата_народження);

select * from клієнти;

ALTER DATABASE
    оптовий_склад
    CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_unicode_ci;



CREATE TABLE постачальники_товарів
(
id INT auto_increment NOT NULL,
імя varchar(100) UNIQUE,
телефон varchar(12) default 'Unknown',
primary key(id)
);

drop table постачальники_товарів;

insert into постачальники_товарів (імя, телефон)
values 
('Постачальник 1', '+3809564747'),
('Постачальник 2', '+3806284949');

select * from постачальники_товарів;



CREATE TABLE товари
(
id INT auto_increment NOT NULL,
назва varchar(100) not null,
артикул varchar(20) not null UNIQUE,
наявна_кількість int,
роздрібна_ціна float,
оптова_ціна float,
постачальник varchar(100),
артикул_у_постачальника varchar(20),
foreign key (постачальник) references постачальники_товарів(імя),
primary key(id)
);

insert into товари (назва, артикул, наявна_кількість, роздрібна_ціна, оптова_ціна, постачальник, артикул_у_постачальника)
values 
('Товар 1', 'er53637', 22, 605.90, 557.90, 'Постачальник 1', 'am1234'),
('Товар 2', 'hfdj673', 22, 78.90, 40.90, 'Постачальник 1', 'mf7483'),
('Товар 3', 'fm9038', 22, 282.90, 243.90, 'Постачальник 2', 'fb04030'),
('Товар 4', 'lf73839', 22, 534.90, 349.90, 'Постачальник 2', 'g902');

drop table товари;
select * from товари;

drop table клієнти;


CREATE TABLE постачання
(
id INT auto_increment NOT NULL,
id_постачальника int not null,
імя_постачальника varchar(100),
артикул_у_постачальника varchar(20),
id_товару int not null,
артикул_товару varchar(50),
дата_замовлення date,
кількість int,
вартість float,
foreign key (id_постачальника) references постачальники_товарів(id),
foreign key (id_товару) references товари(id),
foreign key (артикул_товару) references товари(артикул),
primary key(id)
);

select * from постачання;



CREATE TABLE замовлення_клієнтів
(
id INT auto_increment NOT NULL,
id_клієнта int not null,
id_товару int not null,
дата_замовлення date,
кількість int,
вартість float,
foreign key (id_клієнта) references клієнти(id),
foreign key (id_товару) references товари(id),
primary key(id)
);



