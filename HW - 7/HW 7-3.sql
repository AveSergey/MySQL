/* Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов. */

drop database if exists airlogs;
create database airlogs;
use airlogs;

create table flights (
	id serial primary key,
	`from` varchar(100) not null,
	`to` varchar(100) not null
);

insert into flights(`from`, `to`)
value ('moscow','omsk'),('novgorod','kazan'),
	  ('irkutsk','moscow'),('omsk','irkutsk'),
	  ('moscow','kazan');

create table cities (
	label varchar(100) primary key,
	name varchar(100) not null
);
insert into cities(label, name)
value ('moscow','Москва'),('irkutsk','Иркутск'),
	  ('novgorod','Новгород'),('kazan','Казань'),
	  ('omsk','Омск');
	 
	 
select c.name as `from`, ci.name as `to`
from flights F
join cities c on c.label = f.`from`
join cities ci on ci.label = f.`to`
order by f.id
;
	 
	 
	  
