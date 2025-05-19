-- Autores: Garcia Monjaraz Jessica Stephanie
-- Eduardo Yael Jiménez Sánchez.
-- Fecha de entrega: 18/05/2025
-- Curso Prebecario: Base de Datos 25-1


-- Insertar sucursales
INSERT INTO Sucursal VALUES
(1, 'Ciudad de México', 2010), (2, 'Guadalajara', 2012), (3, 'Monterrey', 2015),
(4, 'Puebla', 2013), (5, 'Querétaro', 2018), (6, 'León', 2017), (7, 'Toluca', 2011),
(8, 'Mérida', 2016), (9, 'Cancún', 2020), (10, 'Tijuana', 2014);

select * from Sucursal;

-- Insertar empleados
INSERT INTO Empleado VALUES
(101, 'Luis', 'Ramírez', 'López', '2020-01-10', NULL, 1),
(102, 'Ana', 'Gómez', 'Sánchez', '2019-03-15', 101, 2),
(103, 'Carlos', 'Hernández', 'Pérez', '2018-06-20', 101, 3),
(104, 'María', 'Martínez', 'Ruiz', '2021-08-01', 102, 4),
(105, 'José', 'Díaz', 'García', '2017-09-12', NULL, 5),
(106, 'Sofía', 'Torres', 'Mendoza', '2022-02-22', 101, 6),
(107, 'Pedro', 'Morales', 'Flores', '2016-07-03', 105, 7),
(108, 'Lucía', 'Rojas', 'Castillo', '2015-11-17', 103, 8),
(109, 'Miguel', 'Ortiz', 'Navarro', '2020-04-09', 104, 9),
(110, 'Elena', 'Vargas', 'Silva', '2019-12-30', NULL, 10);

select * from Empleado;

-- Insertar clientes
INSERT INTO Cliente VALUES
(201, 'Raúl', 'Fernández', 'Romero', 'Calle 1', 1),
(202, 'Daniela', 'Cruz', 'Salinas', 'Calle 2', 2),
(203, 'Alejandro', 'Ramos', 'Ibarra', 'Calle 3', 3),
(204, 'Brenda', 'Aguilar', 'Nava', 'Calle 4', 4),
(205, 'Fernando', 'Reyes', 'Domínguez', 'Calle 5', 5),
(206, 'Verónica', 'Molina', 'Zapata', 'Calle 6', 6),
(207, 'Jorge', 'Paredes', 'Mejía', 'Calle 7', 7),
(208, 'Patricia', 'Luna', 'Camacho', 'Calle 8', 8),
(209, 'Ricardo', 'Carrillo', 'Solís', 'Calle 9', 9),
(210, 'Claudia', 'Peña', 'Delgado', 'Calle 10', 10);

select * from Cliente;

-- Insertar cuentas
INSERT INTO Cuenta VALUES
(3001, 'Ahorro', 5000.00, 201),
(3002, 'Corriente', 8000.00, 202),
(3003, 'Ahorro', 7000.00, 203),
(3004, 'Corriente', 6500.00, 204),
(3005, 'Ahorro', 10000.00, 205),
(3006, 'Corriente', 9000.00, 206),
(3007, 'Ahorro', 4000.00, 207),
(3008, 'Corriente', 11000.00, 208),
(3009, 'Ahorro', 3000.00, 209),
(3010, 'Corriente', 9500.00, 210);

select * from Cuenta;

-- Insertar cuentas ahorro
INSERT INTO CuentaAhorro VALUES
(3001, 2.5, 12), (3003, 3.0, 24), (3005, 2.0, 6),
(3007, 1.8, 12), (3009, 2.2, 18);

select * from CuentaAhorro;

-- Insertar cuentas corriente
INSERT INTO CuentaCorriente VALUES
(3002, 'CHQ-001', 1500.00, 102),
(3004, 'CHQ-002', 2000.00, 104),
(3006, 'CHQ-003', 1000.00, 105),
(3008, 'CHQ-004', 2500.00, 106),
(3010, 'CHQ-005', 3000.00, 103);

select * from CuentaCorriente;

-- Insertar préstamos
INSERT INTO Prestamo VALUES
(4001, '2023-01-10', 1, 10000.00, 12, 201),
(4002, '2023-02-15', 0, 15000.00, 24, 202),
(4003, '2023-03-20', 1, 8000.00, 6, 203),
(4004, '2023-04-25', 0, 12000.00, 12, 204),
(4005, '2023-05-30', 1, 9500.00, 6, 205),
(4006, '2023-06-05', 0, 7000.00, 12, 206),
(4007, '2023-07-10', 1, 6000.00, 6, 207),
(4008, '2023-08-15', 0, 11000.00, 24, 208),
(4009, '2023-09-20', 1, 13000.00, 12, 209),
(4010, '2023-10-25', 0, 10500.00, 6, 210);

select * from Prestamo;

-- Insertar pagos
INSERT INTO Pago VALUES
(501, 1, 1000.00, 4001), (502, 2, 1000.00, 4001), (503, 1, 1250.00, 4002),
(504, 1, 800.00, 4003), (505, 1, 1200.00, 4004), (506, 2, 1200.00, 4004),
(507, 1, 950.00, 4005), (508, 1, 700.00, 4006), (509, 1, 600.00, 4007),
(510, 1, 1100.00, 4008);

select * from pago;

-- Insertar inversiones
INSERT INTO Inversion VALUES
(6001, 50000.00, 12, 5.5, 'Deuda Pública', 201),
(6002, 40000.00, 6, 4.0, 'Bolsa', 202),
(6003, 70000.00, 24, 6.2, 'Activos Banco', 203),
(6004, 30000.00, 12, 5.1, 'Deuda Pública', 204),
(6005, 60000.00, 6, 4.5, 'Bolsa', 205),
(6006, 45000.00, 18, 5.9, 'Activos Banco', 206),
(6007, 52000.00, 12, 6.0, 'Bolsa', 207),
(6008, 48000.00, 6, 4.7, 'Deuda Pública', 208),
(6009, 55000.00, 12, 5.3, 'Activos Banco', 209),
(6010, 39000.00, 6, 4.8, 'Bolsa', 210);

select * from Inversion;

-- Inversiones específicas
INSERT INTO InversionDeuda VALUES
(6001, 'México', 'MXN'), (6004, 'EE.UU.', 'USD'), (6008, 'Brasil', 'BRL');

select * from InversionDeuda;

INSERT INTO InversionBolsa VALUES
(6002, 'S&P 500', 'Fondo Alfa'), (6005, 'NASDAQ', 'Fondo Beta'), (6007, 'Bovespa', 'Fondo Gamma'), (6010, 'IPC', 'Fondo Delta');

select * from InversionBolsa;

INSERT INTO InversionActivosBanco VALUES
(6003), (6006), (6009);

select * from InversionActivosBanco;

-- Transacciones
INSERT INTO Transaccion VALUES
(7001, 'Compra', 'Bancomer', '2024-01-01', '10:00:00', 6001),
(7002, 'Venta', 'Banorte', '2024-01-02', '11:00:00', 6002),
(7003, 'Compra', 'Santander', '2024-01-03', '12:00:00', 6003),
(7004, 'Venta', 'HSBC', '2024-01-04', '13:00:00', 6004),
(7005, 'Compra', 'Scotiabank', '2024-01-05', '14:00:00', 6005),
(7006, 'Venta', 'Banamex', '2024-01-06', '15:00:00', 6006),
(7007, 'Compra', 'BBVA', '2024-01-07', '16:00:00', 6007),
(7008, 'Venta', 'Banregio', '2024-01-08', '17:00:00', 6008),
(7009, 'Compra', 'Banco Azteca', '2024-01-09', '18:00:00', 6009),
(7010, 'Venta', 'Inbursa', '2024-01-10', '19:00:00', 6010);

select * from Transaccion;

-- Auditores
INSERT INTO Auditor VALUES
(801, '123456', 'Gabriel', 'Santos', 'López'),
(802, '789012', 'Norma', 'Vega', 'Moreno'),
(803, '345678', 'Andrés', 'León', 'Torres'),
(804, '901234', 'Rocío', 'Palma', 'Díaz'),
(805, '567890', 'Héctor', 'Mejía', 'Fuentes'),
(806, '112233', 'Laura', 'Silva', 'Campos'),
(807, '445566', 'Esteban', 'Cano', 'Ortiz'),
(808, '778899', 'Paola', 'Méndez', 'Lara'),
(809, '990011', 'Iván', 'Guzmán', 'Estrada'),
(810, '223344', 'Carmen', 'Salas', 'Luna');

select * from Auditor;

-- Auditorías
INSERT INTO Auditoria VALUES
(901, 6001, 801), (902, 6002, 802), (903, 6003, 803), (904, 6004, 804), (905, 6005, 805),
(906, 6006, 806), (907, 6007, 807), (908, 6008, 808), (909, 6009, 809), (910, 6010, 810);

select * from Auditoria;

-- 1. UPDATE: Cambiar la ciudad de la sucursal 9
UPDATE Sucursal SET ubicacion = 'Playa del Carmen' WHERE idSucursal = 9;

select * from Sucursal;

-- 2. UPDATE: Aumentar el saldo de la cuenta 3005 en 2000
UPDATE Cuenta SET saldo = saldo + 2000 WHERE idCuenta = 3005;

select * from cuenta;

-- 3. UPDATE: Cambiar el nombre del cliente 207
UPDATE Cliente SET nombres = 'Joaquín' WHERE idCliente = 207;

select * from cliente;

-- 4. DELETE: Eliminar el préstamo con ID 4007
-- Verifica si hay pagos relacionados al préstamo
DELETE FROM pago WHERE idPrestamo = 4007;

-- Luego elimina el préstamo
DELETE FROM Prestamo WHERE idPrestamo = 4007;

-- Confirmar que se eliminó
SELECT * FROM Prestamo;

-- 5. DELETE: Eliminar la inversión 6008

--  Eliminar registros de Transaccion ligados a la inversión
DELETE FROM Transaccion WHERE CodigoInversion = 6008;

--  Eliminar registros de InversionDeuda ligados a la inversión
DELETE FROM InversionDeuda WHERE CodigoInversion = 6008;

--  Eliminar registros de Auditoria ligados a la inversión
DELETE FROM Auditoria WHERE CodigoInversion = 6008;

--  Eliminar registros de Inversion (ya sin dependencias)
DELETE FROM Inversion WHERE CodigoInversion = 6008;

-- Verificación opcional
SELECT * FROM Inversion;


-- 6. DELETE: Eliminar al auditor con ID 810
--  Eliminar registros de Auditoria ligados al auditor
DELETE FROM Auditoria WHERE idAuditor = 810;

--  Eliminar registro del auditor
DELETE FROM Auditor WHERE idAuditor = 810;

-- Verificación opcional
SELECT * FROM Auditor ;

-- 7. RENAME: Renombrar la tabla Cliente a ClienteBanco
EXEC sp_rename 'Cliente', 'ClienteBanco';

select * from clientebanco;

-- 8. RENAME: Renombrar la columna 'saldo' de Cuenta a 'monto'
EXEC sp_rename 'Cuenta.saldoinicial', 'monto', 'COLUMN';

select * from Cuenta;

-- 9. DROP: Eliminar la tabla InversionActivosBanco
DROP TABLE InversionActivosBanco;

select * from InversionActivosBanco;

-- 10. DROP: Eliminar la tabla auditor
DROP TABLE Auditor;

select * from auditor;
