DELIMITER $$

DROP PROCEDURE IF EXISTS InsertarClientes$$

CREATE PROCEDURE InsertarClientes()
BEGIN
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= 500 DO
        INSERT INTO Clientes (nombre, telefono, direccion)
        VALUES (CONCAT('Cliente ', i), 
                CAST(FLOOR(RAND() * 9000000000 + 1000000000) AS CHAR(10)), 
                CONCAT('Calle ', i, ' #', FLOOR(RAND() * 100), '-', FLOOR(RAND() * 100)));

        -- Pausar cada 50 registros (forma correcta)
        IF i % 50 = 0 THEN
            SET @dummy = SLEEP(1);
        END IF;

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS InsertarVeterinarios$$

CREATE PROCEDURE InsertarVeterinarios()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 500 DO
        INSERT INTO Veterinarios (nombre, especialidad, telefono)
        VALUES (CONCAT('Veterinario ', i), 
                ELT(FLOOR(1 + (RAND() * 4)), 'General', 'Cirugía', 'Dermatología', 'Ortopedia'), 
                CAST(FLOOR(RAND() * 9000000000 + 1000000000) AS CHAR(10)));

        IF i % 50 = 0 THEN
            DO SLEEP(1);
        END IF;

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS InsertarMascotas$$

CREATE PROCEDURE InsertarMascotas()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE cliente_id INT;
    WHILE i <= 500 DO
        SET cliente_id = FLOOR(RAND() * 500) + 1;
        INSERT INTO Mascotas (nombre, especie, raza, edad, id_cliente)
        VALUES (CONCAT('Mascota ', i), 
                ELT(FLOOR(1 + (RAND() * 5)), 'Perro', 'Gato', 'Ave', 'Reptil', 'Otro'), 
                ELT(FLOOR(1 + (RAND() * 4)), 'Labrador', 'Persa', 'Pastor Alemán', 'Canario'), 
                FLOOR(RAND() * 15) + 1, 
                cliente_id);

        IF i % 50 = 0 THEN
            DO SLEEP(1);
        END IF;

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS InsertarCitas$$

CREATE PROCEDURE InsertarCitas()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE mascota_id INT;
    DECLARE veterinario_id INT;
    WHILE i <= 500 DO
        SET mascota_id = FLOOR(RAND() * 500) + 1;
        SET veterinario_id = FLOOR(RAND() * 500) + 1;
        INSERT INTO Citas (fecha, hora, id_mascota, id_veterinario, motivo)
        VALUES (DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), 
                SEC_TO_TIME(FLOOR(RAND() * 86400)), 
                mascota_id, 
                veterinario_id,
                CONCAT('Motivo de consulta ', i));

        IF i % 50 = 0 THEN
            DO SLEEP(1);
        END IF;

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS InsertarTratamientos$$

CREATE PROCEDURE InsertarTratamientos()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE cita_id INT;
    WHILE i <= 500 DO
        SET cita_id = FLOOR(RAND() * 500) + 1;
        INSERT INTO Tratamientos (descripcion, costo, id_cita)
        VALUES (CONCAT('Tratamiento ', i), 
                FLOOR(RAND() * 200) + 20, 
                cita_id);

        IF i % 50 = 0 THEN
            DO SLEEP(1);
        END IF;

        SET i = i + 1;
    END WHILE;
END $$

DELIMITER ;

CALL InsertarClientes();
CALL InsertarVeterinarios();
CALL InsertarMascotas();
CALL InsertarCitas();
CALL InsertarTratamientos();




