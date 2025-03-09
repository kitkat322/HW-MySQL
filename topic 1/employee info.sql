CREATE DATABASE MyDB;

USE MyDB;

CREATE TABLE employee_phone_numbers
(
id INT auto_increment NOT NULL,
name varchar(30) not null,
phone varchar(15) not null,
PRIMARY KEY(id)
);

INSERT INTO employee_phone_numbers
(name, phone)
VALUES
('Andriy K', +398798789),
('Olena M.', +387638646),
('Maria T.', +3384589458),
('Oleg B.', +39890348398);



create table salaries_and_positions
(
id INT auto_increment NOT NULL,
position varchar(30),
salary INT,
PRIMARY KEY(id)
);

INSERT INTO salaries_and_positions
(position, salary)
VALUES
('accountant', 9000),
('programmer', 20000),
('administrator', 11000),
('manager', 22000);



create table personal_data
(
id INT auto_increment NOT NULL,
marital_status varchar(10),
date_of_birth varchar(10),
place_of_residence varchar(30),
PRIMARY KEY(id)
);

INSERT INTO personal_data
(marital_status, date_of_birth, place_of_residence)
VALUES
('single', '20.09.1992', 'misto Cherkassy'),
('single', '11.10.1993', 'misto Cherkassy'),
('married', '01.19.1989', 'misto Kharkiv'),
('married', '06.03.1990', 'misto Kharkiv');



SELECT id FROM salaries_and_positions
WHERE salary > 10000;


SELECT * FROM personal_data;


UPDATE personal_data
SET marital_status = 'married'
WHERE id = 1;


select *
from employee_phone_numbers
inner join salaries_and_positions on employee_phone_numbers.id = salaries_and_positions.id
left join personal_data on employee_phone_numbers.id = personal_data.id;
