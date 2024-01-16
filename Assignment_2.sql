---1.Sorunun Cevabi---
  
SELECT distinct
    c.customer_id,
    c.first_name,
    c.last_name,
    case when product_name like 'Polk Audio%' then 'YES' else 'NO' end Other_product
FROM 
    sale.customer c
JOIN 
    sale.orders o ON c.customer_id = o.customer_id
JOIN 
    sale.order_item oi ON o.order_id = oi.order_id
JOIN 
    product.product p ON oi.product_id = p.product_id
WHERE 
    p.product_name LIKE '2TB Red%'

EXCEPT

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    case when product_name like 'Polk Audio%' then 'YES' else 'NO' end Other_product
FROM 
    sale.customer c
JOIN 
    sale.orders o ON c.customer_id = o.customer_id
JOIN 
    sale.order_item oi ON o.order_id = oi.order_id
JOIN 
    product.product p ON oi.product_id = p.product_id
WHERE 
    p.product_name LIKE 'Polk Audio%';


---2.sorunun cevabi---    


CREATE TABLE [Actions](
    Visitor_ID int NOT NULL,
    ADV_Type  CHAR NOT NULL,
    Action  VARCHAR(10)
)
INSERT Actions VALUES
    (1,'A', 'Left'),(2, 'A', 'Order'),
    (3, 'B', 'Left'),(4,'A','Order'),
    (5, 'A', 'Review'), (6,'A','Left'),
    (7,'B', 'Left'),(8, 'B', 'Order'),
    (9, 'B', 'Review'),(10, 'A', 'Review')

SELECT
    Adv_Type,
    CAST(SUM(CASE WHEN Action = 'Order' THEN 1 ELSE 0 END) AS DECIMAL(3,2)) / COUNT([Action]) AS Conversion_Rate
FROM
    Actions
GROUP BY
    Adv_Type;

