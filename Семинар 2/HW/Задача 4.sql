/*
Имеется таблица (сущность) с заказами orders.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
mobile_phones_id – идентификатор мобильного телефона;
order_status - статус.

id	mobile_phones_id	order_status
1	1	                OPEN
2	1	                OPEN
3	1	                CLOSED
4	4	                OPEN
5	4	                CANCELLED

Подробное описание статусов заказа:
OPEN – «Order is in open state» ;
CLOSED - «Order is closed»;
CANCELLED - «Order is cancelled»

Необходимо вывести идентификатор и подробное описание статуса заказа.
*/

SELECT
    id,
    CASE 
        WHEN order_status = 'OPEN' THEN 'Order is in open stat'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
        ELSE 'Unknown status'
    END AS full_order_status
FROM
    orders;