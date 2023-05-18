delimiter $$
create function contar_actor()
returns int reads sql data
begin
	declare cont int;
    select count(*) into cont from actor;
    return cont;
end$$
delimiter ;