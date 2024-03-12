CREATE DATABASE Pizzeria;


CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    codigoPostal VARCHAR(5) NOT NULL,
    localidad VARCHAR(255) NOT NULL,
    provincia VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);


CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    fechaHora DATETIME NOT NULL,
    tipoPedido VARCHAR(10) NOT NULL, 
    cantidadProductos INT NOT NULL,
    precioTotal DECIMAL(10,2) NOT NULL,
    idCliente INT NOT NULL,
    idTienda INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idTienda) REFERENCES Tienda(idTienda)
);


CREATE TABLE Producto (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    tipoProducto VARCHAR(10) NOT NULL, 
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    imagen VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL
);


CREATE TABLE Pizza (
    idPizza INT PRIMARY KEY AUTO_INCREMENT,
    idCategoria INT NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Categoria (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Tienda (
    idTienda INT PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(255) NOT NULL,
    codigoPostal VARCHAR(5) NOT NULL,
    localidad VARCHAR(255) NOT NULL,
    provincia VARCHAR(255) NOT NULL
);

CREATE TABLE Empleado (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    NIF VARCHAR(10) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipoEmpleado VARCHAR(10) NOT NULL, 
    idTienda INT NOT NULL,
    FOREIGN KEY (idTienda) REFERENCES Tienda(idTienda)
);

CREATE TABLE Reparto (
    idPedido INT NOT NULL,
    idEmpleado INT NOT NULL,
    fechaHoraEntrega DATETIME,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)
);