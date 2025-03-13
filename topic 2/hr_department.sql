CREATE DATABASE hr_department;

USE hr_department;

CREATE TABLE employees_personal_info
(
id INT AUTO_INCREMENT NOT NULL,
first_name varchar(20),
last_name varchar(20),
phone varchar(20),
address varchar(20),
PRIMARY KEY(id)
);

ALTER TABLE employees_personal_info MODIFY address VARCHAR(100) NOT NULL;

INSERT INTO employees_personal_info (first_name, last_name, phone, address)
VALUES
('Олена', 'Петриченко', '+30958595', 'вул. Надпільна 47'),
('Ольга', 'Олександрова', '+3847383932', 'вул. Зернова 51'),
('Віктор', 'Логвінов', '+30930239292', 'вул. Молочна 47');


CREATE TABLE departments
(
id INT AUTO_INCREMENT NOT NULL,
name varchar(50) not null,
quantity_of_employees INT not null,
PRIMARY KEY(id)
);

ALTER TABLE departments DROP COLUMN quantity_of_employees;

INSERT INTO departments (name, quantity_of_employees)
VALUES
('IT-відділ', 12),
('HR-відділ', 12),
('Sales-відділ', 12);

SELECT * FROM departments;


CREATE TABLE positions
(
id INT AUTO_INCREMENT NOT NULL,
name_of_position varchar(20) NOT NULL,
salary INT NOT NULL,
id_department INT NOT NULL,
FOREIGN KEY (id_department) REFERENCES departments(id),
PRIMARY KEY(id)
);

INSERT INTO positions (name_of_position, salary, id_department)
VALUES
('Java developer', 5000, 1),
('HR', 4000, 2),
('Sales manager', 6000, 3);

SELECT * FROM positions;


CREATE TABLE employees_positions
(
id INT AUTO_INCREMENT NOT NULL,
id_employee INT not null,
id_position INT not null,
date_of_hire DATE,
FOREIGN KEY (id_employee) REFERENCES employees_personal_info(id),
FOREIGN KEY (id_position) REFERENCES positions(id),
PRIMARY KEY(id)
);

UPDATE employees_positions SET date_of_hire = '2000-01-01' WHERE date_of_hire IS NULL;
ALTER TABLE employees_positions MODIFY date_of_hire DATE NOT NULL;


INSERT INTO employees_positions (id_employee, id_position, date_of_hire)
VALUES
(1, 1, '2022-10-22'),
(2, 2, '2022-12-02'),
(3, 3, '2022-11-07');

SELECT * FROM employees_positions;
