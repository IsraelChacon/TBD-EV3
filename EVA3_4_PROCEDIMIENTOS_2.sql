delimiter //
CREATE FUNCTION generar_rfc (
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    nombre VARCHAR(50),
    fecha_nacimiento DATE
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE rfc VARCHAR(50);
    SET rfc = CONCAT(
        SUBSTR(apellido_paterno, 1, 2),
        IFNULL(SUBSTR(apellido_materno, 1, 1), 'X'),
        SUBSTR(nombre, 1, 1),
        DATE_FORMAT(fecha_nacimiento, '%Y%m%d')
    );
    RETURN rfc;
END//
delimiter ;
