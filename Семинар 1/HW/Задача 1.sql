/*
Создайте таблицу (сущность) с мобильными телефонами mobile_phones. При создании необходимо использовать DDL-команды.
Перечень полей (атрибутов):
id – числовой тип, автоинкремент, первичный ключ;
product_name – строковый тип, обязательный к заполнению;
manufacturer – строковый тип, обязательный к заполнению;
product_count – числовой тип, беззнаковый;
price – числовой тип, беззнаковый.

Используя CRUD-операцию INSERT, наполните сущность mobile_phones данными:

product_name	manufacturer	product_count	price
iPhone X	    Apple	        156	            76000
iPhone 8	    Apple	        180	            51000
Galaxy S9	    Samsung	        21	            56000
Galaxy S8	    Samsung	        124	            41000
P20 Pro	        Huawei	        341	            36000
*/

-- Вы работаете с PostgreSQL

CREATE TABLE itresume9698519.mobile_phones (
     id SERIAL PRIMARY KEY,
     product_name VARCHAR NOT NULL,
     manufacturer VARCHAR NOT NULL,
     product_count INTEGER,
     price INTEGER
);

INSERT INTO itresume9698519.mobile_phones (product_name, manufacturer, product_count, price) VALUES ('iPhone X', 'Apple', 156, 76000);
INSERT INTO itresume9698519.mobile_phones (product_name, manufacturer, product_count, price) VALUES ('iPhone 8', 'Apple', 180, 51000);
INSERT INTO itresume9698519.mobile_phones (product_name, manufacturer, product_count, price) VALUES ('Galaxy S9', 'Samsung', 21, 56000);
INSERT INTO itresume9698519.mobile_phones (product_name, manufacturer, product_count, price) VALUES ('Galaxy S8', 'Samsung', 124, 41000);
INSERT INTO itresume9698519.mobile_phones (product_name, manufacturer, product_count, price) VALUES ('P20 Pro', 'Huawei', 341, 36000);
