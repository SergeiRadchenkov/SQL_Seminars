/*
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

У сущности «заявки на дружбу» имеются следующие поля(атрибуты):
initiator_user_id – инициатор;
target_user_id – получатель;
status - статус;
requested_at - дата создания;
updated_at - дата последнего обновления.

У сущности «пользователи» имеются следующие поля(атрибуты):
id – идентификатор;
firstname – имя;
lastname - фамилия;
email - адрес электронной почты.

Друзья — это пользователи у которых имеется соответствующая запись (заявка) в сущности «заявки на дружбу» и в атрибуте status данной сущности указано значение 'approved'.

Найдите количество друзей у каждого пользователя. Выведите для каждого пользователя идентификатор пользователя, имя, фамилию и количество друзей cnt. Сортировка выводимых записей в порядке возрастания идентификатора пользователя.
*/

SELECT 
  users.id, 
  users.firstname, 
  users.lastname,
  COUNT(friend_requests.status) AS cnt
FROM users
LEFT JOIN friend_requests ON (users.id = friend_requests.initiator_user_id OR users.id = friend_requests.target_user_id) AND friend_requests.status = 'approved'
GROUP BY users.id;