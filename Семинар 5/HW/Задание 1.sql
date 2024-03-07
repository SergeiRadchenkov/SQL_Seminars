/*
Ранжированный список пользователей

Имеется база данных – социальная сеть.

База данных содержит сущности:
users – пользователи;
messages – сообщения;
friend_requests – заявки на дружбу;
communities – сообщества;
users_communities – пользователи сообществ;
media_types – типы медиа;
media – медиа;
likes – лайки;
profiles – профили пользователя.

У сущности «пользователи» имеются следующие поля(атрибуты):
id – идентификатор;
firstname – имя;
lastname - фамилия;
email - адрес электронной почты.

У сущности «сообщения» имеются следующие поля(атрибуты):
id – идентификатор;
from_user_id – отправитель;
to_user_id – получатель;
body - содержимое;
created_at - дата отправки.

Найти количество сообщений, отправленных каждым пользователей.
В зависимости от количества отправленных сообщений рассчитать ранг пользователей, первое место присвоив пользователю(ям) с наибольшим количеством отправленных сообщений.

Вывести полученный ранг, имя, фамилия, пользователя и кол-во отправленных сообщений. Выводимый список необходимо отсортировать в порядке возрастания ранга.
*/

SELECT
    DENSE_RANK() OVER (ORDER BY COALESCE(COUNT(messages.id), 0) DESC) as rank_message,
    users.firstname,
    users.lastname,
    COALESCE(COUNT(messages.id), 0) as cnt
FROM
    users
LEFT JOIN
    messages ON users.id = messages.from_user_id
GROUP BY
    users.id, users.firstname, users.lastname
ORDER BY
    cnt DESC;