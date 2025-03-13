CREATE DATABASE склад_зброї;

USE склад_зброї;

CREATE TABLE отримувач_зброї
(
id INT auto_increment,
прізвище varchar(30) NOT NULL,
ініціали varchar(20) NOT NULL,
оф int null,
взвод int NOT NULL,
primary key(id)
);

DROP TABLE отримувач_зброї;

INSERT INTO отримувач_зброї (прізвище, ініціали, оф, взвод)
VALUES
('Петров', 'В.А.', 205, 222),
('Лодарев', 'П.С.', 221, 232),
('Іващенко', 'A.А.', 201, 212),
('Духов', 'Р.М.', null, 200);

select * from отримувач_зброї;


CREATE TABLE зброя
(
id INT auto_increment,
модель varchar(30) NOT NULL,
primary key(id)
);

INSERT INTO зброя (модель)
VALUES
('АК-47'),
('Глок20'),
('АК-74');

Select * from зброя;



CREATE TABLE видавач_зброї
(
id INT auto_increment,
прізвище varchar(30) NOT NULL,
ініціали varchar(20) NOT NULL,
звання varchar(30) NOT NULL,
primary key(id)
);


INSERT INTO видавач_зброї (прізвище, ініціали, звання)
VALUES
('Буров', 'О.С.', 'майор'),
('Рибаков', 'Н.Г.', 'майор'),
('Деребанов', 'В.Я.', 'підполковник');

SELECT * FROM видавач_зброї;


CREATE TABLE видача_зброї
(
id INT auto_increment,
id_отримувача int NOT NULL,
id_зброї int NOT NULL,
id_видавача int NOT NULL,
foreign key (id_отримувача) references отримувач_зброї(id),
foreign key (id_зброї) references зброя(id),
foreign key (id_видавача) references видавач_зброї(id),
primary key(id)
);

drop TABLE видача_зброї;

INSERT INTO видача_зброї (id_отримувача, id_зброї, id_видавача)
VALUES
(1, 1, 1),
(1, 2, 3),
(2, 3, 3),
(2, 2, 2),
(3, 1, 1),
(3, 2, 2),
(4, 1, 1);

select * from видача_зброї;

