# HomeWork 4. SQL – работа с несколькими таблицами

# 1. Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
SELECT MARK, color, COUNT(color) AS 'Quantity of cars' FROM AUTO
	WHERE MARK = 'LADA'
	GROUP BY color, mark 
UNION 
	SELECT MARK, color, COUNT(color) AS 'Quantity of cars' FROM AUTO
	WHERE MARK = 'BMW'
	GROUP BY color, mark;
    
    
# 2. Вывести на экран марку авто(количество) и количество авто не этой марки.
# 100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки
SELECT DISTINCT MARK,
	(SELECT COUNT(1) FROM AUTO A1 WHERE A1.MARK = A.MARK) AS Quantity ,
    (SELECT COUNT(1) FROM AUTO A1 WHERE A1.MARK != A.MARK) AS 'Number of others' FROM AUTO A;
    
    
# 3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
SELECT * 
FROM test_a
LEFT JOIN test_b ON test_b.id = test_a.id
WHERE test_b.id IS NULL;

    
    