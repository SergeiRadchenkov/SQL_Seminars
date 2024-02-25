/*
Имеется таблица (сущность) с мобильными телефонами mobile_phones.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
product_name – название;
manufacturer – производитель;
product_count – количество;
price – цена.

Сущность mobile_phones имеет следующие записи:
| id  | product_name | manufacturer | product_count | price | 
| --- | ------------ | ------------ | ------------- | ----- | 
| 1   | iPhone X     | Apple        | 156           | 76000 | 
| 2   | iPhone 8     | Apple        | 180           | 51000 | 
| 3   | Galaxy S9    | Samsung      | 21            | 56000 | 
| 4   | Galaxy S8    | Samsung      | 124           | 41000 | 
| 5   | P20 Pro      | Huawei       | 341           | 36000 |

Создайте таблицу (сущность) с заказами manufacturer. При создании необходимо использовать DDL-команды.
Перечень полей (атрибутов):
id – числовой тип, автоинкремент, первичный ключ;
name – строковый тип;

Используя CRUD-операцию INSERT, наполните сущность manufacturer в соответствии с данными, имеющимися в атрибуте manufacturer сущности mobile_phones.
*/
-- Вы работаете с PostgreSQL

DROP TABLE IF EXISTS itresume9698519.manufacturer;
CREATE TABLE itresume9698519.manufacturer (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

INSERT INTO itresume9698519.manufacturer (name)
SELECT DISTINCT manufacturer
FROM itresume9698519.mobile_phones;

SELECT * FROM itresume9698519.manufacturer;