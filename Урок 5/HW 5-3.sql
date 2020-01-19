INSERT INTO storehouses_products
  (storehouse_id, product_id, value, created_at)
VALUES
  (1, 1, 0, now()),
  (2, 1, 12, now()),
  (3, 2, 4, now()),
  (4, 3, 7, now()),
  (5, 4, 1, now()),
  (6, 5, 4, now()),
  (7, 6, 5, now());
  
 
 select * from storehouses_products order by if(value = 0, 1, 0), value;