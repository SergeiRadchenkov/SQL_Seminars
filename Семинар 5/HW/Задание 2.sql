/*
Нахождение разности соседних дат

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

У сущности «сообщения» имеются следующие поля(атрибуты):
id – идентификатор;
from_user_id – отправитель;
to_user_id – получатель;
body - содержимое;
created_at - дата отправки.

Получите список сообщений, отсортированных по возрастанию даты отправки.
Вычислите разность между соседними значениями дат отправки. Разности выразите в минутах.

Выведите идентификатор сообщения, дату отправки, дату отправки следующего сообщения и разницу даты отправки соседних сообщений.
*/

SELECT
    id,
    created_at,
    LEAD(created_at) OVER (ORDER BY created_at) AS next_created_at,
    TIMESTAMPDIFF(MINUTE, created_at, LEAD(created_at) OVER (ORDER BY created_at)) AS time_diff_minutes
FROM
    messages
ORDER BY
    created_at;