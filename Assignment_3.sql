CREATE VIEW view_1 AS 
SELECT product_id, discount, COUNT(order_id) cnt_order,
	FIRST_VALUE(COUNT(order_id)) OVER(PARTITION BY product_id ORDER BY product_id, discount) first_values,
	LAST_VALUE(COUNT(order_id)) OVER(PARTITION BY product_id ORDER BY product_id, discount ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) last_values
FROM sale.order_item
GROUP BY product_id, discount

SELECT DISTINCT product_id,
		(CASE
			WHEN last_values-first_values >0 THEN 'Pozitif'
			WHEN last_values-first_values <0 THEN 'Negatif'
			WHEN last_values-first_values =0 THEN 'Neutral'
		END) AS 'Discount Effect'
FROM view_1