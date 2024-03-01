/*
Имеется таблица (сущность) с персоналом staff.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
firstname – имя;
lastname - фамилия
post - должность,
seniority – стаж;
salary – заработная плата;
age - возраст.

Необходимо вывести идентификатор, имя, фамилию, заработную плату из сущности staff при этом данные должны быть отсортированы в порядке убывания заработной платы.
*/

SELECT id, firstname, lastname, salary
FROM staff
ORDER BY salary DESC;