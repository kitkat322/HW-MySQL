CREATE DATABASE IF NOT EXISTS car;

USE car;

CREATE TABLE cars_info
(
id INT auto_increment NOT NULL,
brand VARCHAR(10) NOT NULL,
model VARCHAR(20) NOT NULL,
engine_capacity INT NOT NULL,
price INT NOT NULL,
max_speed INT NOT NULL,
PRIMARY KEY(id)
);

DROP TABLE cars_info;

INSERT INTO cars_info (brand, model, engine_capacity, price, max_speed)
VALUES 
('BMW', 'x5', 1000, 25000, 230),
('BMW', 'x7', 2000, 30000, 250),
('BMW', 'm2', 5000, 45000, 290),
('Nissan', 'juke', 800, 25000, 230),
('Mazda', 'CX-5', 2000, 31000, 240),
('Honda', 'HR-V', 2000, 38000, 260);


SELECT * FROM cars_info;

