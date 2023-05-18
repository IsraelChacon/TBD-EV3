delimiter //
create procedure agregar_actor_2(in fname varchar(50), lname varchar(50))
begin
	declare actorid int;
    select ultimo_actorid() into actorid;
    set actorid = actorid +1;
    
	insert into actor(actor_id, first_name, last_name)
    values(actorid, fname, lname);
end //
delimiter ;