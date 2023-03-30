DELIMITER //
create trigger update_and_insert_to_user before insert on `user` 
for each row begin
  if new.birthday > now()  then
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'birthday entered incorrectly';
  end if;
END//

DELIMITER //
create trigger update_and_insert_to_user before updateon `user` 
for each row begin
  if new.birthday > CURRENT_TIMESTAMP then
    signal sqlstate '45000'
    SET MESSAGE_TEXT = 'birthday entered incorrectly';
  end if;
END//