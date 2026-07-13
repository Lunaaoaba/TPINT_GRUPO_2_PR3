USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'BDD_TPI_GRUPO_2_PR3')
BEGIN
    ALTER DATABASE BDD_TPI_GRUPO_2_PR3 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE BDD_TPI_GRUPO_2_PR3;
END
GO

CREATE DATABASE BDD_TPI_GRUPO_2_PR3 ON
(NAME = BDD_TPI_GRUPO_2_PR3_dat,
	FILENAME =  'C:\BDD_TPI_GRUPO_2_PR3\BDD_TPI_GRUPO_2_PR3.mdf')
GO

USE BDD_TPI_GRUPO_2_PR3;
GO

-- CREACION DE TABLAS

CREATE TABLE PROVINCIA (
    id_pro      INT IDENTITY(1,1),
    nombre_pro  VARCHAR(50) NOT NULL,

    CONSTRAINT PK_PROVINCIA PRIMARY KEY (id_pro)
);
GO

CREATE TABLE LOCALIDAD (
    id_loc      INT IDENTITY(1,1),
    nombre_loc  VARCHAR(50) NOT NULL,
    id_pro     INT NOT NULL,

    CONSTRAINT PK_LOCALIDAD PRIMARY KEY (id_loc),
    CONSTRAINT FK_LOCALIDAD_PROVINCIA FOREIGN KEY (id_pro)
        REFERENCES PROVINCIA(id_pro)
);
GO

CREATE TABLE ESPECIALIDAD (
    id_esp      INT IDENTITY(1,1),
    nombre_esp  VARCHAR(50) NOT NULL,

    CONSTRAINT PK_ESPECIALIDAD PRIMARY KEY (id_esp)
);
GO

CREATE TABLE USUARIO (
    id_usu        INT IDENTITY(1,1),
    username_usu  VARCHAR(30) NOT NULL,
    password_usu  VARCHAR(100) NOT NULL,
    tipo_usu      VARCHAR(10) NOT NULL,
    activo_usu    BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_USUARIO PRIMARY KEY (id_usu),
    CONSTRAINT UQ_USUARIO_USERNAME UNIQUE (username_usu),
    CONSTRAINT CK_TIPO_USU CHECK (tipo_usu IN ('Admin','Medico'))
);
GO

CREATE TABLE PACIENTE (
    id_pac                 INT IDENTITY(1,1),
    dni_pac                VARCHAR(15) NOT NULL,
    nombre_pac             VARCHAR(50) NOT NULL,
    apellido_pac           VARCHAR(50) NOT NULL,
    sexo_pac               CHAR(1) NOT NULL,
    nacionalidad_pac       VARCHAR(50) NOT NULL,
    fecha_nacimiento_pac   DATE NOT NULL,
    direccion_pac          VARCHAR(100) NOT NULL,
    id_loc                 INT NOT NULL,
    email_pac              VARCHAR(100) NOT NULL,
    telefono_pac           VARCHAR(30) NOT NULL,
    activo_pac             BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_PACIENTE PRIMARY KEY (id_pac),
    CONSTRAINT UQ_PACIENTE_DNI UNIQUE (dni_pac),
    CONSTRAINT FK_PACIENTE_LOCALIDAD FOREIGN KEY (id_loc)
        REFERENCES LOCALIDAD(id_loc),
    CONSTRAINT CK_PACIENTE_SEXO CHECK (sexo_pac IN ('M','F','X'))
);
GO

CREATE TABLE MEDICO (
    id_med                 INT IDENTITY(1,1),
    id_usu                 INT NOT NULL,
    legajo_med             VARCHAR(20) NOT NULL,
    dni_med                VARCHAR(15) NOT NULL,
    nombre_med             VARCHAR(50) NOT NULL,
    apellido_med           VARCHAR(50) NOT NULL,
    sexo_med               CHAR(1) NOT NULL,
    nacionalidad_med       VARCHAR(50) NOT NULL,
    fecha_nacimiento_med   DATE NOT NULL,
    direccion_med          VARCHAR(100) NOT NULL,
    id_loc                 INT NOT NULL,
    email_med              VARCHAR(100) NOT NULL,
    telefono_med           VARCHAR(30) NOT NULL,
    id_esp                 INT NOT NULL,
    activo_med             BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_MEDICO PRIMARY KEY (id_med),
    CONSTRAINT UQ_MEDICO_DNI UNIQUE (dni_med),
    CONSTRAINT UQ_MEDICO_LEGAJO UNIQUE (legajo_med),
    CONSTRAINT UQ_MEDICO_USUARIO UNIQUE (id_usu),
    CONSTRAINT FK_MEDICO_USUARIO FOREIGN KEY (id_usu)
        REFERENCES USUARIO(id_usu),
    CONSTRAINT FK_MEDICO_LOCALIDAD FOREIGN KEY (id_loc)
        REFERENCES LOCALIDAD(id_loc),
    CONSTRAINT FK_MEDICO_ESPECIALIDAD FOREIGN KEY (id_esp)
        REFERENCES ESPECIALIDAD(id_esp),
    CONSTRAINT CK_MEDICO_SEXO CHECK (sexo_med IN ('M','F','X'))
);

CREATE TABLE HORARIO_MEDICO (
    id_hor            INT IDENTITY(1,1),
    id_med            INT NOT NULL,
    dia_semana_hor    INT NOT NULL,   -- 1=Lunes ... 7=Domingo
    hora_inicio_hor   TIME NOT NULL,
    activo_hor        BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_HORARIO_MEDICO PRIMARY KEY (id_hor),
    CONSTRAINT FK_HORARIO_MEDICO_MEDICO FOREIGN KEY (id_med)
        REFERENCES MEDICO(id_med),
    CONSTRAINT CK_HORARIO_DIA_SEMANA CHECK (dia_semana_hor BETWEEN 1 AND 7),
);
GO

CREATE TABLE TURNO (
    id_tur            INT IDENTITY(1,1),
    id_med            INT NOT NULL,
    id_pac            INT NOT NULL,
    id_esp            INT NOT NULL,
    fecha_tur         DATE NOT NULL,
    hora_tur          TIME NOT NULL,
    estado_tur        VARCHAR(15) NOT NULL DEFAULT 'PENDIENTE',
    observacion_tur   VARCHAR(500) NULL,
    activo_tur        BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_TURNO PRIMARY KEY (id_tur),
    CONSTRAINT FK_TURNO_MEDICO FOREIGN KEY (id_med)
        REFERENCES MEDICO(id_med),
    CONSTRAINT FK_TURNO_PACIENTE FOREIGN KEY (id_pac)
        REFERENCES PACIENTE(id_pac),
    CONSTRAINT FK_TURNO_ESPECIALIDAD FOREIGN KEY (id_esp)
        REFERENCES ESPECIALIDAD(id_esp),
    CONSTRAINT CK_TURNO_ESTADO CHECK (estado_tur IN ('PENDIENTE','PRESENTE','AUSENTE')),
    CONSTRAINT UQ_TURNO_MEDICO_FECHA_HORA UNIQUE (id_med, fecha_tur, hora_tur)
);
GO


-- CARGA DE DATOS


INSERT INTO PROVINCIA (nombre_pro) VALUES
('Buenos Aires'),('Ciudad Autonoma de Buenos Aires'),('Cordoba'),('Santa Fe'),
('Mendoza'),('Tucuman'),('Entre Rios'),('Salta'),('Chaco'),('Misiones'),
('Neuquen'),('Rio Negro'),('San Juan'),('Jujuy'),('Corrientes');
GO


INSERT INTO LOCALIDAD (nombre_loc, id_pro) VALUES
('General Pacheco', 1),('Tigre', 1),('San Fernando', 1),('Escobar', 1),
('San Isidro', 1),('Quilmes', 1),('La Plata', 1),('Mar del Plata', 1),
('Palermo', 2),('Recoleta', 2),('Belgrano', 2),('Cordoba Capital', 3),
('Villa Carlos Paz', 3),('Rosario', 4),('Santa Fe Capital', 4),
('Mendoza Capital', 5),('San Rafael', 5),('San Miguel de Tucuman', 6),
('Concordia', 7),('Salta Capital', 8);
GO


INSERT INTO ESPECIALIDAD (nombre_esp) VALUES
('Cardiologia'),('Pediatria'),('Dermatologia'),('Traumatologia'),('Ginecologia'),
('Oftalmologia'),('Neurologia'),('Clinica Medica'),('Otorrinolaringologia'),
('Psiquiatria'),('Endocrinologia'),('Gastroenterologia'),('Urologia'),
('Nutricion'),('Kinesiologia');
GO


INSERT INTO USUARIO (username_usu, password_usu, tipo_usu, activo_usu) VALUES
('ecastro', '1234', 'Medico', 1),
('pmolina', '1234', 'Medico', 1),
('sortiz', '1234', 'Medico', 1),
('gvega', '1234', 'Medico', 1),
('rpaz', '1234', 'Medico', 1),
('msilva', '1234', 'Medico', 1),
('anunez', '1234', 'Medico', 1),
('drios', '1234', 'Medico', 1),
('hcabrera', '1234', 'Medico', 1),
('vmedina', '1234', 'Medico', 1),
('jluna', '1234', 'Medico', 1),
('fibanez', '1234', 'Medico', 1),
('ncampos', '1234', 'Medico', 1),
('cherrera', '1234', 'Medico', 1),
('preyes', '1234', 'Medico', 1),
('Admin', 'Admin1234', 'Admin', 1);
GO


INSERT INTO PACIENTE (dni_pac, nombre_pac, apellido_pac, sexo_pac, nacionalidad_pac, fecha_nacimiento_pac, direccion_pac, id_loc, email_pac, telefono_pac, activo_pac) VALUES
('30111222', 'Juan', 'Perez', 'M', 'Argentina', '1985-03-12', 'Av. Libertad 123', 1, 'juan.perez@mail.com', '1145551111', 1),
('29222333', 'Maria', 'Gonzalez', 'F', 'Argentina', '1990-07-22', 'Calle San Martin 456', 1, 'maria.gonzalez@mail.com', '1145552222', 1),
('31333444', 'Pedro', 'Rodriguez', 'M', 'Argentina', '1978-11-05', 'Av. Rivadavia 789', 2, 'pedro.rodriguez@mail.com', '1145553333', 1),
('32444555', 'Ana', 'Martinez', 'F', 'Argentina', '1995-01-30', 'Calle Belgrano 321', 2, 'ana.martinez@mail.com', '1145554444', 1),
('28555666', 'Luis', 'Sanchez', 'M', 'Argentina', '1982-09-14', 'Av. Mitre 654', 3, 'luis.sanchez@mail.com', '1145555555', 1),
('33666777', 'Lucia', 'Fernandez', 'F', 'Argentina', '1998-04-18', 'Calle Sarmiento 987', 3, 'lucia.fernandez@mail.com', '1145556666', 1),
('27777888', 'Diego', 'Torres', 'M', 'Argentina', '1975-12-25', 'Av. Independencia 159', 4, 'diego.torres@mail.com', '1145557777', 1),
('34888999', 'Carla', 'Ramirez', 'F', 'Argentina', '2000-06-08', 'Calle Moreno 753', 4, 'carla.ramirez@mail.com', '1145558888', 1),
('26999000', 'Fernando', 'Diaz', 'M', 'Argentina', '1980-02-17', 'Av. Colon 246', 5, 'fernando.diaz@mail.com', '1145559999', 1),
('35000111', 'Valentina', 'Acosta', 'F', 'Argentina', '1992-10-03', 'Calle Alem 864', 5, 'valentina.acosta@mail.com', '1145550000', 1),
('30112233', 'Roberto', 'Suarez', 'M', 'Argentina', '1988-05-21', 'Av. Peron 357', 6, 'roberto.suarez@mail.com', '1145561111', 1),
('31223344', 'Sofia', 'Romero', 'F', 'Argentina', '1997-08-11', 'Calle Urquiza 951', 6, 'sofia.romero@mail.com', '1145562222', 1),
('29334455', 'Gustavo', 'Flores', 'M', 'Argentina', '1983-03-29', 'Av. Maipu 159', 7, 'gustavo.flores@mail.com', '1145563333', 1),
('32445566', 'Camila', 'Benitez', 'F', 'Argentina', '1999-12-12', 'Calle Lavalle 753', 7, 'camila.benitez@mail.com', '1145564444', 1),
('28556677', 'Marcelo', 'Aguirre', 'M', 'Argentina', '1979-07-07', 'Av. Las Heras 486', 8, 'marcelo.aguirre@mail.com', '1145565555', 1);
GO


INSERT INTO dbo.MEDICO (id_usu, legajo_med, dni_med, nombre_med, apellido_med, sexo_med, nacionalidad_med, fecha_nacimiento_med, direccion_med, id_loc, email_med, telefono_med, id_esp) VALUES
(1, 'LEG-001', '25111222', 'Eduardo', 'Castro', 'M', 'Argentina', '1970-04-15', 'Av. Belgrano 100', 1, 'eduardo.castro@clinica.com', '1146661111', 1),
(2, 'LEG-002', '26222333', 'Patricia', 'Molina', 'F', 'Argentina', '1975-06-20', 'Calle Rivadavia 200', 1, 'patricia.molina@clinica.com', '1146662222', 2),
(3, 'LEG-003', '27333444', 'Sergio', 'Ortiz', 'M', 'Argentina', '1968-09-10', 'Av. San Martin 300', 2, 'sergio.ortiz@clinica.com', '1146663333', 3),
(4, 'LEG-004', '28444555', 'Gabriela', 'Vega', 'F', 'Argentina', '1980-01-25', 'Calle Mitre 400', 2, 'gabriela.vega@clinica.com', '1146664444', 4),
(5, 'LEG-005', '29555666', 'Ricardo', 'Paz', 'M', 'Argentina', '1972-11-30', 'Av. Sarmiento 500', 3, 'ricardo.paz@clinica.com', '1146665555', 5),
(6, 'LEG-006', '30666777', 'Monica', 'Silva', 'F', 'Argentina', '1985-02-14', 'Calle Independencia 600', 3, 'monica.silva@clinica.com', '1146666666', 6),
(7, 'LEG-007', '24777888', 'Alberto', 'Nuñez', 'M', 'Argentina', '1965-08-05', 'Av. Moreno 700', 4, 'alberto.nunez@clinica.com', '1146667777', 7),
(8, 'LEG-008', '31888999', 'Daniela', 'Rios', 'F', 'Argentina', '1990-03-22', 'Calle Colon 800', 4, 'daniela.rios@clinica.com', '1146668888', 8),
(9, 'LEG-009', '23999000', 'Hugo', 'Cabrera', 'M', 'Argentina', '1962-12-01', 'Av. Alem 900', 5, 'hugo.cabrera@clinica.com', '1146669999', 9),
(10, 'LEG-010', '32000111', 'Veronica', 'Medina', 'F', 'Argentina', '1992-07-17', 'Calle Peron 1000', 5, 'veronica.medina@clinica.com', '1146670000', 10),
(11, 'LEG-011', '25112233', 'Javier', 'Luna', 'M', 'Argentina', '1971-05-09', 'Av. Urquiza 1100', 6, 'javier.luna@clinica.com', '1146671111', 11),
(12, 'LEG-012', '33223344', 'Florencia', 'Ibañez', 'F', 'Argentina', '1995-09-28', 'Calle Maipu 1200', 6, 'florencia.ibanez@clinica.com', '1146672222', 12),
(13, 'LEG-013', '26334455', 'Norberto', 'Campos', 'M', 'Argentina', '1973-10-19', 'Av. Lavalle 1300', 7, 'norberto.campos@clinica.com', '1146673333', 13),
(14, 'LEG-014', '34445566', 'Cecilia', 'Herrera', 'F', 'Argentina', '1998-01-08', 'Calle Las Heras 1400', 7, 'cecilia.herrera@clinica.com', '1146674444', 14),
(15, 'LEG-015', '27556677', 'Pablo', 'Reyes', 'M', 'Argentina', '1969-06-26', 'Av. Mitre 1500', 8, 'pablo.reyes@clinica.com', '1146675555', 15);
GO

INSERT INTO TURNO (id_med, id_pac, id_esp, fecha_tur, hora_tur, estado_tur, observacion_tur, activo_tur) VALUES
(1, 1, 1, '2026-01-12', '08:00', 'PRESENTE', 'Control de rutina, sin novedades.', 1),
(1, 2, 1, '2026-01-19', '09:00', 'AUSENTE', NULL, 1),
(2, 3, 2, '2026-01-12', '09:00', 'PRESENTE', 'Vacunacion al dia.', 1),
(2, 4, 2, '2026-01-19', '10:00', 'AUSENTE', NULL, 1),
(3, 5, 3, '2026-02-02', '08:00', 'PRESENTE', 'Se indica tratamiento topico.', 1),
(3, 6, 3, '2026-02-09', '09:00', 'PRESENTE', 'Control en 30 dias.', 1),
(4, 7, 4, '2026-02-02', '14:00', 'AUSENTE', NULL, 1),
(4, 8, 4, '2026-02-09', '15:00', 'PRESENTE', 'Radiografia sin lesiones.', 1),
(5, 9, 5, '2026-02-16', '08:00', 'PRESENTE', 'Estudios de rutina solicitados.', 1),
(5, 10, 5, '2026-02-16', '09:00', 'AUSENTE', NULL, 1),
(6, 11, 6, '2026-03-02', '14:00', 'PENDIENTE', NULL, 1),
(6, 12, 6, '2026-03-02', '15:00', 'PENDIENTE', NULL, 1),
(7, 13, 7, '2026-03-09', '08:00', 'PENDIENTE', NULL, 1),
(7, 14, 7, '2026-03-09', '09:00', 'PENDIENTE', NULL, 1),
(8, 15, 8, '2026-03-16', '14:00', 'PENDIENTE', NULL, 1),
(9, 1, 9, '2026-03-16', '08:00', 'PENDIENTE', NULL, 1),
(10, 2, 10, '2026-03-23', '14:00', 'PENDIENTE', NULL, 1),
(11, 3, 11, '2026-03-23', '14:00', 'PENDIENTE', NULL, 1),
(12, 4, 12, '2026-03-30', '08:00', 'PENDIENTE', NULL, 1),
(13, 5, 13, '2026-03-30', '08:00', 'PENDIENTE', NULL, 1);
GO

PRINT 'Base de datos BDD_TPI_GRUPO_2_PR3 creada y cargada correctamente.';
GO