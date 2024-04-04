USE RESTAURANTES

CREATE TABLE Restaurantess (
    id_restaurante INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    horario_apertura VARCHAR(50) NOT NULL,
    horario_cierre VARCHAR(50) NOT NULL,
    imagen IMAGE NOT NULL
);

CREATE TABLE Cocina (
    id_tipo_cocina INT NOT NULL PRIMARY KEY,
    id_restaurante INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante)
);

CREATE TABLE Platos (
    id_plato INT NOT NULL PRIMARY KEY,
    id_restaurante INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante)
);

CREATE TABLE Menu (
    id_menu INT NOT NULL PRIMARY KEY,
    id_restaurante INT NOT NULL,
    id_plato INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante),
    FOREIGN KEY (id_plato) REFERENCES Platos(id_plato)
);

CREATE TABLE Pedido (
    id_pedido INT NOT NULL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_restaurante INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    tipo_pedido VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    precio_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante)
);

CREATE TABLE Clientes (
    id_cliente INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL
);

CREATE TABLE Reservas (
    id_reserva INT NOT NULL PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    numero_personas INT NOT NULL,
    id_restaurante INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante)
);

CREATE TABLE Restaurantes_menu (
    id_restaurante INT,
    id_menu INT,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante),
    FOREIGN KEY (id_menu) REFERENCES Menu(id_menu),
    PRIMARY KEY (id_restaurante, id_menu)
);

CREATE TABLE Restaurantes_reservas (
    id_restaurante INT,
    id_reserva INT,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante),
    FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva),
    PRIMARY KEY (id_restaurante, id_reserva)
);

CREATE TABLE Restaurantes_clientes (
    id_restaurante INT,
    id_cliente INT,
    FOREIGN KEY (id_restaurante) REFERENCES Restaurantess(id_restaurante),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    PRIMARY KEY (id_restaurante, id_cliente)
);

CREATE TABLE plato_pedidos (
    id_plato INT,
    id_pedido INT,
    FOREIGN KEY (id_plato) REFERENCES Platos(id_plato),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    PRIMARY KEY (id_plato, id_pedido)
);

CREATE TABLE plato_clientes (
    id_plato INT,
    id_cliente INT,
    FOREIGN KEY (id_plato) REFERENCES Platos(id_plato),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    PRIMARY KEY (id_plato, id_cliente)
);

CREATE TABLE clientes_pedidos (
    id_cliente INT,
    id_pedido INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    PRIMARY KEY (id_pedido, id_cliente)
);

INSERT INTO Restaurantess (id_restaurante, nombre, direccion, ciudad, pais, telefono, horario_apertura, horario_cierre, imagen) VALUES
(1, 'Alzan', 'CLL 12 CRR21 89-34', 'MEDELLIN', 'COLOMBIA', '3897564321', '7:30', '20:00', NULL),
(2, 'Kokorico', 'CLL 34 CRR 37 46-31', 'PEREIRA', 'COLOMBIA', '3897564322', '7:30', '20:00', NULL),
(3, 'Parrila', 'CLL 23 CRR 78 67-32', 'CALI', 'COLOMBIA', '3897564323', '7:30', '20:00', NULL),
(4, 'Hyyi', 'CLL 1 CRR 11 89-52', 'BOGOTA', 'COLOMBIA', '3897564324', '7:30', '20:00', NULL);


INSERT INTO Cocina (id_tipo_cocina, id_restaurante, nombre, descripcion) VALUES
(1, 1, 'Pastas', 'Pastas con una rica salsa a la bolognesa'),
(2, 1, 'Postre de chocolate', 'masa de cacao y azúcar'),
(3, 1, 'Entradas empanaditas', 'harina de maíz amarillo, aceite, agua, color y sal'),
(4, 1, 'Solomito', 'El Solomito a la Parrilla es un plato exquisito que combina la ternura y el sabor único de este corte premium de carne de res. Preparado a la parrilla para obtener un exterior ligeramente crujiente y un interior jugoso y tierno'),
(5, 2, 'Paella Marinera', 'Un plato tradicional español cargado de sabor, con arroz bomba cocido lentamente en un caldo de mariscos, mezclado con camarones, calamares, mejillones y pimientos'),
(6, 2, 'Lasaña de Carne', 'Capas de pasta al horno rellenas de una jugosa mezcla de carne de res, salsa de tomate, queso ricotta y mozzarella, coronadas con más queso derretido'),
(7, 2, 'Sushi Variado', 'Una selección de rollos de sushi frescos y deliciosos, que incluye nigiri, sashimi y rollos especiales como el California Roll y el Dragon Roll, servidos con salsa de soja y wasabi'),
(8, 2, 'Risotto de Hongos', 'Arroz arborio cocido lentamente en caldo de vegetales, mezclado con una variedad de hongos silvestres, vino blanco y queso parmesano, creando un plato cremoso y reconfortante'),
(9, 3, 'Camarones al Ajillo', 'Camarones jumbo salteados en aceite de oliva con ajo picado, chiles rojos triturados y perejil fresco, servidos con sartén crujiente para mojar en la deliciosa salsa'),
(10, 3, 'Burrito de Carne Asada', 'Un burrito grande relleno de tierna carne de res asada, arroz, frijoles, queso, guacamole, crema agria y salsa de tomate, todo envuelto en una tortilla de harina y servido con salsa picante'),
(11, 3, 'Pasta Alfredo con Pollo', 'Tallarines de pasta cocidos al dente, cubiertos con una salsa cremosa Alfredo hecha con mantequilla, nata, ajo y queso parmesano rallado, todo ello coronado con trozos tiernos de pollo a la parrilla.'),
(12, 3, 'Tacos de Pescado', 'Filetes de pescado blanco marinados en especias y jugo de limón, cocidos a la parrilla y servidos en tortillas de maíz calientes, acompañados de repollo rallado, salsa de aguacate y limón'),
(13, 4, 'spaguettis en queso', 'atún, queso mozzarella, salchicha ranchera, crema de leche'),
(14, 4, 'Macarrones especiales', 'crema de leche, mayonesa, queso mozzarella'),
(15, 4, 'Sushi Variado', 'Una selección de rollos de sushi frescos y deliciosos, que incluye nigiri, sashimi y rollos especiales como el California Roll y el Dragon Roll, servidos con salsa de soja y wasabi'),
(16, 4, 'Risotto de Hongos', 'Arroz arborio cocido lentamente en caldo de vegetales, mezclado con una variedad de hongos silvestres, vino blanco y queso parmesano, creando un plato cremoso y reconfortante');


INSERT INTO Platos (id_plato, id_restaurante, nombre, descripcion, precio) VALUES
(1, 1, 'Pastas', 'Pastas con una rica salsa a la bolognesa', '18.500'),
(2, 1, 'Postre de chocolate', 'masa de cacao y azúcar', '7.000'),
(3, 1, 'Entradas empanaditas', 'harina de maíz amarillo, aceite, agua, color y sal', '8.900'),
(4, 1, 'Solomito', 'El Solomito a la Parrilla es un plato exquisito que combina la ternura y el sabor único de este corte premium de carne de res. Preparado a la parrilla para obtener un exterior ligeramente crujiente y un interior jugoso y tierno', '20.500'),
(5, 2, 'Paella Marinera', 'Un plato tradicional español cargado de sabor, con arroz bomba cocido lentamente en un caldo de mariscos, mezclado con camarones, calamares, mejillones y pimientos', '45.000'),
(6, 2, 'Lasaña de Carne', 'Capas de pasta al horno rellenas de una jugosa mezcla de carne de res, salsa de tomate, queso ricotta y mozzarella, coronadas con más queso derretido', '35.000'),
(7, 2, 'Sushi Variado', 'Una selección de rollos de sushi frescos y deliciosos, que incluye nigiri, sashimi y rollos especiales como el California Roll y el Dragon Roll, servidos con salsa de soja y wasabi', '60.000'),
(8, 2, 'Risotto de Hongos', 'Arroz arborio cocido lentamente en caldo de vegetales, mezclado con una variedad de hongos silvestres, vino blanco y queso parmesano, creando un plato cremoso y reconfortante', '40.000'),
(9, 3, 'Camarones al Ajillo', 'Camarones jumbo salteados en aceite de oliva con ajo picado, chiles rojos triturados y perejil fresco, servidos con sartén crujiente para mojar en la deliciosa salsa', '50.000'),
(10, 3, 'Burrito de Carne Asada', 'Un burrito grande relleno de tierna carne de res asada, arroz, frijoles, queso, guacamole, crema agria y salsa de tomate, todo envuelto en una tortilla de harina y servido con salsa picante', '30.000'),
(11, 3, 'Pasta Alfredo con Pollo', 'Tallarines de pasta cocidos al dente, cubiertos con una salsa cremosa Alfredo hecha con mantequilla, nata, ajo y queso parmesano rallado, todo ello coronado con trozos tiernos de pollo a la parrilla.', '35.000'),
(12, 3, 'Tacos de Pescado', 'Filetes de pescado blanco marinados en especias y jugo de limón, cocidos a la parrilla y servidos en tortillas de maíz calientes, acompañados de repollo rallado, salsa de aguacate y limón', '40.000'),
(13, 4, 'spaguettis en queso', 'atún, queso mozzarella, salchicha ranchera, crema de leche', '15.000'),
(14, 4, 'Macarrones especiales', 'crema de leche, mayonesa, queso mozzarella', '10.500'),
(15, 4, 'Sushi Variado', 'Una selección de rollos de sushi frescos y deliciosos, que incluye nigiri, sashimi y rollos especiales como el California Roll y el Dragon Roll, servidos con salsa de soja y wasabi', '60.000'),
(16, 4, 'Risotto de Hongos', 'Arroz arborio cocido lentamente en caldo de vegetales, mezclado con una variedad de hongos silvestres, vino blanco y queso parmesano, creando un plato cremoso y reconfortante', '40.000');


INSERT INTO Pedido (id_pedido, id_cliente, id_restaurante, fecha, hora, tipo_pedido, estado, precio_total, restaurante_id) VALUES
(1, 1, 1, '03/04/2024', '9:20', 'entrega', 'preparacion', '$19000', 1),
(2, 6, 2, '03/04/2024', '10:30', 'domicilio', 'enviado', '$32000', 3),
(3, 5, 3, '03/04/2024', '10:40', 'domicilio', 'enviado', '$45000', 2),
(4, 6, 4, '03/04/2024', '11:20', 'llevar', 'entregado', '$9000', 1),
(5, 7, 1, '03/04/2024', '12:30', 'llevar', 'entregado', '$15000', 4),
(6, 6, 2, '03/04/2024', '12:45', 'entrega', 'preparación', '$17000', 4),
(7, 1, 3, '03/04/2024', '13:20', 'domicilio', 'enviado', '$38000', 2),
(8, 1, 4, '03/04/2024', '13:30', 'entrega', 'preparación', '$20000', 3);


INSERT INTO Clientes (id_cliente, nombre, direccion, ciudad, pais, telefono, correo_electronico) VALUES
(1, 'Yesenia', '123 Calle Principal Ciudad Aleatoria', 'Cartagena', 'Colombia', '3157894567', 'aleatorio1234@gmail.com'),
(2, 'Jeison', '456 Avenida Central Pueblo Imaginario', 'Manizales', 'Colombia', '3006541234', 'correo.aleatorio789@gmail.com'),
(3, 'Samuel', '789 Carretera Secundaria, Villa Ficticia', 'Medellín', 'Colombia', '3006541234', 'usuarioaleat123@gmail.com'),
(4, 'Julian', '321 Camino Real Pueblo Irreal', 'Bogotá', 'Colombia', '3201237895', 'aleat.correo456@gmail.com'),
(5, 'Juan', '654 Callejón Mágico Ciudad de los Sueños', 'Pereira', 'Colombia', '3012345678', 'correoaleatorio987@gmail.com'),
(6, 'Jose', '987 Boulevard Desconocido Aldea Misteriosa', 'Cali', 'Colombia', '3188765432', 'aleatorio.email23@gmail.com'),
(7, 'Ignacio', '234 Ruta Misteriosa Colonia Fantástica', 'Barrancabermeja', 'Colombia', '3045678901', 'correoaleat789@gmail.com'),
(8, 'Alfredo', '876 Avenida Imaginaria Pueblo Soñador', 'Barranquilla', 'Colombia', '3196789012', 'usuario.aleatorio456@gmail.com'),
(9, 'Raul', '543 Camino Encantado Ciudad Encantadora', 'Medellín', 'Colombia', '3178902345', 'correo1234aleat@gmail.com'),
(10, 'Joaquin', '210 Calle de la Imaginación Pueblo Ilusorio', 'Bogotá', 'Colombia', '3223456789', 'aleatorio789correo@gmail.com');


INSERT INTO Reservas (id_reserva, id_cliente, fecha_reserva, hora_reserva, numero_personas, id_restaurante) VALUES 
(1, 3, '03/06/2023', '7:00', 3, 3),
(2, 2, '04/09/2023', '5:00', 2, 2),
(3, 7, '12/02/2023', '6:00', 2, 2),
(4, 8, '08/09/2023', '6:00', 4, 3),
(5, 9, '30/12/2023', '6:00', 5, 1),
(6, 3, '04/06/2023', '7:00', 1, 2),
(7, 5, '23/04/2023', '7:15', 2, 3),
(8, 7, '08/01/2023', '5:30', 2, 2),
(9, 2, '11/10/2023', '7:00', 4, 1),
(10, 1, '03/11/2023', '7:00', 4, 4),
(11, 7, '12/03/2023', '3:00', 4, 2),
(12, 2, '01/06/2023', '18:00', 4, 4),
(13, 7, '05/07/2023', '19:00', 4, 3),
(14, 8, '30/03/2023', '17:00', 4, 2),
(15, 10, '05/02/2023', '18:00', 4, 2),
(16, 1, '25/05/2023', '18:30', 4, 1);

INSERT INTO Menu (id_menu, id_restaurante, id_plato, nombre, descripcion) VALUES
(1, 1, 1, 'Menu de Pastas', 'Variedad de pastas caseras con diferentes salsas'),
(2, 1, 2, 'Postres', 'Selección de deliciosos postres caseros'),
(3, 1, 3, 'Entradas', 'Variedad de entradas para acompañar tu comida'),
(4, 1, 4, 'Carnes', 'Platos de carne de la mejor calidad'),
(5, 2, 1, 'Menu Español', 'Platos tradicionales españoles'),
(6, 2, 2, 'Platos Italianos', 'Deliciosas opciones de la cocina italiana'),
(7, 2, 3, 'Sushi Variado', 'Variedad de rollos de sushi y sashimi'),
(8, 2, 4, 'Risottos', 'Risottos cremosos con ingredientes frescos'),
(9, 3, 1, 'Mariscos', 'Platos de mariscos frescos y deliciosos'),
(10, 3, 2, 'Comida Mexicana', 'Auténticos sabores mexicanos en cada plato'),
(11, 3, 3, 'Pastas', 'Pasta fresca con salsas caseras'),
(12, 3, 4, 'Platos de Pescado', 'Deliciosos platos de pescado preparados al gusto'),
(13, 4, 1, 'Platos de Pasta', 'Una variedad de pastas italianas'),
(14, 4, 2, 'Platos de Queso', 'Platos con queso en todas sus formas'),
(15, 4, 3, 'Sushi y Sashimi', 'Selección de sushi y sashimi fresco'),
(16, 4, 4, 'Platos de Hongos', 'Platos con hongos frescos y sabrosos');


INSERT INTO Restaurantes_menu (id_restaurante, id_menu) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16); 

--Realiza consultas SQL que respondan a preguntas como: 
--¿Cuáles son los restaurantes que ofrecen cocina italiana? 
SELECT r.nombre
FROM Restaurantess r
INNER JOIN Cocina c ON r.id_restaurante = c.id_restaurante
WHERE c.nombre = 'Pastas';


--¿Cuál es el plato más popular en cada restaurante? 
SELECT r.nombre AS nombre_restaurante, p.nombre AS plato_mas_popular
FROM Restaurantess r
INNER JOIN Pedido pe ON r.id_restaurante = pe.id_restaurante
INNER JOIN plato_pedidos pp ON pe.id_pedido = pp.id_pedido
INNER JOIN Platos p ON pp.id_plato = p.id_plato
WHERE pe.id_restaurante = r.id_restaurante
GROUP BY r.nombre, p.nombre
ORDER BY COUNT(*) DESC;

--¿Cuántos pedidos se han realizado en un restaurante determinado? 
SELECT COUNT(*) AS total_pedidos
FROM Pedido
WHERE id_restaurante = 1;

--¿Cuántas reservas se han realizado en una fecha determinada? 

SELECT COUNT(*) AS total_reservas
FROM Reservas
WHERE fecha_reserva = '2023-06-03';

--Finalmente, crea una consulta que muestre la información de los restaurantes, sus menús y platos, los 
--pedidos realizados y las reservas realizadas por los clientes. 
SELECT r.nombre AS nombre_restaurante, c.nombre AS tipo_cocina, m.nombre AS nombre_menu, p.nombre AS nombre_plato, pe.fecha AS fecha_pedido, res.fecha_reserva, res.hora_reserva, cl.nombre AS nombre_cliente
FROM Restaurantess r
INNER JOIN Cocina c ON r.id_restaurante = c.id_restaurante
INNER JOIN Restaurantes_menu rm ON r.id_restaurante = rm.id_restaurante
INNER JOIN Menu m ON rm.id_menu = m.id_menu
INNER JOIN Platos p ON m.id_plato = p.id_plato
LEFT JOIN Pedido pe ON r.id_restaurante = pe.id_restaurante
LEFT JOIN Clientes cl ON pe.id_cliente = cl.id_cliente
LEFT JOIN Restaurantes_reservas rr ON r.id_restaurante = rr.id_restaurante
LEFT JOIN Reservas res ON rr.id_reserva = res.id_reserva
ORDER BY r.nombre, m.nombre, p.nombre, pe.fecha, res.fecha_reserva;