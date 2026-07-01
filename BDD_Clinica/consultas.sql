USE BDD_TPI_GRUPO_2_PR3;
GO

-- CONSULTAS PACIENTE --

CREATE PROCEDURE [spEliminarPaciente]
    @id_pac INT
AS
BEGIN
    UPDATE PACIENTE
    SET activo_pac = 0
    WHERE id_pac = @id_pac
END
GO


CREATE PROCEDURE [spAgregarPaciente]
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


CREATE PROCEDURE [spModificarPaciente]
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

CREATE PROCEDURE [spRestaurarPacientes]
AS
BEGIN
    UPDATE PACIENTE
    SET activo_pac = 1
    WHERE activo_pac = 0
END
GO

CREATE PROCEDURE [spRestaurarPacientePorId]
    @id_pac INT
AS
BEGIN
    UPDATE PACIENTE
    SET activo_pac = 1
    WHERE id_pac = @id_pac
END
GO

-- CONSULTAS MEDICO --

CREATE PROCEDURE [spAgregarMedico]
    @DniMedico VARCHAR(15),
    @NombreMedico VARCHAR(50),
    @ApellidoMedico VARCHAR(50),
    @SexoMedico CHAR(1),
    @NacionalidadMedico VARCHAR(50),
    @FechaNacimientoMedico DATE,
    @DireccionMedico VARCHAR(100),
    @IdLocalidad INT,
    @EmailMedico VARCHAR(100),
    @TelefonoMedico VARCHAR(30),
    @LegajoMedico VARCHAR(20),
    @IdEspecialidad INT,
    @IdUsuario INT,
    @ActivoMedico BIT
AS
BEGIN
    INSERT INTO MEDICO
    (
        id_usu,
        legajo_med,
        dni_med,
        nombre_med,
        apellido_med,
        sexo_med,
        nacionalidad_med,
        fecha_nacimiento_med,
        direccion_med,
        id_loc,
        email_med,
        telefono_med,
        id_esp,
        activo_med
    )
    VALUES
    (
        @IdUsuario,
        @LegajoMedico,
        @DniMedico,
        @NombreMedico,
        @ApellidoMedico,
        @SexoMedico,
        @NacionalidadMedico,
        @FechaNacimientoMedico,
        @DireccionMedico,
        @IdLocalidad,
        @EmailMedico,
        @TelefonoMedico,
        @IdEspecialidad,
        @ActivoMedico
    )
END
GO


CREATE PROCEDURE [spEliminarMedico]
    @id_med INT
AS
BEGIN
    UPDATE MEDICO
    SET activo_med = 0
    WHERE id_med = @id_med
END
GO

CREATE PROCEDURE spAgregarUsuario
    @Username VARCHAR(30),
    @Password VARCHAR(100),
    @Tipo VARCHAR(10),
    @Activo BIT
AS
BEGIN
    INSERT INTO USUARIO
    (
        username_usu,
        password_usu,
        tipo_usu,
        activo_usu
    )
    VALUES
    (
        @Username,
        @Password,
        @Tipo,
        @Activo
    );

    SELECT SCOPE_IDENTITY() AS id_usu;
END
GO

CREATE PROCEDURE [spModificarMedico]
    @id_med INT,
    @dni_med VARCHAR(15),
    @nombre_med VARCHAR(50),
    @apellido_med VARCHAR(50),
    @sexo_med CHAR(1),
    @nacionalidad_med VARCHAR(50),
    @fecha_nacimiento_med DATE,
    @direccion_med VARCHAR(100),
    @id_loc INT,
    @email_med VARCHAR(100),
    @telefono_med VARCHAR(30),
    @legajo_med VARCHAR(20),
    @id_esp INT
AS
BEGIN
    UPDATE MEDICO
    SET dni_med = @dni_med,
        nombre_med = @nombre_med,
        apellido_med = @apellido_med,
        sexo_med = @sexo_med,
        nacionalidad_med = @nacionalidad_med,
        fecha_nacimiento_med = @fecha_nacimiento_med,
        direccion_med = @direccion_med,
        id_loc = @id_loc,
        email_med = @email_med,
        telefono_med = @telefono_med,
        legajo_med = @legajo_med,
        id_esp = @id_esp
    WHERE id_med = @id_med
END
GO