use HOSPITAL3
--indices

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

-- 


