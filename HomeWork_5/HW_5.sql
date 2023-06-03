# Урок 5. SQL – оконные функции

# Создаем таблицу Cars
CREATE DATABASE hw_5;
USE hw_5;
CREATE TABLE Cars
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    cost  INT NULL
);

INSERT INTO Cars (name, cost) VALUES ('Audi', 52642);
INSERT INTO Cars (name, cost) VALUES ('Mercedes', 57127);
INSERT INTO Cars (name, cost) VALUES ('Skoda', 9000);
INSERT INTO Cars (name, cost) VALUES ('Volvo', 29000);
INSERT INTO Cars (name, cost) VALUES ('Bentley', 350000);
INSERT INTO Cars (name, cost) VALUES ('Citroen', 21000);
INSERT INTO Cars (name, cost) VALUES ('Hummer', 41400);
INSERT INTO Cars (name, cost) VALUES ('Volkswagen', 21600);	

SELECT * FROM Cars;

# 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW cars1 AS 
SELECT * FROM Cars
WHERE cost < 25000;

SELECT * FROM cars1;

# 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW cars2 AS 
SELECT * FROM Cars
WHERE cost < 30000;

SELECT * FROM cars2;

# 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW cars3 AS
SELECT * FROM Cars
WHERE name = "Audi" OR name = "Skoda";

SELECT * FROM cars3;


/* 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

Есть таблица анализов Analysis:
an_id — ID анализа;
an_name — название анализа;
an_cost — себестоимость анализа;
an_price — розничная цена анализа;
an_group — группа анализов.

Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.

Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализа.
*/

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';

