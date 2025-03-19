CREATE DATABASE IF NOT EXISTS AutosDB;
USE AutosDB;

-- Tabla de autos
CREATE TABLE autos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    año YEAR NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE,
    direccion TEXT
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_auto INT,
    fecha_venta DATE NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_auto) REFERENCES autos(id_auto) ON DELETE CASCADE
);

-- Tabla de rentas
CREATE TABLE rentas (
    id_renta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_auto INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    precio_total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_auto) REFERENCES autos(id_auto) ON DELETE CASCADE
);

-- Tabla de mantenimiento
CREATE TABLE mantenimiento (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_auto INT,
    descripcion TEXT NOT NULL,
    fecha_mantenimiento DATE NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_auto) REFERENCES autos(id_auto) ON DELETE CASCADE
);
