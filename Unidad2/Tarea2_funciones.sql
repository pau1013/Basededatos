--Crear una funcion para calcular la edad al momento de ganar un premio nobel
CREATE FUNCTION GET_AGE(birthdate IN DATE)
    RETURN INTEGER
    IS AGE_NOW INTEGER;
    CURRENT_YEAR INTEGER;
    BIRTH_YEAR INTEGER;
    BEGIN
        CURRENT_YEAR := EXTRACT(YEAR FROM NOW());
        BIRTH_YEAR:= EXTRACT (YEAR FROM birthdate);
        AGE_NOW := year1 - year2;
        RETURN(AGE_NOW);
    END;
--Crear una funcion para calcular la edad del ganador de un premio nobel


--Crear un procedimiento almacenado para insertar a un ganador de algun premio nobel