use EMPRESA
CREATE TABLE Habilidad (
    id_Habilidad INT not null PRIMARY KEY,
    Nombre VARCHAR(50),
);
CREATE TABLE Proyecto (
    id_Proyecto INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50),
	cantidadempleados varchar (50)
  
);
CREATE TABLE Departamento (
    id_Departamento INT not null PRIMARY KEY,
    Nombre VARCHAR(50),
    direccion VARCHAR(50)
);
CREATE TABLE Empleado (
    id_Empleado INT not null PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
	celular varchar (50),
	direccion varchar (50),
);
CREATE TABLE Empleado_Proyecto (
    id_Empleado int,
    id_Proyecto int,
    foreign key (id_Empleado) references Empleado(id_Empleado),
    foreign key(id_Proyecto) references Proyecto(id_Proyecto),
    primary key (id_Empleado, id_Proyecto)
);
CREATE TABLE Empleado_Habilidad (
    id_Empleado int,
    id_Habilidad int,
    foreign key (id_Empleado) references Empleado(id_Empleado),
    foreign key(id_Habilidad) references Habilidad(id_Habilidad),
    primary key (id_Empleado, id_Habilidad)
);
CREATE TABLE Empleado_Departamento (
    id_Empleado int,
    id_Departamento int,
    foreign key (id_Empleado) references Empleado(id_Empleado),
    foreign key(id_Departamento) references Departamento (id_Departamento),
    primary key (id_Empleado, id_Departamento)
);
CREATE TABLE Proyecto_Departamento (
    id_Proyecto int,
    id_Departamento int,
    foreign key ( id_Proyecto ) references Proyecto (id_proyecto),
    foreign key(id_Departamento) references Departamento (id_Departamento),
    primary key ( id_Proyecto , id_Departamento)
);
