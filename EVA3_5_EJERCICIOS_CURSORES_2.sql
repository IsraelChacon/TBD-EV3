delimiter //
CREATE PROCEDURE actualizar_rfc()
BEGIN
    DECLARE fin INTEGER DEFAULT 0;
	DECLARE id_2 INT;
    DECLARE nombre_2 VARCHAR(50);
    DECLARE apellido_pat_2 VARCHAR(50);
    DECLARE apellido_mat_2 VARCHAR(50);
    DECLARE fecha_nac_2 DATE;
    DECLARE cur CURSOR FOR SELECT id, nombre, apellido_pat, apellido_mat, fecha_nac FROM personas;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
    OPEN cur;
    loop_label: LOOP
        FETCH cur INTO id_2, nombre_2, apellido_pat_2, apellido_mat_2, fecha_nac_2;
        IF fin = 1 THEN
            LEAVE loop_label;
        END IF;
        UPDATE personas SET clave_rfc = generar_rfc(nombre_2, apellido_pat_2, apellido_mat_2, fecha_nac_2) WHERE id = id_2;
    END LOOP;
    CLOSE cur;
END//
delimiter ;
