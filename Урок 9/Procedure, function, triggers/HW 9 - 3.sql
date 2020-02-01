/* Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
 Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
 Вызов функции FIBONACCI(10) должен возвращать число 55.
 */

use sample;

drop function if exists FIBONACCI;
delimiter //
create function FIBONACCI (n INT)
returns text deterministic
begin
    declare p1 int default 1;
    declare p2 int default 1;
    declare i int default 2;
    declare res int default 0;
   
    if (n <= 1) then return n;
    elseif (n = 2) then return 1;
    end if;  
    while i < n do
        set i = i + 1;
	set res = p2 + p1;
        set p2 = p1;
        set p1 = res;
    end while;
    return res;
 end//
 
delimiter ;

 select FIBONACCI(10);
 
