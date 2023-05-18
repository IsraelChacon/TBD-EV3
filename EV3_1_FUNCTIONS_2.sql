create function regresa_mensaje(cade varchar(50))
returns varchar(100) deterministic
return concat("hola",cade);

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `regresa_mensaje`(cade varchar(50)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
return concat("hola",cade)$$
DELIMITER ;

