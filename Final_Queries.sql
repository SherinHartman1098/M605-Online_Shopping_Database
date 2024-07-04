use `buyhub`





/* 1. Detail information about suppliers and the number of products that they provide.*/
 
SELECT  s.SUPPLIER_NAME, 
        s.EMAIL, 
        s.PHONE_NO, 
        COUNT(p.PRODUCT_ID) AS PRODUCT_COUNT
FROM SUPPLIER s 
LEFT JOIN PRODUCT p 
        ON s.SUPPLIER_ID =p.SUPPLIER_ID 
GROUP BY s.SUPPLIER_ID ,s.SUPPLIER_NAME ,s.EMAIL ,s.PHONE_NO    





/* 2. 10 best-selling products with the total amount and their supplier. */
SELECT 
	p.PRODUCT_ID ,
        p.PRODUCT_NAME ,
	s.SUPPLIER_NAME ,
	SUM(AMOUNT) AS TOTAL_AMOUNT
FROM ORDER_ITEMS AS ITM
JOIN PRODUCT p 
        ON ITM.PRODUCT_ID =p.PRODUCT_ID 
JOIN SUPPLIER s 
        ON ITM.SUPPLIER_ID =s.SUPPLIER_ID
GROUP BY 
        p.PRODUCT_ID, p.PRODUCT_NAME, s.SUPPLIER_NAME
ORDER BY 
        TOTAL_AMOUNT DESC
LIMIT 10;





/* 3. List of customers and their total purchases.*/

SELECT 
        CTM.FIRST_NAME AS CUSTOMER,
        SUM(ORD.ORDER_AMOUNT) AS TOTAL_PURCHASES 
FROM CUSTOMER AS CTM
LEFT JOIN ORDERS ORD 
	ON CTM.CUSTOMER_ID = ORD.ORDER_OWNER_ID
GROUP BY CUSTOMER_ID ;







/* 4. List of returned items.*/

SELECT 
        r.RETURN_ID,
        oi.DESCRIPTION AS RETURNED_ITEMS
FROM `RETURN` r 
LEFT JOIN ORDER_ITEMS oi 
        ON oi.ORDER_ITEMS_ID=r.ORDER_ITEMS_ID;








/* 5. List of products in the fashion category that were sold last month.*/

SELECT 
        p.PRODUCT_ID, 
        p.PRODUCT_NAME, 
        c.CATEGORY_NAME,
        o.`DATE` 
FROM PRODUCT p
JOIN ORDER_ITEMS oi 
        ON oi.PRODUCT_ID = p.PRODUCT_ID
JOIN ORDERS o 
        ON o.ORDER_ID = oi.ORDER_ID
JOIN CATEGORY c 
        ON c.CATEGORY_ID = p.CATEGORY_ID
WHERE 
        c.CATEGORY_NAME = 'FASHION'
  AND o.DATE >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) + INTERVAL 1 DAY
  AND o.DATE < CURDATE() + INTERVAL 1 DAY;



