# 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными. Справа располагается рисунок к первому заданию.
CREATE TABLE hw_2.sales2
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE NOT NULL,
	bucket INT NOT NULL
);

INSERT INTO hw_2.sales2 (order_date, bucket) 
VALUES
("2021-01-01", 160),
("2021-01-02", 150),
("2021-01-03", 90),
("2021-01-04", 150),
("2021-01-05", 320);
