# HomeWork 3. SQL – выборка данных, сортировка, агрегатные функции
use hw_3;

# ТАБЛИЦА 1: ПРОДАВЦЫ (SALESPEOPLE)
CREATE TABLE salespeople 
(
  snum INT  PRIMARY KEY NOT NULL,
  sname VARCHAR(45) NOT NULL,
  city VARCHAR(45) NOT NULL,
  comm DECIMAL(7, 2) NOT NULL
);

INSERT INTO hw_3.salespeople (snum, sname, city, comm) 

VALUES
(1001, "Peel", "London", 0.12),
(1002, "Serres", "San Jose", 0.13),
(1004, "Motika", "London", 0.11),
(1007, "Rifkin", "Barcelona", 0.15),
(1003, "Axelrod", "New York", 0.10);

# ТАБЛИЦА 2: ЗАКАЗЧИКИ (CUSTOMERS)
CREATE TABLE hw_3.customers (
    cnum INT PRIMARY KEY NOT NULL,
    cname VARCHAR(45) NOT NULL,
    city VARCHAR(45) NOT NULL,
    rating INT NOT NULL,
    snum INT NOT NULL
);

INSERT INTO hw_3.customers (cnum, cname, city, rating, snum) 
VALUES
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "San Jose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "San Jose", 300, 1007),
(2007, "Pireira", "Rome", 100, 1004);

# ТАБЛИЦА 3: ЗАКАЗЫ (ORDERS)
CREATE TABLE hw_3.orders (
    onum INT PRIMARY KEY NOT NULL,
    amt DECIMAL(7, 2) NOT NULL,
    odate DATE NOT NULL,
    cnum INT NOT NULL,
    snum INT NOT NULL
);

INSERT INTO hw_3.orders (onum, amt, odate, cnum, snum) 
VALUES
(3001, 18.69, "1990-03-10", 2008, 1007),
(3003, 767.19, "1990-03-10", 2001, 1001),
(3002, 1900.10, "1990-03-10", 2007, 1004),
(3005, 5160.45, "1990-03-10", 2003, 1002),
(3006, 1098.16, "1990-03-10", 2008, 1007),
(3009, 1713.23, "1990-04-10", 2002, 1003),
(3007, 75.75, "1990-04-10", 2004, 1002),
(3008, 4723.00, "1990-05-10", 2006, 1001),
(3010, 1309.95, "1990-06-10", 2004, 1002),
(3011, 9891.88, "1990-06-10", 2006, 1001);

# Таблица для работы (из классной работы)
CREATE TABLE IF NOT EXISTS staff (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(15),
surname VARCHAR(15),
speciality  VARCHAR(15),
seniority INT,
sallary INT,
age INT);
 
INSERT INTO 
    staff (name, surname, speciality, seniority, sallary, age)
VALUES
    ("Вася", "Васькин", "начальник", 40, 100000, 60),
    ("Петя", "Петькин", "начальник", 8, 70000, 30),
    ("Катя", "Катькин", "инженер", 2, 70000, 25),
    ("Саша", "Сашкин", "инженер", 12, 50000, 35),
    ("Иван", "Иванов", "рабочий", 40, 30000, 59),
    ("Петр", "Петров", "рабочий", 20, 250000, 40),
    ("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
    ("Антон", "Антонов", "рабочий", 8, 19000, 28),
    ("Юра", "Юркин", "рабочий", 5, 15000, 25),
    ("Максим", "Воронин", "рабочий", 2, 11000, 22),
    ("Юра", "Галкин", "рабочий", 3, 12000, 24),
    ("Люся", "Люськина", "уборщик", 10, 10000, 49);


# 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm 
FROM salespeople;

# 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating, cname 
FROM customers 
WHERE city = "San Jose"; 

# 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum 
FROM orders; 

# 4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
SELECT * 
FROM customers 
WHERE cname 
LIKE '%G%';

# 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT onum, amt 
FROM orders 
WHERE amt > 1000;

# 6. Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT min(amt) 
FROM orders;

# 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT cnum, cname, city, rating 
FROM customers 
WHERE rating > 100 AND city != "Rome";

# 8. Отсортируйте поле “зарплата” в порядке убывания и возрастания.
SELECT * # убывание
FROM staff 
ORDER BY sallary DESC;

SELECT * # возрастание
FROM staff 
ORDER BY sallary ;

# 9. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT * 
FROM 
	(SELECT * FROM staff ORDER BY sallary DESC LIMIT 5) 
		AS sallary 
        ORDER BY sallary;

# 10. Выполните группировку всех сотрудников по специальности, суммарная зарплата которых превышает 100000
SELECT speciality, sum(sallary) AS sallary_sum 
FROM staff 
GROUP BY speciality 
HAVING sallary_sum > 100000;




