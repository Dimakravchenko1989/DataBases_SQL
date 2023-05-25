# 2. Разделите  значения поля “bucket” на 3 сегмента: меньше 100(“Маленький заказ”), 100-300(“Средний заказ”) и больше 300 (“Большой заказ”)

SELECT *, 
	CASE
		WHEN bucket < 100 
			THEN "Маленький заказ"
		WHEN bucket BETWEEN 100 AND 300 
			THEN "Средний заказ"
		WHEN bucket > 300 
			THEN "Большой заказ"
	END AS orders
FROM hw_2.sales2
ORDER BY bucket ASC;
