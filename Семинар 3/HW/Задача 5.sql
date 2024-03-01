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

Посчитайте и выведите количество сотрудников с должностью 'Рабочий' и возрастом не моложе 24 лет и не старше 49 лет.
*/

SELECT COUNT(*)
FROM staff
WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;