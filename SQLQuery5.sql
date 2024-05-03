use HOSPITAL3
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








