delimiter //
create procedure cantidad_actores(out cant int)
begin
	select count(*) into cant from actor;
end//
delimiter ;