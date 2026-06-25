USE BDD_TPI_GRUPO_2_PR3;
GO

-- CONSULTAS PACIENTE --

SELECT id_pac, dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac FROM PACIENTE;
GO

--eliminado baja logica
CREATE PROCEDURE spEliminarPaciente
    @id_pac INT
AS
BEGIN
    UPDATE PACIENTE
    SET activo_pac = 0
    WHERE id_pac = @id_pac
END
GO

--agregado
CREATE PROCEDURE spAgregarPaciente
    @dni_pac VARCHAR(15),
    @nombre_pac VARCHAR(50),
    @apellido_pac VARCHAR(50),
    @sexo_pac CHAR(1),
    @nacionalidad_pac VARCHAR(50),
    @fecha_nacimiento_pac DATE,
    @direccion_pac VARCHAR(100),
    @id_loc INT,
    @email_pac VARCHAR(100),
    @telefono_pac VARCHAR(30)
AS
BEGIN
    INSERT INTO PACIENTE
        (dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac,
         fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac)
    VALUES
        (@dni_pac, @nombre_pac, @apellido_pac, @sexo_pac, @nacionalidad_pac,
         @fecha_nacimiento_pac, @direccion_pac, @id_loc, @email_pac, @telefono_pac)
END
GO

--modificacion
CREATE PROCEDURE spModificarPaciente
    @id_pac INT,
    @dni_pac VARCHAR(15),
    @nombre_pac VARCHAR(50),
    @apellido_pac VARCHAR(50),
    @sexo_pac CHAR(1),
    @nacionalidad_pac VARCHAR(50),
    @fecha_nacimiento_pac DATE,
    @direccion_pac VARCHAR(100),
    @id_loc INT,
    @email_pac VARCHAR(100),
    @telefono_pac VARCHAR(30)
AS
BEGIN
    UPDATE PACIENTE
    SET dni_pac = @dni_pac,
        nombre_pac = @nombre_pac,
        apellido_pac = @apellido_pac,
        sexo_pac = @sexo_pac,
        nacionalidad_pac = @nacionalidad_pac,
        fecha_nacimiento_pac = @fecha_nacimiento_pac,
        direccion_pac = @direccion_pac,
        id_loc = @id_loc,
        email_pac = @email_pac,
        telefono_pac = @telefono_pac
    WHERE id_pac = @id_pac
END
GO