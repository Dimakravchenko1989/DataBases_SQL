# Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц

# 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
CREATE TABLE `hw_1`.`phone_table` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `ProductCount` VARCHAR(45) NOT NULL,
  `Price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `idphone_table_UNIQUE` (`Id` ASC) VISIBLE);

INSERT INTO `hw_1`.`phone_table` (`Id`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('1', 'iPhone X', 'Apple', '3', '76000');
INSERT INTO `hw_1`.`phone_table` (`Id`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('2', 'iPhone 8', 'Apple', '2', '51000');
INSERT INTO `hw_1`.`phone_table` (`Id`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('3', 'Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `hw_1`.`phone_table` (`Id`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('4', 'Galaxy S9', 'Samsung', '1', '41000');
INSERT INTO `hw_1`.`phone_table` (`Id`, `ProductName`, `Manufacturer`, `ProductCount`, `Price`) VALUES ('5', 'P20 Pro', 'Huawei', '5', '36000');

SELECT * FROM hw_1.phone_table;

# 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
SELECT * FROM `hw_1`.`phone_table` WHERE ProductCount > 2;

# 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM `hw_1`.`phone_table` WHERE manufacturer = 'Samsung';


