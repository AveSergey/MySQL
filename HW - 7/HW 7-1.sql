-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

use shop;

select name from users u 
where 
exists (select 1 from orders where u.id = user_id);