/* Пусть имеется таблица accounts содержащая три столбца id, name, password, 
содержащие первичный ключ, имя пользователя и его пароль. 
Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
Создайте пользователя user_read, который бы не имел доступа к таблице accounts, однако
, мог бы извлекать записи из представления username.
*/

use sample;

drop table if exists accounts;
create table accounts (
	id serial primary key,
	name varchar(50),
	password varchar(50)
);

drop view if exists username;
create view username(id, name) as
select id, name from accounts;

drop user if exists shop_read;
create user shop_read;
grant select on shop.accounts TO shop_read;
