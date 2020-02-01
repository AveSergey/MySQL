/* Создайте представление, которое выводит название name товарной позиции из таблицы products 
и соответствующее название каталога name из таблицы catalogs.*/

use shop;

drop view if exists new_catalog;
create view new_catalog (product_name, catalog_name) as
select p.name, c.name from products p
join catalogs c on c.id = p.catalog_id;

select * from new_catalog;