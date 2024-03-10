/*
Задание 1.
Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. Функция должна возвращать номер пользователя.
*/
DELIMITER //

create definer=`root`@`localhost` function `vk`.`delete_user_information`(us_id bigint unsigned) returns bigint
    reads sql data
begin
	delete from friend_requests where initiator_user_id = us_id or target_user_id = us_id;
	delete from users_communities where user_id = user_id;
	delete from profiles where user_id = us_id;
	delete from messages where from_user_id = us_id or to_user_id = us_id;
	delete from likes where user_id = us_id;
	delete from media where user_id = us_id;
	delete from users where id = us_id;

	return us_id;
end//

DELIMITER;

/*
Задание 2.
Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.
*/
DROP PROCEDURE IF EXISTS vk.delete_user_info_precedure;

DELIMITER $$
$$
create procedure vk.delete_user_info_precedure(in us_id bigint unsigned)
begin
	declare exit handler for sqlexception
	begin
		rollback;
		resignal;
	end;

	declare exit handler for sqlwarning
	begin
		rollback;
	end;
	
	start transaction;

	delete from friend_requests where initiator_user_id = us_id or target_user_id = us_id;
	delete from users_communities where user_id = user_id;
	delete from profiles where user_id = us_id;
	delete from messages where from_user_id = us_id or to_user_id = us_id;
	delete from likes where user_id = us_id;
	delete from media where user_id = us_id;
	delete from users where id = us_id;

	commit;
end$$
DELIMITER ;

/*
Задание 3.
Написать триггер, который проверяет новое появляющееся сообщество. Длина названия сообщества (поле name) должна быть не менее 5 символов. Если требование не выполнено, то выбрасывать исключение с пояснением.
*/
DELIMITER $$
$$
create trigger check_com_lenth
before insert on communities 
for each row
begin 
	if length(new.name) < 5 then 
		signal sqlstate '45000' set message_text = 'Длина названия сообщества должна быть не менее 5 символов';
	end if;
end$$
DELIMITER ;