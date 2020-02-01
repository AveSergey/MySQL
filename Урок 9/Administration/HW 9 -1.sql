/* Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop.
*/

use shop;

drop user if exists shop_read;
create user shop_read identified with sha256_password by '111';
grant select on shop.* to shop_read;

drop user if exists shop;
create user shop identified with sha256_password by '222';
grant select on shop.* to shop;