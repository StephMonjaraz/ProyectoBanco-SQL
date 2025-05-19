-- Autores: Garcia Monjaraz Jessica Stephanie
-- Eduardo Yael Jiménez Sánchez.
-- Fecha de entrega: 18/05/2025
-- Curso Prebecario: Base de Datos 25-1


-- Creación de las tablas.
-- La sintaxis general que usamos:
-- CREATE TABLE nombre_tabla (
--     nombre_columna tipo_dato [restricciones],
--     ...
-- );


-- TABLA: Sucursal -> Clave primaria IDSucursal.
CREATE TABLE Sucursal (
    IDSucursal INT PRIMARY KEY,       
    ubicacion VARCHAR(100) NOT NULL,
    añoApertura INT NOT NULL              
);




-- TABLA: Empleado -> Clave primaria: IDEmpleado. Llaves foráneas: IDJefe e IDSucursal.
-- Sintaxis para llaves foráneas:
-- FOREIGN KEY (columna_relacionada) REFERENCES TablaRelacionada (llave_primaria)
CREATE TABLE Empleado (
    IDEmpleado INT PRIMARY KEY,            
    nombres VARCHAR(100) NOT NULL,        
    apellidoPaterno VARCHAR(50) NOT NULL, 
    apellidoMaterno VARCHAR(50),          
    fechaContratacion DATE NOT NULL,    
    IDJefe INT,                           
    IDSucursal INT NOT NULL,              
    FOREIGN KEY (IDJefe) REFERENCES Empleado(IDEmpleado),      
    FOREIGN KEY (IDSucursal) REFERENCES Sucursal(IDSucursal)   
);




-- TABLA: Cliente -> Clave primaria: IDCliente. Llaves foráneas: IDSucursal.
CREATE TABLE Cliente (
    IDCliente INT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidoPaterno VARCHAR(50) NOT NULL,
    apellidoMaterno VARCHAR(50),
    direccion VARCHAR(150) NOT NULL,
    IDSucursal INT NOT NULL,
    FOREIGN KEY (IDSucursal) REFERENCES Sucursal(IDSucursal)
);





-- TABLA: Cuenta -> Clave primaria: NumeroCuenta. Llaves foráneas: IDCliente.
CREATE TABLE Cuenta (
    NumeroCuenta INT PRIMARY KEY,                                  
	-- Con CHECK restringuimos el tipo de cuenta a los dos valores válidos.
    EsUna VARCHAR(20) CHECK (EsUna IN ('Ahorro', 'Corriente')),    
    saldoInicial DECIMAL(10,2) NOT NULL,                 
    IDCliente INT NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente) -- Vinculamso a  la cuenta con su propietario.
);




-- TABLA: CuentaAhorro -> Clave primaria: NumeroCuenta. Llaves foráneas: NumeroCuenta.
CREATE TABLE CuentaAhorro (
    NumeroCuenta INT PRIMARY KEY,  -- También es su clave foránea y se hereda de Cuenta.
    interes DECIMAL(5,2) NOT NULL, 
    duracionPlazo INT NOT NULL,  -- Duración del plazo de ahorro, en meses o años.
    FOREIGN KEY (NumeroCuenta) REFERENCES Cuenta(NumeroCuenta)
);





-- TABLA: CuentaCorriente -> Clave primaria: NumeroCuenta. Llaves foráneas: NumeroCuenta e IDAsesor
CREATE TABLE CuentaCorriente (
    NumeroCuenta INT PRIMARY KEY,
    numeroChequera VARCHAR(50) NOT NULL,   
    saldoMin DECIMAL(10,2) NOT NULL,       
    IDAsesor INT NOT NULL,   
	-- Clave foránea para conocer que empleado asesora la cuenta.
    FOREIGN KEY (NumeroCuenta) REFERENCES Cuenta(NumeroCuenta),
    FOREIGN KEY (IDAsesor) REFERENCES Empleado(IDEmpleado)
);





-- TABLA: Prestamo -> Clave primaria: IDPrestamo. Llave foránea: IDCliente.
CREATE TABLE Prestamo (
    IDPrestamo INT PRIMARY KEY,
    fechaSolicitud DATE NOT NULL,
    siPrimerPrestamo BIT NOT NULL,    -- booleano 1 = sí, 0 = no.
    montoTotal DECIMAL(10,2) NOT NULL,
	-- Con CHECK restringuimos el plazo del prestamos a los tres valores válidos.
    plazoMeses INT CHECK (plazoMeses IN (6, 12, 24)),-- Plazo limitado.
    IDCliente INT NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);





-- TABLA: Pago -> Clave primaria: IDPago. Llave foránea: IDPrestamo.
CREATE TABLE Pago (
    IDPago INT PRIMARY KEY,
    numeroPago INT NOT NULL,
    montoPago DECIMAL(10,2) NOT NULL,
    IDPrestamo INT NOT NULL,
    FOREIGN KEY (IDPrestamo) REFERENCES Prestamo(IDPrestamo)
);



-- TABLA: Inversion -> Clave primaria: CodigoInversion. Llave foránea: IDCliente.
CREATE TABLE Inversion (
    CodigoInversion INT PRIMARY KEY,
    monto DECIMAL(12,2) NOT NULL,
    plazo INT NOT NULL,
    GAT DECIMAL(5,2) NOT NULL,
	-- Con CHECK restringuimos los 3 posibles tipos de inversiones.
    EsUna VARCHAR(30) CHECK (EsUna IN ('Deuda Pública', 'Bolsa', 'Activos Banco')),
    IDCliente INT NOT NULL,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);




-- TABLA: InversionDeuda -> Clave primaria: CodigoInversion. Llave foránea: CodigoInversion.
CREATE TABLE InversionDeuda (
    CodigoInversion INT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL,
    moneda VARCHAR(20) NOT NULL,
    FOREIGN KEY (CodigoInversion) REFERENCES Inversion(CodigoInversion)
);




-- TABLA: InversionBolsa -> Clave primaria: CodigoInversion. Llave foránea: CodigoInversion.
CREATE TABLE InversionBolsa (
    CodigoInversion INT PRIMARY KEY,
    indiceBursatil VARCHAR(50) NOT NULL,
    nombreFondo VARCHAR(100) NOT NULL,
    FOREIGN KEY (CodigoInversion) REFERENCES Inversion(CodigoInversion)
);



-- TABLA: InversionActivosBanco -> Clave primaria: CodigoInversion. Llave foránea: CodigoInversion.
CREATE TABLE InversionActivosBanco (
    CodigoInversion INT PRIMARY KEY,
    FOREIGN KEY (CodigoInversion) REFERENCES Inversion(CodigoInversion)
);





-- TABLA: Transaccion -> Clave primaria: IDTransaccion. Llave foránea: CodigoInversion.
CREATE TABLE Transaccion (
    IDTransaccion INT PRIMARY KEY,
    tipo VARCHAR(10) CHECK (tipo IN ('Compra', 'Venta')),
    nombreBanco VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CodigoInversion INT NOT NULL,
    FOREIGN KEY (CodigoInversion) REFERENCES Inversion(CodigoInversion)
);


-- TABLA: Auditor  -> Clave primaria: IDAuditor.
CREATE TABLE Auditor (
    IDAuditor INT PRIMARY KEY,
    cedulaProfesional VARCHAR(20) UNIQUE NOT NULL, -- UNIQUE para que podamos eviitar duplicados en esta columna.
    nombres VARCHAR(100) NOT NULL,
    apellidoPaterno VARCHAR(50) NOT NULL,
    apellidoMaterno VARCHAR(50)
);




-- Puntos extra: vistas y secuencias

-- sintaxis para CREATE VIEW

-- Una vista es una tabla virtual que se basa en una consulta, su sintaxis es:
-- CREATE VIEW nombre_vista AS
-- SELECT columnas FROM tabla WHERE condiciones;

-- como puntos extra crearemos VISTA: VistaClientesCuentas
-- en donde mostraremos  el nombre completo del cliente con su número de cuenta y tipo de cuenta.
-- asi que se  construye uniendo la tabla Cliente y la tabla Cuenta.

CREATE VIEW VistaClientesCuentas AS
SELECT 
    c.IDCliente,
    CONCAT(c.nombres, ' ', c.apellidoPaterno, ' ', ISNULL(c.apellidoMaterno, '')) AS nombreCompleto,
    cu.NumeroCuenta,
    cu.EsUna AS tipoCuenta,
    cu.saldoInicial
FROM Cliente c
JOIN Cuenta cu ON c.IDCliente = cu.IDCliente;

-- EJEMPLO DE PRUEBA para la vista 
-- Insertamos una sucursal para poder satisfacer la restricción de clave foránea en Cliente
INSERT INTO Sucursal (IDSucursal, ubicacion, añoApertura)
VALUES (1, 'CDMX', 2020);


-- Inseramos un cliente de prueba
INSERT INTO Cliente (IDCliente, nombres, apellidoPaterno, apellidoMaterno, direccion, IDSucursal)
VALUES (1, 'Ana', 'Hernández', 'Lopez', 'Calle Falsa 123', 1);

-- Insertamos para ese cliete, una cuenta de ahorro 
INSERT INTO Cuenta (NumeroCuenta, EsUna, saldoInicial, IDCliente)
VALUES (100, 'Ahorro', 5000.00, 1);

-- Consulta para probar la vista
SELECT * FROM VistaClientesCuentas;
