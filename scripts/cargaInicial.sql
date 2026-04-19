/*
	Asignatura: Bases de datos
	Grupo: 02
	Nombre del proyecto: EcoBici
	Num. Equipo: 6
	Nombre del equipo: Los Primis
	Autor: Rosas Meza Isaías
	Descripción: Carga Inicial para la Base de datos
*/

USE LosPrimis_EcoBici
GO

	---- CATALOGO ----

-- catalogo.MEMBRESIA_CAT
DBCC CHECKIDENT ('catalogo.MEMBRESIA',NORESEED)
GO

DBCC CHECKIDENT ('catalogo.MEMBRESIA',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO catalogo.MEMBRESIA(TIPO,ALQUILER,SEGURO) VALUES
		('B',120,'DT'),
		('I',400,'CO'),
		('P',3500,'PF')
	SELECT * FROM catalogo.MEMBRESIA
COMMIT TRANSACTION


-- catalogo.TIPO_ACCIDENTE
DBCC CHECKIDENT ('catalogo.TIPO_ACCIDENTE',NORESEED)
GO

DBCC CHECKIDENT ('catalogo.TIPO_ACCIDENTE',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO catalogo.TIPO_ACCIDENTE (DESCRIPCION) VALUES
		('PB'),
		('CA'),
		('CB')
	SELECT * FROM catalogo.TIPO_ACCIDENTE
COMMIT TRANSACTION



	---- TRABAJADOR ----

-- trabajador.EMPLEADO
DBCC CHECKIDENT ('trabajador.EMPLEADO',NORESEED)
GO

DBCC CHECKIDENT ('trabajador.EMPLEADO',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO trabajador.EMPLEADO(RFC, NOMBRE, PATERNO, MATERNO, GENERO, TELEFONO, ESTADO_CIVIL, TIPO_EMPLEADO, SUPERVISOR) VALUES
				('PAAJ011001O13', 'JETRO', 'PASTENES', 'AGUILAR', 'M', 5593388610, 'S', 'ADM', 6),
				('MALE030902A35', 'ELIAS', 'MARSHALL', 'LEE', 'M', 5593031286, 'C', 'ADM', 1),
				('GOGS020803R02', 'SANDRA', 'GONZALES', 'GARCÍA', 'F', 5589323161, 'S', 'MNT', 1),
				('BRSL010704S07', 'LLOYD', 'BROOKS', 'SHANTEL', 'M', 5593378885, 'D', 'AUX', 1),
				('NASB060605S11', 'BRIGGETE', 'NASHTEL', 'SUMISU', 'F', 5594177798, 'S', 'AUX', 1),
				('SMEA010506A10', 'ALYSON', 'SMITH', 'EVERGREEN', 'F', 5595049590, 'S', 'ADM', 1),
				('MIPK030407N97', 'KATHERINE', 'MIRANDA', 'PÉREZ', 'F', 5593389681, 'C', 'ADM', 6),
				('ROMB030308T99', 'BRIAN', 'ROBLES', 'MARIANO', 'M', 5593031143, 'S', 'MNT', 6),
				('MAPS010209V33', 'SAMANTHA', 'MADIGAN', 'PRADA', 'F', 5594176959, 'S', 'AUX', 6),
				('MAZN050110E67', 'NOAH', 'MARTÍNEZ', 'ZUÑIGA', 'M', 5580548071, 'V', 'AUX', 6),

				('CHBL860630BL1', 'LEONARD', 'CHURCH', 'BLUEONE', 'M', 5512345678, 'V', 'ADM', 1),
				('TUBL980629BL2', 'LAVERNIUS', 'TUCKER', 'BLUETWO', 'M', 5587654321, 'D', 'ADM', 1),
				('CABM980628BL3', 'MICHAEL', 'CABOOSE', 'BLUETHREE', 'M', 5522446688, 'S', 'MNT', 1),
				('SARM640513RD1', 'MARCUS', 'SARGE', 'REDONE', 'M', 5511335577, 'D', 'ADM', 6),
				('GRRD940512RD2', 'DEXTER', 'GRIF', 'REDTWO', 'M', 5500886644, 'S', 'ADM', 6),
				('SIRD960511RD3', 'DICK', 'SIMMONS', 'REDTHREE', 'M', 5599775533, 'S', 'MNT', 6)

	SELECT * FROM trabajador.EMPLEADO
COMMIT TRANSACTION


-- trabajador.AUXILIAR

BEGIN TRANSACTION
	INSERT INTO trabajador.AUXILIAR(ID_EMPLEADO) VALUES
				(4),
				(5),
				(9),
				(10)
	SELECT * FROM trabajador.AUXILIAR
COMMIT TRANSACTION


	---- CLIENTE ----

-- cliente.USUARIO
DBCC CHECKIDENT ('cliente.USUARIO',NORESEED)
GO

DBCC CHECKIDENT ('cliente.USUARIO',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO cliente.USUARIO (CODIGO_INE, NOMBRE, PATERNO, MATERNO, GENERO, CORREO, FECHA_NAC, EDAD, ID_MEMBRESIA) VALUES
		(0001234567890,'Sofía', 'García', 'López','F','sofiG@gmail.com','2000/12/15', 24, 1),
		(1111234567890,'Diego', 'Martínez', 'Hernández','M','DIEG0@gmail.com','1999/10/19', 25, 1),
		(2221234567890,'Valeria', 'Sánchez', 'Castro','F','ValSanCas@gmail.com','1988/05/27', 36, 1),
		(3331234567890,'Mateo', 'Rivera', 'Gómez','M','MAT123RI@gmail.com','2003/02/09', 21, 1),
		(4441234567890,'Camila', 'Torres', 'Díaz','F','sofiG@gmail.com','2000/12/15', 24, 1),
		(5551234567890,'Alejandro', 'Pérez', 'Mendoza','M','AleMAGNO7@gmail.com','2001/07/16', 23, 1),
		(6661234567890,'Daniela', 'Flores', 'Jiménez','F','FlowDan1@gmail.com','2002/01/08', 22, 1),
		(7771234567890,'Carlos', 'Ortiz', 'Moreno','M','CarloMAGNO8@gmail.com','1999/06/24', 25, 1),
		(8881234567890,'Mariana', 'Rubio', 'Vargas','F','MariBlondy09@gmail.com','1995/08/13', 29, 1),
		(9991234567890,'José', 'Cruz', 'Ríos','M','MasterChamps@gmail.com','1999/07/26', 25, 1),

		(0123456789111,'Andrea', 'Fuentes', 'Cabrera','F','Andyss@gmail.com','2002/08/09', 22, 2),
		(0123456789222,'David', 'Salazar', 'Domínguez','M','D4vd04@gmail.com','1989/04/12', 35, 2),
		(0123456789333,'Lucía', 'Ramos', 'Mora','F','Lux99@gmail.com','1995/11/23', 29, 2),
		(0123456789444,'Daniel', 'Guzmán', 'Juárez','M','DanDragon07@gmail.com','2003/09/16', 21, 2),
		(0123456789555,'Isabella', 'Medina', 'Molina','F','isbella87@gmail.com','1987/02/21', 37, 2),
		(0123456789666,'Miguel', 'Delgado', 'Alvarado','M','Migu3lAngell0@gmail.com','1994/07/01', 30, 2),
		(0123456789777,'Natalia', 'Herrera', 'Quintana','F','NatyNasty@gmail.com','1997/11/26', 27, 2),
		(0123456789888,'Antonio', 'Soto', 'Vázquez','M','Ant0Zot0@gmail.com','2004/12/21', 20, 2),
		(0123456789999,'Gabriela', 'Rojas', 'Castillo','F','GabsRED1@gmail.com','1992/04/17', 32, 2),
		(0123456789000,'Fernando', 'Franco', 'Montoya','M','Manus89@gmail.com','1996/05/10', 28, 2),

		(1230123456789,'Alejandra', 'Cárdenas', 'Luna','F','AlxandGaGa@gmail.com','2002/11/29', 22, 3),
		(2340123456789,'Ricardo', 'Navarro', 'Gallardo','M','Richy66@gmail.com','1994/07/22', 30, 3),
		(3450123456789,'Fernanda', 'Molina', 'Guerrero','F','FerMon7@gmail.com','1999/12/31', 25, 3),
		(4560123456789,'Javier', 'Núñez', 'Figueroa','M','NoMeLlamoJavi@gmail.com','1985/08/13', 39, 3),
		(5670123456789,'Paula', 'Camacho', 'Suárez','F','Pau99@gmail.com','1999/02/14', 25, 3),
		(6780123456789,'Luis', 'Solís', 'Peña','M','Luisito100@gmail.com','2000/01/01', 24, 3),
		(7890123456789,'Carmen', 'Aguilar', 'Rivas','F','AguilaCarmen@gmail.com','1982/11/19', 42, 3),
		(8900123456789,'Raúl', 'Vélez', 'Cervantes','M','Rocket95@gmail.com','1995/05/30', 29, 3),
		(9010123456789,'Teresa', 'Paredes', 'Guerra','F','Princesa78a@gmail.com','1993/09/27', 31, 3),
		(1350123456789,'Marshall', 'Lee', 'Rose','M',marshil123@gmail.com','2000/09/23', 24, 3)
	SELECT * FROM cliente.USUARIO
COMMIT TRANSACTION


	---- SERVICIO ----

-- servicio.ESTACION
DBCC CHECKIDENT ('servicio.ESTACION',NORESEED)
GO

DBCC CHECKIDENT ('servicio.ESTACION',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO servicio.ESTACION (NOMBRE_ESTACION, NUM_REPORTES, ID_EMPLEADO) VALUES
		('ALFA', 0, 11),
		('BETA', 0, 12),
		('GAMMA', 0, 13),
		('SIGMA', 0, 14),
		('EPSILON', 0, 15),
		('OMEGA', 0, 16)
	SELECT * FROM servicio.ESTACION
COMMIT TRANSACTION


-- servicio.BICICLETA
DBCC CHECKIDENT ('servicio.BICICLETA',NORESEED)
GO

DBCC CHECKIDENT ('servicio.BICICLETA',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO servicio.BICICLETA (NUM_SERIE, TAMAÑO, COLOR, ESTATUS, ID_ESTACION) VALUES
		('BC921864977975478', 'CH', 'NEGRA', 'F', 1),
		('BC387833822620653', 'CH', 'ROJA', 'F', 1),
		('BC634130471570391', 'CH', 'CELESTE', 'F', 2),
		('BC552552538828861', 'CH', 'VERDE', 'F', 2),
		('BC975879807759975', 'CH', 'NARANJA', 'F', 3),
		('BC090885483982768', 'CH', 'BLANCA', 'F', 4),
		('BC159831238163450', 'CH', 'ROSA', 'F', 4),
		('BC370484276679140', 'CH', 'AZUL', 'B', 5),
		('BC789595343705979', 'CH', 'LIMA', 'B', 5),
		('BC117103256627788', 'CH', 'AMARILLA', 'D', 6),

		('BC833298052401900', 'ME', 'NEGRA', 'B', 1),
		('BC368643896376334', 'ME', 'ROJA', 'B', 1),
		('BC117087747272443', 'ME', 'CELESTE', 'F', 2),
		('BC757901789351042', 'ME', 'VERDE', 'F', 2),
		('BC227251277259893', 'ME', 'NARANJA', 'F', 3),
		('BC181533755830832', 'ME', 'BLANCA', 'F', 3),
		('BC251990812159517', 'ME', 'ROSA', 'F', 4),
		('BC306873867604332', 'ME', 'AZUL', 'F', 4),
		('BC600278802875711', 'ME', 'LIMA', 'F', 5),
		('BC870367389655251', 'ME', 'AMARILLA', 'F', 6),

		('BC589612372085923', 'GR', 'NEGRA', 'F', 1),
		('BC863935134653342', 'GR', 'ROJA', 'F', 2),
		('BC226599764075619', 'GR', 'CELESTE', 'B', 3),
		('BC862693779465703', 'GR', 'VERDE', 'F', 3),
		('BC767569160291584', 'GR', 'NARANJA', 'F', 4),
		('BC497121702782113', 'GR', 'BLANCA', 'D', 5),
		('BC486339524397257', 'GR', 'ROSA', 'F', 5),
		('BC381279616813124', 'GR', 'AZUL', 'B', 6),
		('BC640543508867286', 'GR', 'LIMA', 'F', 6),
		('BC164726006932573', 'GR', 'AMARILLA', 'F', 6)

	SELECT * FROM servicio.BICICLETA
COMMIT TRANSACTION


-- servicio.VIAJE
DBCC CHECKIDENT ('servicio.VIAJE',NORESEED)
GO

DBCC CHECKIDENT ('servicio.VIAJE',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO servicio.VIAJE (FECHA, HORA_INICIO, HORA_FIN, TARIFA_AD, ID_USUARIO, ID_BICICLETA, ID_FORMULARIO) VALUES
	-- 0
				('2024/05/20','09:06:02','10:01:30',0,1,10,NULL),
				('2024/05/20','09:20:52','10:06:50',0,2,11,NULL),
				('2024/05/20','09:40:53','09:55:10',0,5,09,NULL),
				('2024/05/20','09:44:09','11:02:22',0,7,1,NULL),
				('2024/05/20','10:16:15','10:59:34',0,9,5,NULL),
				('2024/05/20','10:23:35','11:14:42',0,11,29,NULL),
				('2024/05/20','12:08:42','13:05:28',0,13,20,NULL),
				('2024/05/20','13:00:39','13:49:32',0,15,13,NULL),
				('2024/05/20','14:40:10','15:20:44',0,17,7,NULL),
				('2024/05/20','15:06:05','16:09:22',0,19,14,NULL),
	-- 10
				('2024/05/21','08:10:02','08:40:21',0,20,3,NULL),
				('2024/05/21','09:00:03','10:04:10',0,21,4,NULL),
				('2024/05/21','09:56:02','10:42:28',0,2,2,NULL),
				('2024/05/21','10:36:01','11:01:05',0,6,30,NULL),
				('2024/05/21','11:01:01','11:16:00',0,8,21,NULL),
				('2024/05/21','11:46:22','12:58:40',0,12,16,NULL),
				('2024/05/21','11:50:52','12:20:34',0,24,10,NULL),
				('2024/05/21','13:46:02','13:59:21',0,23,23,NULL),
				('2024/05/21','14:15:09','14:53:58',0,28,6,NULL),
				('2024/05/21','14:39:02','16:00:40',0,14,8,NULL),
	-- 20
				('2024/05/22','09:22:11','10:34:10',0,25,12,NULL),
				('2024/05/22','10:33:59','11:43:15',0,27,14,NULL),
				('2024/05/22','11:19:00','11:50:05',0,10,16,NULL),
				('2024/05/22','12:15:08','12:33:08',0,16,11,NULL),
				('2024/05/22','13:10:23','14:01:49',0,18,9,NULL),
				('2024/05/22','14:14:49','15:00:59',0,4,24,NULL),
				('2024/05/22','14:50:56','15:27:43',0,29,26,NULL),
				('2024/05/22','15:15:20','16:01:56',0,22,7,NULL),
				('2024/05/22','15:49:44','16:10:44',0,26,10,NULL),
				('2024/05/22','15:52:34','16:20:28',0,30,1,NULL),
	-- 30
				('2024/05/23','08:02:06','08:31:31',0,18,28,NULL),
				('2024/05/23','08:14:11','09:17:20',0,1,2,NULL),
				('2024/05/23','10:20:32','10:58:49',0,4,10,NULL),
				('2024/05/23','10:44:12','11:05:59',0,21,16,NULL),
				('2024/05/23','12:01:19','12:40:44',0,07,18,NULL),
				('2024/05/23','12:23:48','12:55:52',0,23,22,NULL),
				('2024/05/23','13:10:35','13:42:43',0,11,4,NULL),
				('2024/05/23','14:15:52','14:46:21',0,25,1,NULL),
				('2024/05/23','15:14:05','15:29:23',0,14,23,NULL),
				('2024/05/23','15:16:14','16:01:58',0,28,24,NULL),
	-- 40
				('2024/05/24','08:44:40','08:59:01',0,3,14,NULL),
				('2024/05/24','09:05:01','10:00:00',0,19,3,NULL),
				('2024/05/24','10:20:08','10:50:58',0,12,5,NULL),
				('2024/05/24','10:59:11','11:30:34',0,13,9,NULL),
				('2024/05/24','12:10:09','12:47:31',0,30,7,NULL),
				('2024/05/24','13:22:06','13:55:26',0,16,22,NULL),
				('2024/05/24','13:44:44','14:10:04',0,8,23,NULL),
				('2024/05/24','14:06:29','14:49:46',0,15,19,NULL),
				('2024/05/24','15:15:35','15:37:53',0,26,1,NULL),
				('2024/05/24','15:26:40','15:49:57',0,3,10,NULL),
	-- 50
				('2024/05/25','09:40:02','10:01:40',0,29,15,NULL),
				('2024/05/25','09:43:02','10:15:30',0,5,14,NULL),
				('2024/05/25','11:20:02','11:51:25',0,17,16,NULL),
				('2024/05/25','11:33:02','11:59:50',0,20,19,NULL),
				('2024/05/25','12:01:02','12:20:29',0,6,22,NULL),
				('2024/05/25','12:23:02','12:54:01',0,9,8,NULL),
				('2024/05/25','13:04:02','13:50:03',0,27,30,NULL),
				('2024/05/25','14:30:02','14:57:21',0,10,11,NULL),
				('2024/05/25','14:31:02','15:01:19',0,22,12,NULL),
				('2024/05/25','14:32:02','15:04:30',0,24,13,NULL),
	-- 60
				('2024/05/26','08:10:44','09:00:01',0,2,1,NULL),
				('2024/05/26','09:50:40','10:40:30',0,5,8,NULL),
				('2024/05/26','10:02:32','10:39:21',0,16,18,NULL),
				('2024/05/26','11:10:01','11:32:40',0,19,21,NULL),
				('2024/05/26','11:14:09','12:09:11',0,22,17,NULL),
				('2024/05/26','13:01:11','13:41:10',0,7,5,NULL),
				('2024/05/26','13:15:01','13:38:09',0,26,28,NULL),
				('2024/05/26','13:30:45','14:05:10',0,12,10,NULL),
				('2024/05/26','15:14:50','15:58:23',0,14,16,NULL),
				('2024/05/26','16:00:40','16:20:10',0,29,27,NULL),
	-- 70
				('2024/05/27','09:04:04','10:00:30',0,1,3,NULL),
				('2024/05/27','09:15:02','10:05:43',0,27,24,NULL),
				('2024/05/27','09:26:10','09:49:52',0,18,16,NULL),
				('2024/05/27','12:10:08','12:42:32',0,24,22,NULL),
				('2024/05/27','12:11:22','12:50:00',0,10,11,NULL),
				('2024/05/27','12:23:04','12:48:45',0,3,5,NULL),
				('2024/05/27','13:10:02','13:58:42',0,15,9,NULL),
				('2024/05/27','15:06:21','15:28:49',0,21,28,NULL),
				('2024/05/27','15:11:30','15:49:50',0,30,12,NULL),
				('2024/05/27','15:20:40','16:09:10',0,9,9,NULL),
	-- 80
				('2024/05/28','08:42:02','09:11:10',0,4,9,NULL),
				('2024/05/28','09:59:02','10:28:50',0,28,11,NULL),
				('2024/05/28','10:14:02','10:39:41',0,17,13,NULL),
				('2024/05/28','10:44:02','10:58:31',0,13,15,NULL),
				('2024/05/28','11:09:02','11:41:20',0,11,17,NULL),
				('2024/05/28','11:29:02','11:57:57',0,6,19,NULL),
				('2024/05/28','12:10:02','12:35:29',0,8,20,NULL),
				('2024/05/28','13:14:02','13:40:40',0,23,22,NULL),
				('2024/05/28','13:19:02','13:45:50',0,20,23,NULL),
				('2024/05/28','13:44:02','14:05:59',0,25,20,NULL),
	-- 90
				('2024/05/29','08:10:11','08:44:29',0,16,12,NULL),
				('2024/05/29','09:15:09','09:40:10',0,5,1,NULL),
				('2024/05/29','10:14:11','10:50:10',0,21,19,NULL),
				('2024/05/29','11:30:19','12:01:04',0,30,25,NULL),
				('2024/05/29','12:29:15','13:05:40',0,6,3,NULL),
				('2024/05/29','13:02:52','13:49:32',0,2,14,NULL),
				('2024/05/29','14:14:49','14:38:10',0,12,11,NULL),
				('2024/05/29','15:00:31','15:29:01',0,26,24,NULL),
				('2024/05/29','15:10:44','15:50:03',0,9,7,NULL),
				('2024/05/29','15:22:22','15:49:30',0,19,13,NULL),
	-- 100
				('2024/05/30','08:00:12','08:29:34',0,7,9,NULL),
				('2024/05/30','08:10:08','08:40:23',0,1,2,NULL),
				('2024/05/30','09:15:12','09:45:44',0,23,23,NULL),
				('2024/05/30','09:18:14','09:40:22',0,18,14,NULL),
				('2024/05/30','11:02:11','11:32:09',0,15,12,NULL),
				('2024/05/30','11:22:19','11:45:15',0,28,7,NULL),
				('2024/05/30','13:11:23','13:29:41',0,20,6,NULL),
				('2024/05/30','13:14:09','13:45:55',0,13,16,NULL),
				('2024/05/30','14:22:11','14:50:32',0,4,19,NULL),
				('2024/05/30','14:15:15','14:52:28',0,24,17,NULL),
	-- 110
				('2024/05/31','08:12:04','08:49:10',0,3,25,NULL),
				('2024/05/31','08:20:18','08:54:32',0,8,14,NULL),
				('2024/05/31','09:19:32','09:54:21',0,29,15,NULL),
				('2024/05/31','09:58:32','10:32:20',0,17,13,NULL),
				('2024/05/31','10:11:22','10:54:10',0,22,11,NULL),
				('2024/05/31','12:10:02','12:30:16',0,27,9,NULL),
				('2024/05/31','12:24:10','12:49:19',0,14,8,NULL),
				('2024/05/31','14:32:04','14:58:58',0,25,21,NULL),
				('2024/05/31','14:40:15','15:10:55',0,10,26,NULL),
				('2024/05/31','15:00:23','15:38:10',0,11,27,NULL),
	-- 120
				('2024/06/01','08:10:20','08:29:09',0,23,1,NULL),
				('2024/06/01','09:09:34','09:40:01',0,16,3,NULL),
				('2024/06/01','10:08:32','10:41:10',0,5,5,NULL),
				('2024/06/01','10:15:24','10:45:00',0,15,7,NULL),
				('2024/06/01','11:20:19','11:55:49',0,26,11,NULL),
				('2024/06/01','12:23:08','12:52:32',0,19,15,NULL),
				('2024/06/01','13:04:01','13:42:21',0,8,19,NULL),
				('2024/06/01','14:15:00','14:48:14',0,12,23,NULL),
				('2024/06/01','15:23:48','15:52:34',0,1,29,NULL),
				('2024/06/01','15:31:09','15:59:00',0,30,13,NULL),
	-- 130
				('2024/06/02','08:00:05','08:37:01',0,2,23,NULL),
				('2024/06/02','08:09:45','08:35:18',0,18,21,NULL),
				('2024/06/02','10:15:32','10:40:10',0,24,19,NULL),
				('2024/06/02','10:32:33','10:54:29',0,9,17,NULL),
				('2024/06/02','11:15:22','11:49:54',0,11,14,NULL),
				('2024/06/02','11:17:21','11:39:15',0,27,12,NULL),
				('2024/06/02','14:01:29','14:15:11',0,20,9,NULL),
				('2024/06/02','14:09:48','14:30:57',0,7,27,NULL),
				('2024/06/02','15:13:47','15:29:32',0,13,10,NULL),
				('2024/06/02','15:15:31','15:46:14',0,21,4,NULL),
	-- 140
				('2024/06/03','08:09:01','08:30:09',0,17,1,NULL),
				('2024/06/03','09:12:14','09:38:02',0,22,13,NULL),
				('2024/06/03','09:15:28','09:45:12',0,3,15,NULL),
				('2024/06/03','11:11:34','11:42:11',0,4,12,NULL),
				('2024/06/03','12:05:40','12:39:40',0,6,7,NULL),
				('2024/06/03','13:10:33','13:34:52',0,29,9,NULL),
				('2024/06/03','14:08:29','14:42:43',0,25,5,NULL),
				('2024/06/03','15:00:23','15:39:54',0,28,3,NULL),
				('2024/06/03','16:03:41','16:37:09',0,10,2,NULL),
				('2024/06/03','16:20:58','16:58:10',0,14,30,NULL)

	SELECT * FROM servicio.VIAJE
COMMIT TRANSACTION



	---- EMERGENCIA ----

-- emergencia.FORMULARIO
DBCC CHECKIDENT ('emergencia.FORMULARIO',NORESEED)
GO

DBCC CHECKIDENT ('emergencia.FORMULARIO',RESEED,0)
GO

BEGIN TRANSACTION
	INSERT INTO emergencia.FORMULARIO (FECHA_ACCIDENTE, HORA_ACCIDENTE, ALTITUD, LONGITUD, CALIDAD_AUX, ID_EMPLEADO, ID_ACCIDENTE) VALUES
		('2024/06/02', '08:17:35', 19.330970, -99.186032, 'B', 5, 1),
		('2024/06/02', '08:26:41', 19.330996, -99.186009, 'B', 10, 2),
		('2024/06/02', '10:21:59', 19.333522, -99.184772, 'R', 4, 3),
		('2024/06/02', '10:49:08', 19.332970, -99.187011, 'R', 9, 3),
		('2024/06/02', '11:22:23', 19.332449, -99.183918, 'B', 10, 2),
		('2024/06/02', '11:29:26', 19.332008, -99.186800, 'B', 5, 1),
		('2024/06/02', '14:10:14', 19.333746, -99.183941, 'R', 9, 3),
		('2024/06/02', '14:21:55', 19.333378, -99.186614, 'R', 4, 3),
		('2024/06/02', '15:19:47', 19.330970, -99.186032, 'R', 4, 1),
		('2024/06/02', '15:30:07', 19.332446, -99.186627, 'M', 9, 3),

		('2024/06/03', '08:11:24', 19.333654, -99.186771, 'B', 5, 2),
		('2024/06/03', '09:22:43', 19.333104, -99.182036, 'B', 10, 3),
		('2024/06/03', '09:26:05', 19.332470, -99.185165, 'B', 4, 3),
		('2024/06/03', '11:36:15', 19.330682, -99.181489, 'B', 9, 1),
		('2024/06/03', '12:19:03', 19.333991, -99.182839, 'B', 10, 3),
		('2024/06/03', '13:30:54', 19.332937, -99.183669, 'B', 5, 1),
		('2024/06/03', '14:16:46', 19.331784, -99.186894, 'B', 9, 3),
		('2024/06/03', '15:28:09', 19.333020, -99.187205, 'B', 4, 2),
		('2024/06/03', '16:31:00', 19.333747, -99.182227, 'R', 5, 3),
		('2024/06/03', '16:42:26', 19.331668, -99.186963, 'R', 10, 3)

	SELECT * FROM emergencia.FORMULARIO
COMMIT TRANSACTION


-- emergencia.LUGAR_ACCIDENTE

BEGIN TRANSACTION
	INSERT INTO emergencia.LUGAR_ACCIDENTE (ID_FORMULARIO, CP, ALCALDIA, COLONIA, CALLE, NUMERO) VALUES
		(1, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Ingeniería', '4'),
		(2, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Arquitectura', '6'),
		(3, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Islas', '6'),
		(4, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Filosofía', '1'),
		(5, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Ingeniería', '9'),
		(6, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Islas', '1'),
		(7, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Derecho', '3'),
		(8, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Filosofía', '3'),
		(9, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Arquitectura', '3'),
		(10, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Islas', '1'),

		(11, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Filosofía', '2'),
		(12, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Medicina', '3'),
		(13, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Islas', '2'),
		(14, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Química', '2'),
		(15, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Economía', '3'),
		(16, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Islas', '2'),
		(17, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Arquitectura', '6'),
		(18, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Biblioteca central', '1'),
		(19, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Economía', '1'),
		(20, '04510', 'Coyoacán', 'Ciudad Universitaria', 'Química', '4')

	SELECT * FROM emergencia.LUGAR_ACCIDENTE
COMMIT TRANSACTION


-- Después de llenar los formularios, se actualizan los registros de servicio.VIAJE indicando el ID_FORMULARIO
UPDATE servicio.VIAJE SET ID_FORMULARIO = 1 WHERE ID_VIAJE = 131
UPDATE servicio.VIAJE SET ID_FORMULARIO = 2 WHERE ID_VIAJE = 132
UPDATE servicio.VIAJE SET ID_FORMULARIO = 3 WHERE ID_VIAJE = 133
UPDATE servicio.VIAJE SET ID_FORMULARIO = 4 WHERE ID_VIAJE = 134
UPDATE servicio.VIAJE SET ID_FORMULARIO = 5 WHERE ID_VIAJE = 135
UPDATE servicio.VIAJE SET ID_FORMULARIO = 6 WHERE ID_VIAJE = 136
UPDATE servicio.VIAJE SET ID_FORMULARIO = 7 WHERE ID_VIAJE = 137
UPDATE servicio.VIAJE SET ID_FORMULARIO = 8 WHERE ID_VIAJE = 138
UPDATE servicio.VIAJE SET ID_FORMULARIO = 9 WHERE ID_VIAJE = 139
UPDATE servicio.VIAJE SET ID_FORMULARIO = 10 WHERE ID_VIAJE = 140

UPDATE servicio.VIAJE SET ID_FORMULARIO = 11 WHERE ID_VIAJE = 141
UPDATE servicio.VIAJE SET ID_FORMULARIO = 12 WHERE ID_VIAJE = 142
UPDATE servicio.VIAJE SET ID_FORMULARIO = 13 WHERE ID_VIAJE = 143
UPDATE servicio.VIAJE SET ID_FORMULARIO = 14 WHERE ID_VIAJE = 144
UPDATE servicio.VIAJE SET ID_FORMULARIO = 15 WHERE ID_VIAJE = 145
UPDATE servicio.VIAJE SET ID_FORMULARIO = 16 WHERE ID_VIAJE = 146
UPDATE servicio.VIAJE SET ID_FORMULARIO = 17 WHERE ID_VIAJE = 147
UPDATE servicio.VIAJE SET ID_FORMULARIO = 18 WHERE ID_VIAJE = 148
UPDATE servicio.VIAJE SET ID_FORMULARIO = 19 WHERE ID_VIAJE = 149
UPDATE servicio.VIAJE SET ID_FORMULARIO = 20 WHERE ID_VIAJE = 150

SELECT * FROM servicio.VIAJE


-- Para completar el apartado de viajes, se indican las estaciones de salida y llegada de cada uno
-- NOTA: No pueden haber viajes de retorno, es decir, que no se puede iniciar y terminar un viaje en una misma estación

BEGIN TRANSACTION
	INSERT INTO servicio.ESTACION_VIAJE (ID_VIAJE, ID_ESTACION, INICIO_FIN) VALUES
	-- 0
				(1,6,'I'),
				(1,1,'F'),
				(2,1,'I'),
				(2,2,'F'),
				(3,5,'I'),
				(3,6,'F'),
				(4,1,'I'),
				(4,2,'F'),
				(5,3,'I'),
				(5,4,'F'),
				(6,6,'I'),
				(6,1,'F'),
				(7,6,'I'),
				(7,1,'F'),
				(8,2,'I'),
				(8,3,'F'),
				(9,4,'I'),
				(9,5,'F'),
				(10,2,'I'),
				(10,3,'F'),
	-- 10
				(11,2,'I'),
				(11,1,'F'),
				(12,2,'I'),
				(12,1,'F'),
				(13,1,'I'),
				(13,2,'F'),
				(14,6,'I'),
				(14,5,'F'),
				(15,1,'I'),
				(15,2,'F'),
				(16,3,'I'),
				(16,4,'F'),
				(17,6,'I'),
				(17,5,'F'),
				(18,3,'I'),
				(18,4,'F'),
				(19,4,'I'),
				(19,3,'F'),
				(20,5,'I'),
				(20,6,'F'),
	-- 20
				(21,1,'I'),
				(21,6,'F'),
				(22,2,'I'),
				(22,1,'F'),
				(23,3,'I'),
				(23,2,'F'),
				(24,1,'I'),
				(24,6,'F'),
				(25,5,'I'),
				(25,4,'F'),
				(26,3,'I'),
				(26,2,'F'),
				(27,5,'I'),
				(27,4,'F'),
				(28,4,'I'),
				(28,3,'F'),
				(29,6,'I'),
				(29,5,'F'),
				(30,1,'I'),
				(30,6,'F'),
	-- 30
				(31,6,'I'),
				(31,3,'F'),
				(32,1,'I'),
				(32,4,'F'),
				(33,6,'I'),
				(33,3,'F'),
				(34,3,'I'),
				(34,6,'F'),
				(35,4,'I'),
				(35,1,'F'),
				(36,2,'I'),
				(36,5,'F'),
				(37,2,'I'),
				(37,5,'F'),
				(38,1,'I'),
				(38,4,'F'),
				(39,3,'I'),
				(39,6,'F'),
				(40,3,'I'),
				(40,6,'F'),
	-- 40
				(41,2,'I'),
				(41,1,'F'),
				(42,2,'I'),
				(42,1,'F'),
				(43,3,'I'),
				(43,2,'F'),
				(44,5,'I'),
				(44,4,'F'),
				(45,4,'I'),
				(45,3,'F'),
				(46,2,'I'),
				(46,1,'F'),
				(47,3,'I'),
				(47,2,'F'),
				(48,5,'I'),
				(48,4,'F'),
				(49,1,'I'),
				(49,6,'F'),
				(50,6,'I'),
				(50,5,'F'),
	-- 50
				(51,3,'I'),
				(51,4,'F'),
				(52,2,'I'),
				(52,1,'F'),
				(53,3,'I'),
				(53,4,'F'),
				(54,5,'I'),
				(54,6,'F'),
				(55,2,'I'),
				(55,1,'F'),
				(56,5,'I'),
				(56,6,'F'),
				(57,6,'I'),
				(57,5,'F'),
				(58,1,'I'),
				(58,2,'F'),
				(59,1,'I'),
				(59,2,'F'),
				(60,2,'I'),
				(60,1,'F'),
	-- 60
				(61,1,'I'),
				(61,5,'F'),
				(62,5,'I'),
				(62,1,'F'),
				(63,4,'I'),
				(63,3,'F'),
				(64,1,'I'),
				(64,5,'F'),
				(65,4,'I'),
				(65,3,'F'),
				(66,3,'I'),
				(66,4,'F'),
				(67,6,'I'),
				(67,2,'F'),
				(68,6,'I'),
				(68,2,'F'),
				(69,3,'I'),
				(69,4,'F'),
				(70,5,'I'),
				(70,1,'F'),
	-- 70
				(71,2,'I'),
				(71,3,'F'),
				(72,3,'I'),
				(72,4,'F'),
				(73,3,'I'),
				(73,4,'F'),
				(74,2,'I'),
				(74,3,'F'),
				(75,1,'I'),
				(75,2,'F'),
				(76,3,'I'),
				(76,4,'F'),
				(77,5,'I'),
				(77,6,'F'),
				(78,6,'I'),
				(78,1,'F'),
				(79,1,'I'),
				(79,2,'F'),
				(80,6,'I'),
				(80,1,'F'),
	-- 80
				(81,5,'I'),
				(81,2,'F'),
				(82,1,'I'),
				(82,4,'F'),
				(83,2,'I'),
				(83,5,'F'),
				(84,3,'I'),
				(84,6,'F'),
				(85,4,'I'),
				(85,1,'F'),
				(86,5,'I'),
				(86,2,'F'),
				(87,6,'I'),
				(87,3,'F'),
				(88,2,'I'),
				(88,5,'F'),
				(89,3,'I'),
				(89,6,'F'),
				(90,3,'I'),
				(90,1,'F'),
	-- 90
				(91,1,'I'),
				(91,2,'F'),
				(92,1,'I'),
				(92,2,'F'),
				(93,5,'I'),
				(93,6,'F'),
				(94,4,'I'),
				(94,5,'F'),
				(95,2,'I'),
				(95,3,'F'),
				(96,2,'I'),
				(96,3,'F'),
				(97,1,'I'),
				(97,2,'F'),
				(98,3,'I'),
				(98,4,'F'),
				(99,4,'I'),
				(99,5,'F'),
				(100,2,'I'),
				(100,3,'F'),
	-- 100
				(101,5,'I'),
				(101,1,'F'),
				(102,1,'I'),
				(102,5,'F'),
				(103,3,'I'),
				(103,4,'F'),
				(104,2,'I'),
				(104,6,'F'),
				(105,1,'I'),
				(105,5,'F'),
				(106,4,'I'),
				(106,3,'F'),
				(107,4,'I'),
				(107,3,'F'),
				(108,3,'I'),
				(108,4,'F'),
				(109,5,'I'),
				(109,1,'F'),
				(110,4,'I'),
				(110,3,'F'),
	-- 110
				(111,4,'I'),
				(111,2,'F'),
				(112,2,'I'),
				(112,4,'F'),
				(113,3,'I'),
				(113,6,'F'),
				(114,2,'I'),
				(114,4,'F'),
				(115,1,'I'),
				(115,5,'F'),
				(116,5,'I'),
				(116,1,'F'),
				(117,5,'I'),
				(117,1,'F'),
				(118,1,'I'),
				(118,5,'F'),
				(119,5,'I'),
				(119,1,'F'),
				(120,5,'I'),
				(120,1,'F'),
	-- 120
				(121,1,'I'),
				(121,3,'F'),
				(122,2,'I'),
				(122,4,'F'),
				(123,3,'I'),
				(123,5,'F'),
				(124,4,'I'),
				(124,6,'F'),
				(125,1,'I'),
				(125,3,'F'),
				(126,3,'I'),
				(126,5,'F'),
				(127,5,'I'),
				(127,1,'F'),
				(128,3,'I'),
				(128,5,'F'),
				(129,6,'I'),
				(129,2,'F'),
				(130,2,'I'),
				(130,4,'F'),
	-- 130
				(131,3,'I'),
				(131,1,'F'),
				(132,1,'I'),
				(132,2,'F'),
				(133,5,'I'),
				(133,4,'F'),
				(134,4,'I'),
				(134,3,'F'),
				(135,2,'I'),
				(135,1,'F'),
				(136,1,'I'),
				(136,2,'F'),
				(137,5,'I'),
				(137,4,'F'),
				(138,5,'I'),
				(138,3,'F'),
				(139,6,'I'),
				(139,2,'F'),
				(140,2,'I'),
				(140,1,'F'),
	-- 140
				(141,1,'I'),
				(141,3,'F'),
				(142,2,'I'),
				(142,6,'F'),
				(143,3,'I'),
				(143,1,'F'),
				(144,1,'I'),
				(144,6,'F'),
				(145,4,'I'),
				(145,5,'F'),
				(146,5,'I'),
				(146,1,'F'),
				(147,3,'I'),
				(147,2,'F'),
				(148,2,'I'),
				(148,3,'F'),
				(149,1,'I'),
				(149,5,'F'),
				(150,6,'I'),
				(150,5,'F')

	SELECT * FROM servicio.ESTACION_VIAJE
COMMIT TRANSACTION