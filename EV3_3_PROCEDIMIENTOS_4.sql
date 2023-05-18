delimiter //
create procedure agregar_actor(in actorid int, fname varchar(50), lname varchar(50))
begin
	insert into actor(actor_id, first_name, last_name)
    values(actorid, fname, lname);
end //
delimiter ;