CREATE DATABASE Optica;

CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion_calle VARCHAR(255),
    direccion_numero VARCHAR(10),
    direccion_piso VARCHAR(10),
    direccion_puerta VARCHAR(10),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(10),
    pais VARCHAR(50),
    telefono VARCHAR(20),
    fax VARCHAR(20),
    nif VARCHAR(20)
);
CREATE TABLE Gafas (
    gafa_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    marca VARCHAR(50),
    graduacion_izquierda FLOAT,
    graduacion_derecha FLOAT,
    tipo_montura VARCHAR(20),
    color_montura VARCHAR(20),
    color_vidrio_izquierdo VARCHAR(20),
    color_vidrio_derecho VARCHAR(20),
    precio DECIMAL(10, 2),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion_postal VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100),
    fecha_registro DATE
);
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);
CREATE TABLE Compras (
    compra_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    gafa_id INT,
    empleado_id INT,
    fecha_compra DATE,
    recomendado_por INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (gafa_id) REFERENCES Gafas(gafa_id),
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (recomendado_por) REFERENCES Clientes(cliente_id)
);
