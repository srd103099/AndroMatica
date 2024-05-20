CREATE DATABASE PROYECTO_FINAL3
USE PROYECTO_FINAL3

-------------------------------------------------------------------------------------------------------
/* 1. HOSPITAL */
CREATE TABLE HOSPITAL(
Id_Hospital INT PRIMARY KEY NOT NULL,
Nombre NVARCHAR(MAX),
Ubicacion NVARCHAR(MAX)
);
-------------------------------------------------------------------------------------------------------
/* 2. CONSULTORIO */
CREATE TABLE CONSULTORIO(
Id_Consultorio INT PRIMARY KEY NOT NULL,
Id_Hospital INT,
Nombre NVARCHAR(MAX),
Disponibilidad NVARCHAR(MAX),

FOREIGN KEY (Id_Hospital)REFERENCES HOSPITAL(Id_Hospital)
);
-------------------------------------------------------------------------------------------------------
/* 3. SERVICIOS */
CREATE TABLE SERVICIOS(
Id_Servicios INT PRIMARY KEY NOT NULL,
Id_Consultorio INT,
Servicio NVARCHAR(MAX),

FOREIGN KEY (Id_Consultorio)REFERENCES CONSULTORIO(Id_Consultorio)
);
-------------------------------------------------------------------------------------------------------
/* 4. USER_PASIENTE */
CREATE TABLE USUARIO_PASIENTE(
Id_UsuarioPasiente INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Id_Hospital INT,
Usuario_Pasiente NVARCHAR(MAX),
Contrasena NVARCHAR(MAX),

FOREIGN KEY (Id_Hospital)REFERENCES HOSPITAL(Id_Hospital)
);

--Crear Usuario
CREATE PROCEDURE SP_CrearUsuarioPasiente
    @Id_Hospital INT,
    @Usuario_Pasiente NVARCHAR(MAX),
    @Contrasena NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO USUARIO_PASIENTE (Id_Hospital, Usuario_Pasiente, Contrasena)
    VALUES (@Id_Hospital, @Usuario_Pasiente, @Contrasena);
END;

--Buscar Usuario Pasiente
CREATE PROCEDURE SP_ObtenerUsuarioPasiente
    @Id_UsuarioPasiente INT
AS
BEGIN
    SELECT *
    FROM USUARIO_PASIENTE
    WHERE Id_UsuarioPasiente = @Id_UsuarioPasiente;
END;

--Actualizar Pasiente
CREATE PROCEDURE SP_ActualizarUsuarioPasiente
    @Id_UsuarioPasiente INT,
    @Id_Hospital INT,
    @Usuario_Pasiente NVARCHAR(MAX),
    @Contrasena NVARCHAR(MAX)
AS
BEGIN
    UPDATE USUARIO_PASIENTE
    SET Id_Hospital = @Id_Hospital,
        Usuario_Pasiente = @Usuario_Pasiente,
        Contrasena = @Contrasena
    WHERE Id_UsuarioPasiente = @Id_UsuarioPasiente;
END;

--Eliminar Usuario Pasiente
CREATE PROCEDURE SP_EliminarUsuarioPasiente
    @Id_UsuarioPasiente INT
AS
BEGIN
    DELETE FROM USUARIO_PASIENTE
    WHERE Id_UsuarioPasiente = @Id_UsuarioPasiente;
END;

-------------------------------------------------------------------------------------------------------
/* 5. PASIENTE */
CREATE TABLE PASIENTE(
Id_Cedula INT PRIMARY KEY NOT NULL,
Id_UsuarioPasiente INT IDENTITY(1,1),
Nombre NVARCHAR(MAX),
Apellido NVARCHAR(MAX),
Telefono INT,
Correo NVARCHAR(MAX),

FOREIGN KEY (Id_UsuarioPasiente)REFERENCES USUARIO_PASIENTE(Id_UsuarioPasiente)
);

--Crear Pasiente
CREATE PROCEDURE SP_CrearPasiente
    @Id_Cedula INT,
    @Nombre NVARCHAR(MAX),
    @Apellido NVARCHAR(MAX),
    @Telefono INT,
    @Correo NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO PASIENTE (Id_Cedula, Nombre, Apellido, Telefono, Correo)
    VALUES (@Id_Cedula, @Nombre, @Apellido, @Telefono, @Correo);
END;

--Bucar Pasiente por Id_Cedula
CREATE PROCEDURE SP_ObtenerPasientePorId
    @Id_Cedula INT
AS
BEGIN
    SELECT *
    FROM PASIENTE
    WHERE Id_Cedula = @Id_Cedula;
END;

--Actualizar Pasiente
CREATE PROCEDURE SP_ActualizarPasiente
    @Id_Cedula INT,
    @Nombre NVARCHAR(MAX),
    @Apellido NVARCHAR(MAX),
    @Telefono INT,
    @Correo NVARCHAR(MAX)
AS
BEGIN
    UPDATE PASIENTE
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Telefono = @Telefono,
        Correo = @Correo
    WHERE Id_Cedula = @Id_Cedula;
END;

--Eliminar Pasiente
CREATE PROCEDURE SP_EliminarPaciente
    @Id_Cedula INT
AS
BEGIN
    DELETE FROM PASIENTE WHERE Id_Cedula = @Id_Cedula;
END



-------------------------------------------------------------------------------------------------------
/* 6. HISTORIAL */
CREATE TABLE HISTORIA_CLINICA(
Id_Historial INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Id_Cedula INT,
Descripcion NVARCHAR(MAX),

FOREIGN KEY (Id_Cedula)REFERENCES PASIENTE(Id_Cedula)
);

--Crear Historial Clinico
CREATE PROCEDURE SP_CrearHistorialClinico
    @Id_Cedula INT,
    @Descripcion NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO HISTORIA_CLINICA (Id_Cedula, Descripcion)
    VALUES (@Id_Cedula, @Descripcion);
END;
--Buscar Historial Clinico
CREATE PROCEDURE SP_ObtenerHistorialClinico
    @Id_Cedula INT
AS
BEGIN
    SELECT *
    FROM HISTORIA_CLINICA
    WHERE Id_Cedula = @Id_Cedula;
END;
--Actualizar Historial
CREATE PROCEDURE SP_ActualizarHistorialClinico
    @Id_Historial INT,
    @Id_Cedula INT,
    @Descripcion NVARCHAR(MAX)
AS
BEGIN
    UPDATE HISTORIA_CLINICA
    SET Id_Cedula = @Id_Cedula,
        Descripcion = @Descripcion
    WHERE Id_Historial = @Id_Historial;
END;
--Eliminar Historial
CREATE PROCEDURE SP_EliminarHistorialClinico
    @Id_Historial INT
AS
BEGIN
    DELETE FROM HISTORIA_CLINICA
    WHERE Id_Historial = @Id_Historial;
END;
-------------------------------------------------------------------------------------------------------
/* 7. CITA */
CREATE TABLE CITA(
Id_Cita INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Id_Consultorio INT,
Id_Servicios INT,
Id_Cedula INT,
Fecha DATE,
Hora TIME,

FOREIGN KEY (Id_Consultorio)REFERENCES CONSULTORIO(Id_Consultorio),
FOREIGN KEY (Id_Servicios)REFERENCES SERVICIOS(Id_Servicios),
FOREIGN KEY (Id_Cedula)REFERENCES PASIENTE(Id_Cedula)
);

--Crear Cita
CREATE PROCEDURE SP_CrearCita
    @Id_Consultorio INT,
    @Id_Servicios INT,
    @Id_Cedula INT,
    @Fecha DATE,
    @Hora TIME
AS
BEGIN
    INSERT INTO CITA (Id_Consultorio, Id_Servicios, Id_Cedula, Fecha, Hora)
    VALUES (@Id_Consultorio, @Id_Servicios, @Id_Cedula, @Fecha, @Hora);
END;
--Buscar Cita
CREATE PROCEDURE SP_ObtenerCita
    @Id_Cita INT
AS
BEGIN
    SELECT *
    FROM CITA
    WHERE Id_Cita = @Id_Cita;
END;
--Actualizar Cita
CREATE PROCEDURE SP_ActualizarCita
    @Id_Cita INT,
    @Id_Consultorio INT,
    @Id_Servicios INT,
    @Id_Cedula INT,
    @Fecha DATE,
    @Hora TIME
AS
BEGIN
    UPDATE CITA
    SET Id_Consultorio = @Id_Consultorio,
        Id_Servicios = @Id_Servicios,
        Id_Cedula = @Id_Cedula,
        Fecha = @Fecha,
        Hora = @Hora
    WHERE Id_Cita = @Id_Cita;
END;
--Eliminar Cita
CREATE PROCEDURE SP_EliminarCita
    @Id_Cita INT
AS
BEGIN
    DELETE FROM CITA
    WHERE Id_Cita = @Id_Cita;
END;
-------------------------------------------------------------------------------------------------------
/* 8. USER_DOCTOR */
CREATE TABLE USUARIO_DOCTOR(
Id_UsuarioDoctor INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Id_Hospital INT,
Usuario_Doctor NVARCHAR(MAX),
Contrasena NVARCHAR(MAX),

FOREIGN KEY (Id_Hospital)REFERENCES HOSPITAL(Id_Hospital)
);

--Crear Usuario Doctor
CREATE PROCEDURE SP_CrearUsuarioDoctor
    @Id_Hospital INT,
    @Usuario_Doctor NVARCHAR(MAX),
    @Contrasena NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO USUARIO_DOCTOR (Id_Hospital, Usuario_Doctor, Contrasena)
    VALUES (@Id_Hospital, @Usuario_Doctor, @Contrasena);
END;
--Buscar Usuario
CREATE PROCEDURE SP_ObtenerUsuarioDoctor
    @Id_UsuarioDoctor INT
AS
BEGIN
    SELECT *
    FROM USUARIO_DOCTOR
    WHERE Id_UsuarioDoctor = @Id_UsuarioDoctor;
END;
--Actualizar Usuario Doctor
CREATE PROCEDURE SP_ActualizarUsuarioDoctor
    @Id_UsuarioDoctor INT,
    @Id_Hospital INT,
    @Usuario_Doctor NVARCHAR(MAX),
    @Contrasena NVARCHAR(MAX)
AS
BEGIN
    UPDATE USUARIO_DOCTOR
    SET Id_Hospital = @Id_Hospital,
        Usuario_Doctor = @Usuario_Doctor,
        Contrasena = @Contrasena
    WHERE Id_UsuarioDoctor = @Id_UsuarioDoctor;
END;
--Eliminar Usuario Doctor
CREATE PROCEDURE SP_EliminarUsuarioDoctor
    @Id_UsuarioDoctor INT
AS
BEGIN
    DELETE FROM USUARIO_DOCTOR
    WHERE Id_UsuarioDoctor = @Id_UsuarioDoctor;
END;
-------------------------------------------------------------------------------------------------------
/* 9. DOCTOR */
CREATE TABLE DOCTOR(
Id_Doctor INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Id_UsuarioDoctor INT,
Nombre NVARCHAR(MAX),
Apellido NVARCHAR(MAX),
Especialidad NVARCHAR(MAX),

FOREIGN KEY (Id_UsuarioDoctor)REFERENCES USUARIO_DOCTOR(Id_UsuarioDoctor)
);

--Crear Doctor
CREATE PROCEDURE SP_CrearDoctor
    @Id_UsuarioDoctor INT,
    @Nombre NVARCHAR(MAX),
    @Apellido NVARCHAR(MAX),
    @Especialidad NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO DOCTOR (Id_UsuarioDoctor, Nombre, Apellido, Especialidad)
    VALUES (@Id_UsuarioDoctor, @Nombre, @Apellido, @Especialidad);
END;
--Buscar Doctor
CREATE PROCEDURE SP_ObtenerDoctor
    @Id_Doctor INT
AS
BEGIN
    SELECT *
    FROM DOCTOR
    WHERE Id_Doctor = @Id_Doctor;
END;
--Actualizar Doctor
CREATE PROCEDURE SP_ActualizarDoctor
    @Id_Doctor INT,
    @Nombre NVARCHAR(MAX),
    @Apellido NVARCHAR(MAX),
    @Especialidad NVARCHAR(MAX)
AS
BEGIN
    UPDATE DOCTOR
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Especialidad = @Especialidad
    WHERE Id_Doctor = @Id_Doctor;
END;
--Eliminar Doctor
CREATE PROCEDURE SP_EliminarDoctor
    @Id_Doctor INT
AS
BEGIN
    DELETE FROM DOCTOR
    WHERE Id_Doctor = @Id_Doctor;
END;
-------------------------------------------------------------------------------------------------------
/* 10. EVALUACION */
CREATE TABLE EVALUACION(
Id_Evaluacion INT IDENTITY(1,1),
Id_Doctor INT,
Id_Cita INT,
Calificacion_Profesional INT,
Calificasion_Servicio INT,

FOREIGN KEY (Id_Doctor)REFERENCES DOCTOR(Id_Doctor),
FOREIGN KEY (Id_Cita)REFERENCES CITA(Id_Cita)
);

--Crear Evaluacion
CREATE PROCEDURE SP_EliminarCita
    @Id_Cita INT
AS
BEGIN
    DELETE FROM CITA
    WHERE Id_Cita = @Id_Cita;
END;
--Buscar Evaluacion
CREATE PROCEDURE SP_ObtenerEvaluacion
    @Id_Evaluacion INT
AS
BEGIN
    SELECT *
    FROM EVALUACION
    WHERE Id_Evaluacion = @Id_Evaluacion;
END;
--Actualizar Evaluacion
CREATE PROCEDURE SP_ActualizarEvaluacion
    @Id_Evaluacion INT,
    @Id_Doctor INT,
    @Id_Cita INT,
    @Calificacion_Profesional INT,
    @Calificasion_Servicio INT
AS
BEGIN
    UPDATE EVALUACION
    SET Id_Doctor = @Id_Doctor,
        Id_Cita = @Id_Cita,
        Calificacion_Profesional = @Calificacion_Profesional,
        Calificasion_Servicio = @Calificasion_Servicio
    WHERE Id_Evaluacion = @Id_Evaluacion;
END;
--Eliminar Evaluacion
CREATE PROCEDURE SP_EliminarEvaluacion
    @Id_Evaluacion INT
AS
BEGIN
    DELETE FROM EVALUACION
    WHERE Id_Evaluacion = @Id_Evaluacion;
END;
-------------------------------------------------------------------------------------------------------
--ORDEN ALFABÉTICO 

CREATE NONCLUSTERED INDEX IDX_Cedula ON PASIENTE (Id_Cedula);
EXECUTE SP_HELPINDEX 'PASIENTE'

SELECT * FROM PASIENTE ORDER BY Id_Cedula ASC

--Orden cronologico 
CREATE NONCLUSTERED INDEX IDX_FECHA ON CITA (Fecha) 
EXECUTE SP_HELPINDEX 'CITA'

SELECT * FROM CITA ORDER BY Fecha ASC

--DISPONIBLE O NO
CREATE NONCLUSTERED INDEX IDX_Disponibilidad on CONSULTORIO (Id_Consultorio)
EXECUTE SP_HELPINDEX 'CONSULTORIO'

SELECT Nombre, Disponibilidad FROM CONSULTORIO WHERE CONSULTORIO.Disponibilidad = 'Disponible'

--Vistas
CREATE VIEW Vista_Consultorios_Disponibles AS
SELECT *
FROM CONSULTORIO
WHERE Disponibilidad = 'Disponible';

SELECT * FROM Vista_Consultorios_Disponibles;

CREATE VIEW Vista_Citas AS
SELECT * FROM CITA;

SELECT * FROM Vista_Citas;

EXEC SP_HELPTEXT Vista_Citas

ALTER VIEW Vista_Citas WITH ENCRYPTION 
AS 
SELECT *
FROM CITA;