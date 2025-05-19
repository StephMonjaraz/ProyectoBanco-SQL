-- Autores: Garcia Monjaraz Jessica Stephanie
-- Eduardo Yael Jiménez Sánchez.
-- Fecha de entrega: 18/05/2025
-- Curso Prebecario: Base de Datos 25-1


-- 1. Empleados con su jefe (usando subconsulta para el nombre del jefe)***
SELECT e.IDEmpleado, e.nombres, e.apellidoPaterno, e.apellidoMaterno,
       (SELECT CONCAT(j.nombres, ' ', j.apellidoPaterno)
        FROM Empleado j WHERE j.IDEmpleado = e.IDJefe) AS nombreJefe
FROM Empleado e;

-- 2. Clientes con la sucursal (subconsulta para sucursal)
SELECT c.IDCliente, c.nombres, c.apellidoPaterno, c.apellidoMaterno,
       (SELECT s.ubicacion FROM Sucursal s WHERE s.IDSucursal = c.IDSucursal) AS ubicacionSucursal
FROM cliente c;

-- 3. Cuentas con cliente (subconsulta para nombre cliente)
SELECT cu.NumeroCuenta, cu.EsUna, cu.saldoinicial,
       (SELECT cl.nombres FROM Cliente cl WHERE cl.IDCliente = cu.IDCliente) AS nombreCliente
FROM Cuenta cu;

-- 4. Préstamos > 100000 con cliente (subconsulta)
SELECT p.IDPrestamo, p.fechaSolicitud, p.montoTotal, p.plazoMeses,
       (SELECT cl.nombres FROM Cliente cl WHERE cl.IDCliente = p.IDCliente) AS nombreCliente
FROM Prestamo p
WHERE p.montoTotal > 10000;

-- 5. Pagos de préstamo IDPrestamo = 4002
SELECT IDPago, numeroPago, montoPago
FROM Pago
WHERE IDPrestamo = 4002;


-- 6. Inversiones Bolsa con cliente (subconsulta para cliente)
SELECT i.CodigoInversion, i.monto, i.plazo, i.GAT,
       (SELECT b.indiceBursatil FROM InversionBolsa b WHERE b.CodigoInversion = i.CodigoInversion) AS indiceBursatil,
       (SELECT b.nombreFondo FROM InversionBolsa b WHERE b.CodigoInversion = i.CodigoInversion) AS nombreFondo,
       (SELECT c.nombres FROM Cliente c WHERE c.IDCliente = i.IDCliente) AS nombreCliente
FROM Inversion i
WHERE i.EsUna = 'Bolsa';

-- 7. Contar empleados por sucursal (agrupando en empleados)
SELECT IDSucursal, COUNT(*) AS totalEmpleados
FROM Empleado
GROUP BY IDSucursal;

-- 8. Cuentas corrientes con asesor (subconsulta para asesor)
SELECT cc.NumeroCuenta, cc.numeroChequera, cc.saldoMin,
       (SELECT e.nombres FROM Empleado e WHERE e.IDEmpleado = cc.IDAsesor) AS nombreAsesor
FROM CuentaCorriente cc;

-- 9. Transacciones con inversión (subconsulta para monto inversión)
SELECT t.IDTransaccion, t.tipo, t.nombreBanco, t.fecha, t.hora,
       (SELECT i.monto FROM Inversion i WHERE i.CodigoInversion = t.CodigoInversion) AS montoInversion,
       (SELECT i.EsUna FROM Inversion i WHERE i.CodigoInversion = t.CodigoInversion) AS tipoInversion
FROM Transaccion t;

-- 10. saldo inicial promedio de las cuentas
SELECT AVG(saldoInicial) AS PromedioSaldoInicial
FROM cuenta;


-- 11. clientes que viven en la calle 1
select nombres, apellidopaterno from Cliente
where direccion = 'calle 1';


-- 12. Préstamos que son primer préstamo (directo)
SELECT p.IDPrestamo, p.fechaSolicitud, p.montoTotal, p.IDCliente, p.siPrimerPrestamo
FROM Prestamo p
WHERE p.siPrimerPrestamo = 1;

-- 13. Inversiones por cliente y tipo (subconsulta para nombre cliente)
SELECT i.CodigoInversion, i.EsUna, i.monto, i.plazo,
       (SELECT c.nombres FROM Cliente c WHERE c.IDCliente = i.IDCliente) AS nombreCliente
FROM Inversion i
ORDER BY nombreCliente;

-- 14. Empleados sin jefe asignado
SELECT IDEmpleado, nombres, apellidoPaterno
FROM Empleado
WHERE IDJefe IS NULL;

-- 15. Detalles de cuentas de ahorro con cliente (subconsulta para cliente)
SELECT ca.NumeroCuenta, ca.interes, ca.duracionPlazo,
       (SELECT cl.nombres FROM Cliente cl
        JOIN Cuenta cu ON cl.IDCliente = cu.IDCliente
        WHERE cu.NumeroCuenta = ca.NumeroCuenta) AS nombreCliente
FROM CuentaAhorro ca;
