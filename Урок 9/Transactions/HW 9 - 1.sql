use sample;

start transaction;
insert into users select * from shop.users where id = 3;
delete from shop.users where id = 1;
commit;