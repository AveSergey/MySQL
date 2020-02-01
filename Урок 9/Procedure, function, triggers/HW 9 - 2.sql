/* В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное
значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля
были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

use shop;

DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NULL in both fields!';
	END IF;
END //
delimiter ;

INSERT INTO products (name, description)
VALUES (NULL, NULL);

INSERT INTO products (name, description)
VALUES ("GeForce GTX", NULL);

INSERT INTO products (name, description)
VALUES ("NULL", "Видеокарта");

INSERT INTO products (name, description)
VALUES ("GeForce GTX", "Видеокарта");

select * from products;
