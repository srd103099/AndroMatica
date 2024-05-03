create database HOSPITAL3
USE HOSPITAL3

CREATE TABLE Clinica(
Id_clinica int not null primary key,
Nombre Varchar (50) not null,
Ubicacion varchar (50) not null,
Especialidad varchar (50) not null
);

create table Consultorio(
Id_consultorio int not null primary key,
Nombre varchar (50) not null,
Disponibilidad varchar (50)
);

create table Citas(
Id_cita int not null primary key,
Id_paciente int,
Id_evaluacion int,
Fecha DATE,
Hora TIME,
FOREIGN KEY (Id_paciente) REFERENCES Pacientes(Id_paciente),
foreign key (Id_evaluacion) references EVALUACION (Id_evaluacion)
);

Create table Pacientes(
Id_paciente int not null primary key,
Nombre varchar (50) not null,
Telefono int,
Correo varchar (50)
);

CREATE TABLE PROFESIONALES (
Id_profesional INT NOT NULL PRIMARY KEY,
Id_clinica int,
Id_servicio int,
Nombre VARCHAR (50),
Especialidad VARCHAR (50),
foreign key (Id_clinica)References Clinica(Id_clinica),
FOREIGN KEY (Id_servicio) REFERENCES SERVICIOS (Id_servicio)
);

CREATE TABLE SERVICIOS (
Id_servicio INT NOT NULL PRIMARY KEY,
Nombre varchar (50)
);

CREATE TABLE EVALUACION (
Id_evaluacion INT NOT NULL PRIMARY KEY,
calificacion_pro INT,
calificacion_serv INT
);

CREATE TABLE ALERGIAS (
Id_alergia int not null primary key,
Id_paciente int,
Nombre varchar (50),
foreign key (Id_paciente) references Pacientes(Id_paciente)
);

CREATE TABLE Citas_Consultorio (
    Id_cita INT,
    Id_consultorio INT,
    FOREIGN KEY (Id_cita) REFERENCES Citas(Id_cita),
    FOREIGN KEY (Id_consultorio) REFERENCES Consultorio(Id_consultorio),
    PRIMARY KEY ( Id_cita, Id_consultorio)
);

CREATE TABLE Clinica_Consultorio (
    Id_clinica INT,
    Id_consultorio INT,
    FOREIGN KEY (Id_clinica) REFERENCES Clinica(Id_clinica),
    FOREIGN KEY (Id_consultorio) REFERENCES Consultorio(Id_consultorio),
    PRIMARY KEY (Id_clinica, Id_consultorio)
);

CREATE TABLE CLINICA_CITAS (
	Id_clinica INT,
	Id_cita INT,
	Foreign key (Id_clinica) references Clinica(Id_clinica),
	foreign key (Id_cita) references Citas (Id_Cita),
	Primary key (Id_clinica, Id_cita)
	);

CREATE TABLE EVALUACION_PROFESIONALES (
	Id_evaluacion INT,
	Id_profesional INT
	FOREIGN KEY (Id_evaluacion) REFERENCES EVALUACION (Id_evaluacion),
	FOREIGN KEY (Id_profesional) REFERENCES PROFESIONALES (Id_profesional),
	PRIMARY KEY (Id_evaluacion, Id_profesional )
);

	--valores tablas

INSERT INTO Clinica(Id_clinica, Nombre, Ubicacion, Especialidad)
VALUES
    (1, 'Cl�nica San Juan', 'Calle Principal 123', 'Medicina General'),
    (2, 'Centro M�dico Salud y Bienestar', 'Avenida Central 456', 'Dermatolog�a'),
    (3, 'Hospital Santa Mar�a', 'Plaza Principal 789', 'Cardiolog�a'),
    (4, 'Cl�nica M�dica Integral', 'Calle Secundaria 321', 'Medicina Interna'),
    (5, 'Centro de Salud Familiar', 'Avenida Lateral 654', 'Medicina Familiar');

	INSERT INTO Consultorio (Id_consultorio, Nombre, Disponibilidad)
VALUES
    (1, 'Consultorio 1', 'Disponible'),
    (2, 'Consultorio 2', 'No disponible'),
    (3, 'Consultorio 3', 'Disponible'),
    (4, 'Consultorio 4', 'Disponible'),
    (5, 'Consultorio 5', 'No disponible');


INSERT INTO Citas (Id_cita, Fecha, Hora)
VALUES
    (1, '2024-05-10', '10:00:00'),
    (2, '2024-05-15', '14:30:00'),
    (3, '2024-05-20', '09:00:00'),
    (4, '2024-05-25', '16:00:00'),
    (5, '2024-05-30', '11:30:00');

	INSERT INTO Pacientes (Id_paciente, Nombre, Telefono, Correo)
VALUES
    (1, 'Ana Garc�a', 123456789, 'ana@example.com'),
    (2, 'Juan L�pez', 987654321, 'juan@example.com'),
    (3, 'Mar�a Rodr�guez', 555555555, 'maria@example.com'),
    (4, 'Pedro G�mez', 987987987, 'pedro@example.com'),
    (5, 'Sof�a Hern�ndez', 654654654, 'sofia@example.com');

	INSERT INTO PROFESIONALES (Id_profesional, Nombre, Especialidad)
VALUES
    (1, 'Dr. Mart�nez', 'Medicina General'),
    (2, 'Dra. P�rez', 'Dermatolog�a'),
    (3, 'Dr. S�nchez', 'Cardiolog�a'),
    (4, 'Dra. G�mez', 'Medicina Interna'),
    (5, 'Dr. Hern�ndez', 'Medicina Familiar');

	INSERT INTO SERVICIOS (Id_servicio, Nombre)
VALUES
    (1, 'Consulta General'),
    (2, 'Dermatolog�a'),
    (3, 'Cardiolog�a'),
    (4, 'Medicina Interna'),
    (5, 'Medicina Familiar');

	INSERT INTO EVALUACION (Id_evaluacion, calificacion_pro, calificacion_serv)
VALUES
    (1, 4, 5),
    (2, 3, 4),
    (3, 5, 4),
    (4, 4, 4),
    (5, 3, 5);

	INSERT INTO ALERGIAS (Id_alergia, Nombre)
VALUES
    (1, 'Alergia a la penicilina'),
    (2, 'Alergia al polen'),
    (3, 'Alergia al marisco'),
    (4, 'Alergia al l�tex'),
    (5, 'Alergia a los mariscos');







--PROCEDIMIENTOS ALMACENADOS 

CREATE PROCEDURE CLINICAPROC '2'
@Id_clincaproc varchar (50)
as
begin
select * from Clinica where Id_clinica = @Id_clincaproc
end;

CREATE PROCEDURE INSERTAR_PACIENTE
@nombreproc varchar (50),
@telefonoproc int,
@correoproc varchar (50)
as
begin
insert into Pacientes (Nombre,Telefono,Correo) values (@nombreproc, @telefonoproc, @correoproc)
end;

--execute INSERTAR_PACIENTE @nombreproc = 'Gabriel Isturiz', @telefonoproc = '164852652', @correoproc = 'gabo@example.com'
--el anterior "execute" insertara nuevos valores a la tabla de pacientes 

CREATE PROCEDURE INSERTAR_CITA
@idcitaproc int,
@idpacienteproc int,
@idevaluacionproc int,
@fechaproc date,
@horaproc time
as
begin
insert into Citas (Id_cita, Id_paciente, Id_evaluacion, Fecha, Hora) values (@idcitaproc, @idpacienteproc, @idevaluacionproc,@fechaproc,@horaproc)
end;
--execute INSERTAR_CITA @idcitaproc = '6', @idpacienteproc= '6',@idevaluacionproc = '6', @fechaproc = '2024-08-11', @horaproc= '17:00:00'
--el anterior "execute" insertara nuevos valores a la tabla de citas

--INDICES

--ORDEN ALFABETICO
select * from Pacientes
Order By Nombre asc

select * from Pacientes 

execute sp_helpindex 'Pacientes'

CREATE NONCLUSTERED index IDX_Nombre
on Pacientes (Nombre)


--ORDEN CRONOLOGICO
SELECT * FROM Citas

CREATE NONCLUSTERED INDEX IDX_Fecha
on Citas (Fecha)

execute sp_helpindex 'Citas'

--DISPONIBLE O NO
Select Nombre, Disponibilidad from Consultorio where Consultorio.Disponibilidad = 'Disponible'

CREATE NONCLUSTERED INDEX IDX_Disponibilidad
on Consultorio (Disponibilidad)

execute sp_helpindex 'Consultorio'

--funciones

--FUNCION PARA SABER EL PROMEDIO DE LAS EVALUACIONES
CREATE FUNCTION EvaluacionPromedios (@calificacion float)
RETURNS @PROMEDIOS TABLE
(
	Id_evaluacion INT,
	calificacion_pro INT,
	calificacion_serv INT,
	promedios FLOAT

)
AS
BEGIN
	INSERT INTO @PROMEDIOS
	SELECT Id_evaluacion, calificacion_pro, calificacion_serv, CAST ((calificacion_pro+calificacion_serv) AS FLOAT)/2 AS PROMEDIOS FROM EVALUACION
	RETURN;
	END;
SELECT * FROM EvaluacionPromedios(1);

--TRIGGERS

--NUEVO PACIENTE, NUEVO VALOR. TRIGGER PARA INSERTAR A NUEVO PACIENTE 
CREATE TRIGGER TR_PACIENTE_INSERT 
ON Pacientes
FOR INSERT
AS
PRINT 'NUEVO PACIENTE INSERTADO'
INSERT INTO (6, 'Ignacio Isturiz', '312478308', 'ignacio@example.com');
--SI EJECUTO EL ANTERIOR INSERT INTO, SE INSERTARA UN NUEVO DATO EN LA TABLA PACIENTES 





