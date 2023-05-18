delimiter //
create trigger datos_previos_update_per after update on personas
for each row
begin
	insert into auditoria_per
    values(
		OLD.id,
        OLD.nombre,
        OLD.apellido_pat,
        OLD.apellido_mat,
        OLD.fecha_nac,
        OLD.clave_rfc
	);
end //
delimiter ;