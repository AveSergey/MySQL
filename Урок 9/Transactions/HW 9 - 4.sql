-- Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.

use sample;

drop table if exists datetbl;
create table datetbl (
	created_at date
);

insert into datetbl values
	('2020-01-01'),
	('2020-01-02'),
	('2020-01-04'),
	('2020-01-12'),
	('2020-01-14'),
	('2020-01-17'),
	('2020-01-23'),
	('2020-01-27'),
	('2020-01-29'),
	('2020-01-31');


delete from datetbl
where created_at not in (
	select * from (
		select * from datetbl order by created_at desc limit 5) as T
) order by created_at desc;

select * from datetbl order by created_at desc;