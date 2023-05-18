create trigger mensaje after insert on personas
for each row
set @mensaje = "PERSONA INSERTADA CON EXITO!!";