--CREATE DATABASE Gestion_Restaurante
USE Gestion_restaurante

/*CREATE TABLE Restaurantes (
    Id_Restaurante INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(40),
    Direccion VARCHAR(40),
    Ciudad VARCHAR(40),
    Pais VARCHAR(40),
    Telefono VARCHAR(20),
    Horario_apertura VARCHAR(10),
    Horario_Cierre VARCHAR(10),
    Imagen CHAR
);

CREATE TABLE Tipos_Comidas (
    Id_Tipo_Comida INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(40),
    Descripcion VARCHAR(100),
    Id_Restaurante INT,
    FOREIGN KEY (Id_Restaurante) REFERENCES Restaurantes(Id_Restaurante)
);

CREATE TABLE Menus (
    Id_Menu INT NOT NULL PRIMARY KEY,
    Id_Restaurante INT,
    Nombre VARCHAR(50),
    FOREIGN KEY (Id_Restaurante) REFERENCES Restaurantes(Id_Restaurante)
);

CREATE TABLE Platos (
    Id_Plato INT NOT NULL PRIMARY KEY,
    Id_Menu INT,
    Descripcion VARCHAR(100),
    Nombre VARCHAR(40),
    Precio FLOAT NOT NULL,
    FOREIGN KEY (Id_Menu) REFERENCES Menus(Id_Menu)
);

CREATE TABLE Clientes (
    Id_Cliente INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(40),
    Direccion VARCHAR(40),
    Ciudad VARCHAR(40),
    Pais VARCHAR(40),
    Telefono VARCHAR(20),
    Correo_electronico VARCHAR(40)
);

CREATE TABLE Pedidos (
    Id_Pedido INT NOT NULL PRIMARY KEY,
    Tipo_Pedido VARCHAR(40),
    Fecha VARCHAR(40),
    Hora VARCHAR(40),
    Estado_Pedido VARCHAR(40),
    Precio_Total_Pedido FLOAT NOT NULL,
    Id_Cliente INT,
    Id_Restaurante INT,
    FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente),
    FOREIGN KEY (Id_Restaurante) REFERENCES Restaurantes(Id_Restaurante)
);

CREATE TABLE Reservas (
    Id_Reserva INT NOT NULL PRIMARY KEY,
    Fecha VARCHAR(40),
    Hora VARCHAR(40),
    Num_Personas INT,
    Id_Restaurante INT,
    Id_Cliente INT,
    FOREIGN KEY (Id_Restaurante) REFERENCES Restaurantes(Id_Restaurante),
    FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente)
);
CREATE TABLE Restaurantes_TiposComidas (
	Id_Restaurante_TipoComida INT NOT NULL PRIMARY KEY,
    Id_Restaurante INT,
    Id_Tipo_Comida INT,
    FOREIGN KEY (Id_Restaurante) REFERENCES Restaurantes(Id_Restaurante),
    FOREIGN KEY (Id_Tipo_Comida) REFERENCES Tipos_Comidas(Id_Tipo_Comida)
);

CREATE TABLE Menus_Platos (
	Id_Menu_Platos INT NOT NULL PRIMARY KEY,
    Id_Menu INT,
    Id_Plato INT,
    FOREIGN KEY (Id_Menu) REFERENCES Menus(Id_Menu),
    FOREIGN KEY (Id_Plato) REFERENCES Platos(Id_Plato)
);

CREATE TABLE Clientes_Reservas (
	Clientes_Reserva INT NOT NULL PRIMARY KEY,
    Id_Cliente INT,
    Id_Reserva INT,
    FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente),
    FOREIGN KEY (Id_Reserva) REFERENCES Reservas(Id_Reserva)
);

CREATE TABLE Pedidos_Platos (
	Id_Pedidos_Plantos INT NOT NULL,
    Id_Pedido INT,
    Id_Plato INT,
    FOREIGN KEY (Id_Pedido) REFERENCES Pedidos(Id_Pedido),
    FOREIGN KEY (Id_Plato) REFERENCES Platos(Id_Plato)
);*/
 
/* INSERT INTO Restaurantes VALUES
(1, 'La Trattoria', 'Calle Italia 123', 'Madrid', 'España', '+34 91 123 4567', '09:00', '22:00', NULL),
(2, 'Le Petit Bistro', 'Rue de France 45', 'Paris', 'Francia', '+33 1 45 67 89 00', '08:00', '21:30', NULL),
(3, 'Sushi Samba', '123 Sushi Street', 'New York', 'Estados Unidos', '+1 212-123-4567', '11:30', '23:00', NULL),
(4, 'El Taquito', 'Avenida Mexico 456', 'Ciudad de México', 'México', '+52 55 1234 5678', '10:00', '22:30', NULL),
(5, 'Ristorante Italiano', 'Via Roma 789', 'Roma', 'Italia', '+39 06 1234567', '12:00', '23:30', NULL);

INSERT INTO Tipos_Comidas VALUES
(1, 'Italiana', 'Platos de cocina italiana como pasta y pizza', 1),
(2, 'Francesa', 'Platos de cocina francesa como croissants y ratatouille', 2),
(3, 'Japonesa', 'Platos de cocina japonesa como sushi y tempura', 3),
(4, 'Mexicana', 'Platos de cocina mexicana como tacos y enchiladas', 4),
(5, 'Mediterránea', 'Platos de cocina mediterránea como paella y tzatziki', 5);

INSERT INTO Menus VALUES
(1, 1, 'Menú Degustación Italiano'),
(2, 2, 'Menu du Jour'),
(3, 3, 'Sushi Platter'),
(4, 4, 'Menú Mexicano Especial'),
(5, 5, 'Menu Mediterráneo');

INSERT INTO Platos VALUES
(1, 1, 'Pasta al pesto con tomates cherry.', 'Pasta al Pesto', 12.99),
(2, 1, 'Pizza napolitana con mozzarella fresca y tomate.', 'Pizza Napolitana', 14.50),
(3, 2, 'Sopa de cebolla gratinada con queso Gruyère.', 'Soupe àl\oignon', 9.75),
(4, 3, 'Selección de sushi de nigiri, maki y sashimi', 'Sushi Variado', 18.99),
(5, 4, 'Tacos de carnitas con guacamole y salsa de tomate', 'Tacos de Carnitas', 10.25),
(6, 5, 'Paella marinera con gambas, mejillones y calamares', 'Paella Marinera', 20.99),
(7, 1, 'Lasaña casera con carne molida y salsa de tomate.', 'Lasaña', 15.75),
(8, 2, 'Filete de salmón a la parrilla con puré de patatas.', 'Salmón a la Parrilla', 22.50),
(9, 3, 'Bol de ramen con fideos, huevo y cerdo al estilo japonés.', 'Ramen', 14.99),
(10, 4, 'Quesadillas de pollo con queso derretido y salsa picante.', 'Quesadillas de Pollo', 11.50);


INSERT INTO Clientes
VALUES
(1, 'Juan Perez', 'Calle Principal 123', 'Madrid', 'España', '+34 123 456 789', 'juan@gmail.com'),
(2, 'Maria Garcia', 'Rua do Comercio 456', 'Lisboa', 'Portugal', '+351 987 654 321', 'maria@hotmail.com'),
(3, 'John Smith', '123 Main Street', 'New York', 'USA', '+1 123-456-7890', 'john@gmail.com'),
(4, 'Sophie Martin', 'Rue de la Paix 789', 'Paris', 'France', '+33 6 12 34 56 78', 'sophie@gmail.com'),
(5, 'Luis Hernandez', 'Av. Revolucion 321', 'Mexico City', 'Mexico', '+52 55 9876 5432', 'luis@hotmail.com');

INSERT INTO Pedidos VALUES
(1, 'Delivery', '2024-04-03', '13:00', 'En preparación', 45.75, 1, 1),
(2, 'Para llevar', '2024-04-04', '19:30', 'Entregado', 32.50, 2, 2),
(3, 'Mesa', '2024-04-05', '20:00', 'En camino', 78.99, 3, 3),
(4, 'Delivery', '2024-04-06', '14:45', 'Entregado', 55.25, 4, 4),
(5, 'Mesa', '2024-04-07', '21:15', 'En espera', 67.80, 5, 5);

INSERT INTO Reservas VALUES
(1, '2024-04-08', '19:00', 4, 1, 1),
(2, '2024-04-09', '20:30', 2, 2, 2),
(3, '2024-04-10', '18:00', 6, 3, 3),
(4, '2024-04-11', '19:45', 3, 4, 4),
(5, '2024-04-12', '21:00', 5, 5, 5);*/
 

 ----CONSULTAS

 --Cuáles son los restaurantes que ofrecen cocina italiana?
	/*	SELECT  R.Nombre, TC.Nombre
		FROM Restaurantes R
		JOIN Tipos_Comidas TC 
			ON R.Id_Restaurante = TC.Id_Restaurante
		WHERE TC.Nombre like '%Italiana%'; */

--Cuántos pedidos se han realizado en un restaurante determinado? 
	/*SELECT R.Nombre AS 'Nombre del Restaurante', 
       COUNT(Pedidos.Id_Pedido) AS 'Cantidad de Pedidos'
	FROM Pedidos
	JOIN Restaurantes R ON Pedidos.Id_Restaurante = R.Id_Restaurante
	GROUP BY R.Nombre;*/

--¿Cuántas reservas se han realizado en una fecha determinada? 
	/*SELECT COUNT(*) AS 'Cantidad de Reservas'
	FROM Reservas
	WHERE Fecha like '%2024-04-08%';*/

--crea una consulta que muestre la información de los restaurantes, sus menús y platos, los pedidos realizados y las reservas realizadas por los clientes. 
	/*SELECT R.Nombre AS 'Nombre del Restaurante', 
       M.Nombre AS 'Nombre del Menú', 
       P.Nombre AS 'Nombre del Plato', 
       Pedidos.Tipo_Pedido AS 'Tipo de Pedido', 
       Reservas.Fecha AS 'Fecha de Reserva', 
       Reservas.Hora AS 'Hora de Reserva'
	FROM Restaurantes R
	JOIN Menus M ON R.Id_Restaurante = M.Id_Restaurante
	JOIN Platos P ON M.Id_Menu = P.Id_Menu
	LEFT JOIN Pedidos ON R.Id_Restaurante = Pedidos.Id_Restaurante
	LEFT JOIN Reservas ON R.Id_Restaurante = Reservas.Id_Restaurante;*/
 