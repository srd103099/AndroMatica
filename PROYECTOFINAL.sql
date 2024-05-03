use HOSPITAL3
--procedimientos almacenados 

CREATE PROCEDURE CLINICAPROC '1'
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