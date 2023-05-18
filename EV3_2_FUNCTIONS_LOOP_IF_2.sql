delimiter //
create function factorial(num int)
returns int deterministic
begin
	declare resu int;
    set resu = 1;
    facto: loop
		set resu = resu * num;
        set num = num -1;
        if num = 1 then
			leave facto;
        end if;
    end loop facto;
    return resu;
end//
delimiter ;