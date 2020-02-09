/* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, 
идентификатор первичного ключа и содержимое поля name. */

use shop;

set autocommit = 0;
start transaction;
drop table if exists logs;
create table logs (
	created_at datetime default now(), 
	table_name varchar(25),
	id int,
	field_name_value varchar(255)
)

engine = Archive;
drop procedure if exists write_log;
drop trigger if exists trg_users_insert;
DROP TRIGGER IF EXISTS trg_products_insert;
DROP TRIGGER IF EXISTS trg_catalogs_insert;

delimiter //

create procedure write_log(in table_name varchar(25), in id int, in field_name_value varchar(255))
	begin
		insert into logs(table_name, id, field_name_value) values (table_name_, id_, field_name_value_);
	end//

create trigger trg_users_insert after insert on users
	for each row
		begin
		    call write_log("users", new.id, new.name);
		end//

create trigger trg_products_insert after insert on products
	for each row
		begin
		    call write_log("products", new.id, new.name);
		end//

create trigger trg_catalogs_insert after insert on catalogs
	for each row
		begin
		    call write_log("catalogs", new.id, new.name);
		end//
		
delimiter ;

commit;