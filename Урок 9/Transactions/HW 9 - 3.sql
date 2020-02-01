/* Пусть имеется таблица с календарным полем created_at. 
В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2018-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
если дата присутствует в исходном таблице и 0, если она отсутствует.*/

use sample;

drop table if exists test_table;
create table test_table (created_at DATETIME);
insert into test_table (created_at) 
values ('2018-08-01'), ('2018-08-04'), ('2018-08-16'), ('2018-08-17'), ('2018-08-21'), ('2018-08-24');
set @startdate := '2018-08-01';
with recursive T (dte, is_exist) as 
(
select @startdate,
       exists(select * from test_table where created_at = @startdate)
union all 
select @startdate := @startdate + interval 1 day,
       exists (select * from test_table where created_at = @startdate)
from T
where @startdate < '2018-08-31'
)
select * from T;