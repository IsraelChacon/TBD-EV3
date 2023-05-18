delimiter //
create trigger generar_id before insert on actor
for each row
begin
	declare nuevo_id int;
    declare calcular_id int;
    
    select ultimo_actorid() into nuevo_id;
    if nuevo_id = null then
		set calcular_id = 1;
	else
		set calcular_id = nuevo_id + 1;
	end if;
    
    set new.actor_id = nuevo_id + 1;
end //
delimiter ;