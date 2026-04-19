/*
	Asignatura: Bases de datos
	Grupo: 02
	Nombre del proyecto: EcoBici
	Num. Equipo: 6
	Nombre del equipo: Los Primis
	Autor: Rosas Meza Isaías
	Descripción: Incersiones restantes, vistas y disparadores (DML)
*/

USE LosPrimis_EcoBici
GO

-- ########## PARTE 1: Incersión de registros faltantes ordenado por esquemas ########## --

	---- CATALOGO ----

-- catalogo.CAT_FALTA
BEGIN TRANSACTION
	INSERT INTO catalogo.CAT_FALTA (ID_TIPO_FALTA,NOMBRE) VALUES
		(1,'INCAPACIDAD'),
		(2,'PASE DE SALIDA'),
		(3,'DEFUNCION DE UN FAMILIAR'),
		(4,'TRAMITES'),
		(5,'INASISTENCIA'),
		(6,'RETARDO'),
		(7,'DEFUNCION')
	SELECT * FROM catalogo.CAT_FALTA
COMMIT TRANSACTION

-- Eliminamos la falta con ID = 7 porque no nos pareció apropiada
DELETE FROM catalogo.CAT_FALTA WHERE ID_TIPO_FALTA = 7

	---- CLIENTE ----

-- cliente.TARJETA_MOV
BEGIN TRANSACTION
	INSERT INTO cliente.TARJETA_MOV (CODIGO_QR, COSTO_TARJETA, SALDO, ID_USUARIO, REPOSICION) VALUES
		('7630923341655', 50, 50, 1, NULL),
		('7828080082326', 50, 100, 2, NULL),
		('7823600419392', 50, 75, 3, NULL),
		('7483806491407', 50, 25, 4, NULL),
		('7214254335270', 50, 90, 5, NULL),
		('7689376729278', 50, 45, 6, NULL),
		('7827118256784', 50, 60, 7, NULL),
		('7951966568856', 50, 30, 8, NULL),
		('7298005428418', 50, 95, 9, NULL),
		('7691815420307', 50, 105, 10, NULL),

		('7838739121968', 50, 150, 11, NULL),
		('7977214816533', 50, 200, 12, NULL),
		('7428929942795', 50, 275, 13, NULL),
		('7256935271624', 50, 225, 14, NULL),
		('7906624225665', 50, 290, 15, NULL),
		('7040956532055', 50, 345, 16, NULL),
		('7761196989871', 50, 160, 17, NULL),
		('7739210695324', 50, 230, 18, NULL),
		('7817304381697', 50, 195, 19, NULL),
		('7865742531600', 50, 305, 20, NULL),

		('7370609439337', 50, 500, 21, NULL),
		('7238703164207', 50, 1000, 22, NULL),
		('7445312265630', 50, 750, 23, NULL),
		('7892960487064', 50, 700, 24, NULL),
		('7594767112623', 50, 900, 25, NULL),
		('7834814854686', 50, 450, 26, NULL),
		('7341803925392', 50, 650, 27, NULL),
		('7386174664583', 50, 730, 28, NULL),
		('7509340018066', 50, 895, 29, NULL),
		('7803045527556', 50, 1200, 30, NULL)
	SELECT * FROM cliente.TARJETA_MOV
COMMIT TRANSACTION

-- Insertamos un caso de reposición de tarjeta
UPDATE cliente.TARJETA_MOV
SET REPOSICION = '7630923341655', COSTO_TARJETA = 30 WHERE CODIGO_QR = '7630923341655'
SELECT * FROM cliente.TARJETA_MOV


-- cliente.TELEFONO
DBCC CHECKIDENT ('cliente.TELEFONO',NORESEED)
GO

DBCC CHECKIDENT ('cliente.TELEFONO',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO cliente.TELEFONO (NUMERO, ID_USUARIO) VALUES
		(5506396402, 1),
		(5572127430, 2),
		(5528232261, 3),
		(5561925165, 4),
		(5596103700, 5),
		(5590677557, 6),
		(5516147759, 7),
		(5532761547, 8),
		(5511097512, 9),
		(5512943256, 10),

		(5571146352, 11),
		(5556820363, 12),
		(5538870676, 13),
		(5558986356, 14),
		(5595973866, 15),
		(5516438038, 16),
		(5599652476, 17),
		(5500068819, 18),
		(5535131562, 19),
		(5534114479, 20),

		(5582793582, 21),
		(5577434343, 22),
		(5511013337, 23),
		(5568894222, 24),
		(5595065368, 25),
		(5566492655, 26),
		(5595700584, 27),
		(5579095361, 28),
		(5565717278, 29),
		(5548939462, 30),

		(5571829967, 30),
		(5589367420, 20),
		(5566871421, 10)
	SELECT * FROM cliente.TELEFONO
COMMIT TRANSACTION


-- cliente.HISTORICO_MEMBRESIA
DBCC CHECKIDENT ('cliente.HISTORICO_MEMBRESIA',NORESEED)
GO

DBCC CHECKIDENT ('cliente.HISTORICO_MEMBRESIA',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO cliente.HISTORICO_MEMBRESIA (ID_MEMBRESIA, ID_USUARIO, FECHA_INICIO, VIGENCIA, METODO_PAGO, FECHA_CAMBIO) VALUES
		(1, 1, '2024/05/20', '2024/05/21', 'C', NULL),
		(1, 2, '2024/05/20', '2024/05/21', 'C', NULL),
		(1, 3, '2024/05/20', '2024/05/21', 'P', NULL),
		(1, 4, '2024/05/20', '2024/05/21', 'P', NULL),
		(1, 5, '2024/05/20', '2024/05/21', 'P', NULL),
		(1, 6, '2024/05/20', '2024/05/21', 'P', NULL),
		(1, 7, '2024/05/20', '2024/05/21', 'P', NULL),
		(1, 8, '2024/05/20', '2024/05/21', 'C', NULL),
		(1, 9, '2024/05/20', '2024/05/21', 'C', NULL),
		(1, 10, '2024/05/20', '2024/05/21', 'C', NULL),

		(2, 11, '2024/05/20', '2024/06/20', 'P', NULL),
		(2, 12, '2024/05/20', '2024/06/20', 'P', NULL),
		(2, 13, '2024/05/20', '2024/06/20', 'C', NULL),
		(2, 14, '2024/05/20', '2024/06/20', 'C', NULL),
		(2, 15, '2024/05/20', '2024/06/20', 'C', NULL),
		(2, 16, '2024/05/20', '2024/06/20', 'C', NULL),
		(2, 17, '2024/05/20', '2024/06/20', 'P', NULL),
		(2, 18, '2024/05/20', '2024/06/20', 'P', NULL),
		(2, 19, '2024/05/20', '2024/06/20', 'C', NULL),
		(2, 20, '2024/05/20', '2024/06/20', 'C', NULL),

		(3, 21, '2024/05/20', '2025/05/20', 'P', NULL),
		(3, 22, '2024/05/20', '2025/05/20', 'P', NULL),
		(3, 23, '2024/05/20', '2025/05/20', 'C', NULL),
		(3, 24, '2024/05/20', '2025/05/20', 'C', NULL),
		(3, 25, '2024/05/20', '2025/05/20', 'C', NULL),
		(3, 26, '2024/05/20', '2025/05/20', 'P', NULL),
		(3, 27, '2024/05/20', '2025/05/20', 'C', NULL),
		(3, 28, '2024/05/20', '2025/05/20', 'C', NULL),
		(3, 29, '2024/05/20', '2025/05/20', 'C', NULL),
		(3, 30, '2024/05/20', '2025/05/20', 'P', NULL),

		(2, 3, '2024/05/21', '2024/06/21', 'P', '2024/05/21'),
		(2, 4, '2024/05/21', '2024/06/21', 'P', '2024/05/21'),
		(2, 5, '2024/05/21', '2024/06/21', 'P', '2024/05/21'),
		(3, 6, '2024/05/21', '2025/05/21', 'C', '2024/05/21'),
		(3, 7, '2024/05/21', '2025/05/21', 'C', '2024/05/21'),
		(3, 8, '2024/05/21', '2025/05/21', 'C', '2024/05/21'),
		(3, 9, '2024/05/21', '2025/05/21', 'C', '2024/05/21'),
		(3, 10,'2024/05/21', '2025/05/21', 'C', '2024/05/21')

	SELECT * FROM cliente.HISTORICO_MEMBRESIA
COMMIT TRANSACTION

-- Siempre que se haga un cambio al historico debe hacerse un UPDATE a la tabla de cliente.USUARIO
-- En este caso, el UPDATE sería para los clientes que tienen su ID desde el 3 hasta el 10

UPDATE cliente.USUARIO SET ID_MEMBRESIA = 2 WHERE ID_USUARIO = 3
UPDATE cliente.USUARIO SET ID_MEMBRESIA = 2 WHERE ID_USUARIO = 4
UPDATE cliente.USUARIO SET ID_MEMBRESIA = 2 WHERE ID_USUARIO = 5

UPDATE cliente.USUARIO SET ID_MEMBRESIA = 3 WHERE ID_USUARIO = 6
UPDATE cliente.USUARIO SET ID_MEMBRESIA = 3 WHERE ID_USUARIO = 7
UPDATE cliente.USUARIO SET ID_MEMBRESIA = 3 WHERE ID_USUARIO = 8
UPDATE cliente.USUARIO SET ID_MEMBRESIA = 3 WHERE ID_USUARIO = 9
UPDATE cliente.USUARIO SET ID_MEMBRESIA = 3 WHERE ID_USUARIO = 10

-- Comprobamos que se hayan realizado los cambios. Deben haber sólo dos personas con la membresía tipo 1
SELECT ID_USUARIO, NOMBRE, ID_MEMBRESIA FROM cliente.USUARIO


	---- TRABAJADOR ----

-- trabajador.ADMINISTRACION
BEGIN TRANSACTION
	INSERT INTO trabajador.ADMINISTRACION (ID_EMPLEADO, FUNCION) VALUES
		(1,'Administrador, gerente y supervisor'),
		(2,'Administrador de servicios'),
		(6,'Administrador, gerente y supervisor'),
		(7,'Administrador de servicios'),
		(11,'Gestor de estación y servicios'),
		(12,'Gestor de estación y servicios'),
		(14,'Gestor de estación y servicios'),
		(15,'Gestor de estación y servicios')

	SELECT * FROM trabajador.ADMINISTRACION
COMMIT TRANSACTION


-- trabajador.MANTENIMIENTO
BEGIN TRANSACTION
	INSERT INTO trabajador.MANTENIMIENTO (ID_EMPLEADO, TIPO_ESPECIALIDAD) VALUES
		(3,'Administración de sistemas'),
		(8,'Seguridad'),
		(13,'Administración de sistemas'),
		(16,'Seguridad')

	SELECT * FROM trabajador.MANTENIMIENTO
COMMIT TRANSACTION


-- trabajador.IDIOMA
BEGIN TRANSACTION
	INSERT INTO trabajador.IDIOMA (ID_IDIOMA, NOMBRE_IDIOMA, ID_EMPLEADO) VALUES
		(1,'ESPAÑOL', 1),
		(2,'INGLÉS', 1),
		(3,'ESPAÑOL', 2),
		(4,'INGLÉS', 2),
		(5,'ESPAÑOL', 3),
		(6,'ITALIANO', 3),
		(7,'ESPAÑOL', 4),
		(8,'INGLÉS', 4),
		(9,'ESPAÑOL', 5),
		(10,'COREANO', 5),
		(11,'ESPAÑOL', 6),
		(12,'INGLÉS', 6),
		(13,'ESPAÑOL', 7),
		(14,'FRANCÉS', 7),
		(15,'ESPAÑOL', 8),
		(16,'RUSO', 8),
		(17,'ESPAÑOL', 9),
		(18,'ALEMÁN', 9),
		(19,'ESPAÑOL', 10),
		(20,'PORTUGÉS', 10),

		(21,'INGLÉS', 11),
		(22,'ESPAÑOL', 11),
		(23,'INGLÉS', 12),
		(24,'ESPAÑOL', 12),
		(25,'INGLÉS', 13),
		(26,'ESPAÑOL', 13),
		(27,'INGLÉS', 14),
		(28,'ESPAÑOL', 14),
		(29,'INGLÉS', 15),
		(30,'ESPAÑOL', 15),
		(31,'INGLÉS', 16),
		(32,'ESPAÑOL', 16)

	SELECT * FROM trabajador.IDIOMA
COMMIT TRANSACTION


-- trabajador.DIRECCION
BEGIN TRANSACTION
	INSERT INTO trabajador.DIRECCION(ID_EMPLEADO, CALLE, NUM_EXT, ALCALDIA, NUM_INT, COLONIA) VALUES
				(1, 'Roca Negra', '010', 'Coyoacán', '101', 'Universidad'),
				(2, 'Puerta Carmesí', '009', 'Gustavo A. Madero', '102', 'Noble'),
				(3, 'Fuentes Celestes', '008', 'Miguel Hidalgo', '103', 'Juárez'),
				(4, 'Bosque Olivo', '007', 'Tlalpan', '104', 'Girasoles'),
				(5, 'Casas Naranjas', '006', 'Xochimilco', '105', 'Reinoza'),
				(6, 'Diamante Blanco', '005', 'Coyoacán', '106', 'Universidad'),
				(7, 'Murales Rosas', '004', 'Venustiano Carranza', '107', 'Valles'),
				(8, 'Lagunas Azules', '003', 'Iztapalapa', '108', 'Mares'),
				(9, 'Tienda Lima', '002', 'Tláhuac', '109', 'Banderas'),
				(10,'Escudo Amarillo', '001', 'Benito Juárez', '110', 'Minas'),

				(11, 'Valhalla', '011', 'Chorus', '011', 'Azules'),
				(12, 'Valhalla', '011', 'Chorus', '012', 'Azules'),
				(13, 'Valhalla', '011', 'Chorus', '013', 'Azules'),
				(14, 'Valhalla', '012', 'Chorus', '014', 'Rojos'),
				(15, 'Valhalla', '012', 'Chorus', '015', 'Rojos'),
				(16, 'Valhalla', '012', 'Chorus', '016', 'Rojos')

	SELECT * FROM trabajador.DIRECCION
COMMIT TRANSACTION


-- trabajador.REGISTRO_FALTAS
DBCC CHECKIDENT ('trabajador.REGISTRO_FALTAS',NORESEED)
GO

DBCC CHECKIDENT ('trabajador.REGISTRO_FALTAS',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO trabajador.REGISTRO_FALTAS (FECHA, ID_TIPO_FALTA, ID_EMPLEADO) VALUES
		('2024/05/13', 2, 15),
		('2024/05/13', 6, 13),
		('2024/05/17', 1, 7),
		('2024/05/20', 6, 15),
		('2024/05/20', 4, 3),
		('2024/05/24', 3, 9),
		('2024/05/26', 5, 15),
		('2024/05/26', 4, 11),
		('2024/05/27', 6, 14),
		('2024/05/27', 1, 10)

	SELECT * FROM trabajador.REGISTRO_FALTAS
COMMIT TRANSACTION


-- trabajador.HISTORICO_EMPLEADO
DBCC CHECKIDENT ('trabajador.HISTORICO_EMPLEADO',NORESEED)
GO

DBCC CHECKIDENT ('trabajador.HISTORICO_EMPLEADO',RESEED,0)
GO

SELECT* FROM trabajador.EMPLEADO

BEGIN TRANSACTION
	INSERT INTO trabajador.HISTORICO_EMPLEADO(NOMBRE, PATERNO, MATERNO, RFC, FECHA_INICIO, FECHA_FIN, PUESTO, SUELDO, EDAD, ID_EMPLEADO) VALUES
				('JETRO', 'PASTENES', 'AGUILAR','PAAJ011001O13', '2024/05/01', '2025/05/01', 'Supervisor', 22500, 23, 1),
				('ELIAS', 'MARSHALL', 'LEE', 'MALE030902A35','2024/05/05', '2025/05/05', 'Administrador', 13000, 21, 2),
				('SANDRA', 'GONZALES', 'GARCÍA', 'GOGS020803R02', '2024/05/05', '2025/05/05', 'Mantenimiento', 16000, 22, 3),
				('LLOYD', 'BROOKS', 'SHANTEL', 'BRSL010704S07', '2024/05/05', '2024/11/05', 'Agente Auxiliar', 10000, 23, 4),
				('BRIGGETE', 'NASHTEL', 'SUMISU', 'NASB060605S11', '2024/05/05', '2024/11/05', 'Agente Auxiliar', 10000, 18, 5),
				('ALYSON', 'SMITH', 'EVERGREEN', 'SMEA010506A10', '2024/05/01', '2025/05/01', 'Supervisor', 22500, 23, 6),
				('KATHERINE', 'MIRANDA', 'PÉREZ', 'MIPK030407N97', '2024/05/05', '2025/05/05', 'Administrador', 13000, 21, 7),
				('BRIAN', 'ROBLES', 'MARIANO', 'ROMB030308T99', '2024/05/05', '2025/05/05', 'Mantenimiento', 16000, 21, 8),
				('SAMANTHA', 'MADIGAN', 'PRADA', 'MAPS010209V33', '2024/05/05', '2024/11/05', 'Agente Auxiliar', 10000, 23, 9),
				('NOAH', 'MARTÍNEZ', 'ZUÑIGA', 'MAZN050110E67', '2024/05/05', '2024/11/05', 'Agente Auxiliar', 10000, 19, 10),

				('LEONARD', 'CHURCH', 'BLUEONE', 'CHBL860630BL1', '2024/05/10', '2025/05/10', 'Administrador', 13000, 38, 11),
				('LAVERNIUS', 'TUCKER', 'BLUETWO', 'TUBL980629BL2','2024/05/10', '2025/05/10', 'Administrador', 13000, 26, 12),
				('MICHAEL', 'CABOOSE', 'BLUETHREE', 'CABM980628BL3', '2024/05/10', '2025/05/10', 'Mantenimiento', 16000, 26, 13),
				('MARCUS', 'SARGE', 'REDONE', 'SARM640513RD1', '2024/05/10', '2025/05/10', 'Administrador', 13000, 60, 14),
				('DEXTER', 'GRIF', 'REDTWO', 'GRRD940512RD2', '2024/05/10', '2025/05/10', 'Administrador', 13000, 30, 15),
				('DICK', 'SIMMONS', 'REDTHREE', 'SIRD960511RD3', '2024/05/10', '2025/05/10', 'Mantenimiento', 16000, 28, 16)

	SELECT * FROM trabajador.HISTORICO_EMPLEADO
COMMIT TRANSACTION
GO


-- ########## PARTE 2: Creación de vistas ########## --

-- Vista que muestre todos los datos más importantes de los EMPLEADOS (incluido el domicilio, puesto y sueldo)

CREATE VIEW trabajador.visInfoEmpleados AS
SELECT e.ID_EMPLEADO, e.RFC, e.NOMBRE, e.PATERNO, e.MATERNO, e.GENERO, e.ESTADO_CIVIL, e.TELEFONO, 
	   di.ALCALDIA, di.COLONIA, di.CALLE, di.NUM_EXT, di.NUM_INT,
	   e.TIPO_EMPLEADO, he.PUESTO AS PUESTO, he.SUELDO
FROM trabajador.empleado AS e
left join trabajador.DIRECCION AS di ON e.ID_EMPLEADO = di.ID_EMPLEADO
left join trabajador.HISTORICO_EMPLEADO AS he ON e.ID_EMPLEADO = he.ID_EMPLEADO
GO

SELECT * FROM trabajador.visInfoEmpleados
GO

-- Vista que muestre todos los datos más importantes de los CLIENTES (incluir teléfonos, tarjeta asociada y membresía actual)

CREATE VIEW cliente.visInfoClientes AS
SELECT u.ID_USUARIO, U.NOMBRE, u.PATERNO, u.MATERNO, u.GENERO, u.CORREO, u.FECHA_NAC, u.EDAD, tel.NUMERO,
	   u.ID_MEMBRESIA, tm.CODIGO_QR
FROM cliente.USUARIO AS u
left join cliente.TELEFONO AS tel ON u.ID_USUARIO = tel.ID_USUARIO
left join cliente.TARJETA_MOV AS tm ON u.ID_USUARIO = tm.ID_USUARIO
GO

SELECT * FROM cliente.visInfoClientes
GO

-- Vista que muestre todos los datos más importantes de los VIAJES:
-- Fecha, id_viaje, usuario, bicicleta, estacion de partida, hora de salida, estacion destino, hora de llegada, Formulario (si fue el caso)

CREATE VIEW servicio.visInfoViajes AS
SELECT 
    v.FECHA, v.ID_VIAJE, v.ID_USUARIO, v.ID_BICICLETA, 
    EstacionInicio.ID_ESTACION AS ESTACION_PARTIDA, v.HORA_INICIO, 
    EstacionFin.ID_ESTACION AS ESTACION_DESTINO, v.HORA_FIN, 
    v.TARIFA_AD, v.ID_FORMULARIO
FROM 
    servicio.VIAJE AS v
LEFT JOIN 
    servicio.ESTACION_VIAJE AS ev_inicio 
    ON v.ID_VIAJE = ev_inicio.ID_VIAJE AND ev_inicio.INICIO_FIN = 'I'
LEFT JOIN 
    servicio.ESTACION AS EstacionInicio 
    ON ev_inicio.ID_ESTACION = EstacionInicio.ID_ESTACION
LEFT JOIN 
    servicio.ESTACION_VIAJE AS ev_fin 
    ON v.ID_VIAJE = ev_fin.ID_VIAJE AND ev_fin.INICIO_FIN = 'F'
LEFT JOIN 
    servicio.ESTACION AS EstacionFin 
    ON ev_fin.ID_ESTACION = EstacionFin.ID_ESTACION;
GO

SELECT * FROM servicio.visInfoViajes
GO


-- ########## PARTE 3: Disparadores para ciertas consideraciones semánticas ########## --

-- CS6: NULL si no hubo tarifa ad,; $5*cada 10 min si se excedió el tiempo
CREATE TRIGGER TR_UpdateTarifaAD
ON servicio.VIAJE
AFTER INSERT
AS
BEGIN
    DECLARE @ID_VIAJE INT, @ID_USUARIO INT, @FECHA_VIAJE DATE, @ID_MEMBRESIA INT, @FECHA_VIGENCIA DATE, @TIEMPO_EXCEDIDO INT, @TARIFA_AD_ACTUAL MONEY;
    
    -- Obtener la información del nuevo viaje insertado
    SELECT @ID_VIAJE = ID_VIAJE, @ID_USUARIO = ID_USUARIO, @FECHA_VIAJE = FECHA
    FROM inserted;

    -- Verificar si el usuario tiene la ID_MEMBRESIA igual a 1
    SELECT @ID_MEMBRESIA = ID_MEMBRESIA
    FROM cliente.USUARIO
    WHERE ID_USUARIO = @ID_USUARIO;

    -- Obtener la fecha de vigencia de la membresía del usuario
    SELECT @FECHA_VIGENCIA = VIGENCIA
    FROM cliente.HISTORICO_MEMBRESIA
    WHERE ID_USUARIO = @ID_USUARIO
    AND ID_MEMBRESIA = @ID_MEMBRESIA;

    -- Calcular el tiempo excedido en minutos
    IF @FECHA_VIAJE > @FECHA_VIGENCIA
    BEGIN
        SET @TIEMPO_EXCEDIDO = DATEDIFF(MINUTE, @FECHA_VIGENCIA, @FECHA_VIAJE);
        SET @TARIFA_AD_ACTUAL = (SELECT TARIFA_AD FROM servicio.VIAJE WHERE ID_VIAJE = @ID_VIAJE);

        -- Aumentar la TARIFA_AD según el tiempo excedido
        UPDATE servicio.VIAJE
        SET TARIFA_AD = @TARIFA_AD_ACTUAL + (5 * CEILING(@TIEMPO_EXCEDIDO / 10))
        WHERE ID_VIAJE = @ID_VIAJE;
    END
END;
GO

-- Para habilitar el TRIGGER
ENABLE TRIGGER TR_UpdateTarifaAD ON servicio.VIAJE
GO

-- Para deshabilitar el TRIGGER
DISABLE TRIGGER TR_UpdateTarifaAD ON servicio.VIAJE
GO

-- BORAR TRIGGER EN CASO DE SER NECESARIO:
DROP TRIGGER servicio.TR_UpdateTarifaAD
GO


-- PRUEBA: Se inserta un viaje adicional al usuario con ID=1, pues él todavía tiene su MEMBRESÍA en tipo Básica y su vigencia fue hace mucho

-- Incersión del VIAJE
BEGIN TRANSACTION
	INSERT INTO servicio.VIAJE (FECHA, HORA_INICIO, HORA_FIN, TARIFA_AD, ID_USUARIO, ID_BICICLETA, ID_FORMULARIO) VALUES
	-- 150
				('2024/06/04','09:00:00','10:00:00',0,1,10,NULL)
	SELECT * FROM servicio.VIAJE WHERE ID_VIAJE = 151
COMMIT TRANSACTION

-- Incersión de la estación de partida y de destino
BEGIN TRANSACTION
	INSERT INTO servicio.ESTACION_VIAJE (ID_VIAJE, ID_ESTACION, INICIO_FIN) VALUES
	-- 150
				(151,1,'I'),
				(151,2,'F')
	SELECT * FROM servicio.ESTACION_VIAJE WHERE ID_VIAJE = 151
COMMIT TRANSACTION


-- Revisamos que se haya aplicado la Tarifa adicional.
SELECT ID_VIAJE, FECHA, ID_USUARIO, TARIFA_AD FROM servicio.VIAJE WHERE ID_VIAJE = 151

/* 
	El resultado es de $10,080, pero ¿por qué ocurre esto? 

	El trigger lo que hace es contar el tiempo desde el primer minuto del día siguiente de la fecha de vencimiento, 
	es decir, desde el tiempo 00:00:00 del día 2024/05/22, y de ahí comienza a aplicar la sanción

	El tiempo transcurrido desde dicha fecha hasta la nueva incersión fue de 14 días.
	Haciendo las conversiones necesarias, tenemos que fueron un total de 20160 minutos transcurridos, que dividido entre los 10 minutos
	nos da 2016, número al cual si lo multiplicamos por la tarifa de $5 nos da un total de $10,080.00

	Este no creo que sea el objetivo de dicho atributo, pero por cuestiones de tiempo se quedará así
*/
