-- Выведите список товаров products и разделов catalogs, который соответствует товару.

use shop;

select p.name as product_name,
	   c.name as catalog_name
from 
	products p
join	   
	catalogs c
on c.id = p.catalog_id
;