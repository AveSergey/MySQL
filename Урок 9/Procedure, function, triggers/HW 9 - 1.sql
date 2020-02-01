/* Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

use sample;

drop procedure if exists hello;

delimiter //

create procedure hello()
begin
	case 
		when curtime() between '06:00:00' and '12:00:00' then
			SELECT 'Доброе утро';
		when curtime() between '12:00:00' and '18:00:00' then
			SELECT 'Добрый день';
		when curtime() between '18:00:00' and '00:00:00' then
			select 'Добрый вечер';
		else
			select 'Доброй ночи';
	end case;
end //

call hello() //