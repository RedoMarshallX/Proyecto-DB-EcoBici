/*
	Asignatura: Bases de datos
	Grupo: 02
	Nombre del proyecto: EcoBici
	Num. Equipo: 6
	Nombre del equipo: Los Primis
	Autor: Rosas Meza Isaías
	Descripción: Script para realizar los informes (Consultas)
*/

USE LosPrimis_EcoBici
GO

/*
	CONSULTA 1: Estadísticas de los daños en las bicicletas con mayor frecuencia. 
	Top 5 de los accidentes más frecuentes (descripción del daño, cantidad).
*/

WITH DañosBicicletas AS (
    SELECT B.NUM_SERIE, COUNT(*) AS TotalDaños
    FROM servicio.BICICLETA AS B
    JOIN servicio.VIAJE AS V ON B.ID_BICICLETA = V.ID_BICICLETA WHERE V.ID_FORMULARIO IS NOT NULL GROUP BY B.NUM_SERIE
),

TopDaños AS ( SELECT DB.NUM_SERIE, DB.TotalDaños, ROW_NUMBER() OVER (ORDER BY DB.TotalDaños DESC) AS Rank FROM DañosBicicletas AS DB)
SELECT B.NUM_SERIE, B.COLOR, B.TAMAÑO, TD.TotalDaños
FROM servicio.BICICLETA AS B
JOIN TopDaños AS TD ON B.NUM_SERIE = TD.NUM_SERIE WHERE TD.Rank <= 3;

WITH TopAccidentes AS (
	SELECT TA.DESCRIPCION AS TipoAccidente, COUNT(*) AS Cantidad 
	FROM emergencia.FORMULARIO AS F
    JOIN catalogo.TIPO_ACCIDENTE AS TA ON F.ID_ACCIDENTE = TA.ID_ACCIDENTE GROUP BY TA.DESCRIPCION
)

SELECT TipoAccidente, Cantidad FROM TopAccidentes ORDER BY Cantidad DESC 
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;
GO

/*
	CONSULTA 2: Estaciones con más reportes de accidentes con mayor frecuencia. Listado de estaciones con el número de accidentes 
	en un periodo de tiempo (fecha inicio – fecha fin) ordenados de mayor a menor. 
*/

-- Para poder hacer esta consulta, debemos actualizar las estaciones que recibieron los 20 formularios de accidentes:

SELECT * FROM servicio.ESTACION_VIAJE WHERE ID_VIAJE>130 AND ID_VIAJE<151 AND INICIO_FIN = 'F' ORDER BY ID_ESTACION
-- ID_ESTACION = 1 -> 5, ID_ESTACION = 2 -> 4, ID_ESTACION = 3 -> 4, ID_ESTACION = 4 -> 2, ID_ESTACION = 5 -> 3, ID_ESTACION = 6 -> 2

UPDATE servicio.ESTACION SET NUM_REPORTES = 5 WHERE ID_ESTACION = 1
UPDATE servicio.ESTACION SET NUM_REPORTES = 4 WHERE ID_ESTACION = 2
UPDATE servicio.ESTACION SET NUM_REPORTES = 4 WHERE ID_ESTACION = 3
UPDATE servicio.ESTACION SET NUM_REPORTES = 2 WHERE ID_ESTACION = 4
UPDATE servicio.ESTACION SET NUM_REPORTES = 3 WHERE ID_ESTACION = 5
UPDATE servicio.ESTACION SET NUM_REPORTES = 2 WHERE ID_ESTACION = 6
SELECT * FROM servicio.ESTACION
GO

-- Una vez hecho eso, podemos realizar la consulta

SELECT ID_ESTACION, NOMBRE_ESTACION, NUM_REPORTES FROM servicio.ESTACION WHERE NUM_REPORTES>3

SELECT EV.ID_ESTACION, E.NOMBRE_ESTACION, COUNT(*) AS TotalAccidentes
FROM servicio.ESTACION_VIAJE AS EV
JOIN emergencia.FORMULARIO AS F ON EV.ID_VIAJE = F.ID_FORMULARIO
JOIN servicio.ESTACION AS E ON EV.ID_ESTACION = E.ID_ESTACION WHERE F.FECHA_ACCIDENTE BETWEEN '2024-05-20' AND '2024-06-04'
GROUP BY EV.ID_ESTACION, E.NOMBRE_ESTACION ORDER BY TotalAccidentes DESC;
GO

/*
	CONSULTA 3: Total de accidentes en un rango de fechas, listados de mayor a menor
*/

SELECT COUNT(*) AS TotalAccidentes, F.FECHA_ACCIDENTE
FROM emergencia.FORMULARIO AS F WHERE F.FECHA_ACCIDENTE BETWEEN '2024-05-20' AND '2024-06-04'
GROUP BY F.FECHA_ACCIDENTE ORDER BY TotalAccidentes DESC;
GO

/*
	CONSULTA 4: Total de usuarios por rangos de fechas y rangos de edades (10 a 15 años, 15-20 años, 20 a 30 años, más de 30 años)
*/

SELECT
    SUM(CASE WHEN DATEDIFF(YEAR, U.FECHA_NAC, GETDATE()) BETWEEN 10 AND 15 THEN 1 ELSE 0 END) AS '10 a 15 años',
    SUM(CASE WHEN DATEDIFF(YEAR, U.FECHA_NAC, GETDATE()) BETWEEN 16 AND 20 THEN 1 ELSE 0 END) AS '16 a 20 años',
    SUM(CASE WHEN DATEDIFF(YEAR, U.FECHA_NAC, GETDATE()) BETWEEN 21 AND 30 THEN 1 ELSE 0 END) AS '21 a 30 años',
    SUM(CASE WHEN DATEDIFF(YEAR, U.FECHA_NAC, GETDATE()) > 30 THEN 1 ELSE 0 END) AS 'Más de 30 años'
FROM
    cliente.USUARIO AS U
GO

/*
	CONSULTA 5: Inventario de las bicicletas (todos los datos de las bicicletas) 
	por estaciones con el número de viajes, por un periodo de tiempo, incluir el nuemro de accidentes si ha tenido
*/

SELECT B.ID_BICICLETA, B.NUM_SERIE, B.TAMAÑO, B.COLOR, B.ESTATUS, B.ID_ESTACION, COUNT(V.ID_VIAJE) AS NumeroViajes, COUNT(F.ID_FORMULARIO) AS NumeroAccidentes
FROM servicio.BICICLETA AS B
LEFT JOIN servicio.VIAJE AS V ON B.ID_BICICLETA = V.ID_BICICLETA AND V.FECHA BETWEEN '2024-05-20' AND '2024-06-04'
LEFT JOIN emergencia.FORMULARIO AS F ON V.ID_FORMULARIO = F.ID_FORMULARIO AND F.FECHA_ACCIDENTE BETWEEN '2024-05-20' AND '2024-06-04'
GROUP BY B.ID_BICICLETA, B.NUM_SERIE, B.TAMAÑO, B.COLOR, B.ESTATUS, B.ID_ESTACION;
GO

/*
	CONSULTA 6: Listado de usuarios (datos generales), datos de su membresía y el tiempo en meses que tienen la membresia
*/

SELECT U.ID_USUARIO, U.CODIGO_INE, U.NOMBRE, U.PATERNO, U.MATERNO, U.GENERO, U.CORREO, U.FECHA_NAC, U.EDAD,
    M.TIPO AS TipoMembresia, M.ALQUILER AS CostoAlquiler, M.SEGURO AS TipoSeguro, HM.FECHA_INICIO AS FechaInicioMembresia,
    DATEDIFF(MONTH, HM.FECHA_INICIO, GETDATE()) AS MesesMembresia
FROM cliente.USUARIO AS U
JOIN (SELECT ID_USUARIO, MAX(FECHA_INICIO) AS UltimaFechaInicio FROM cliente.HISTORICO_MEMBRESIA 
      GROUP BY ID_USUARIO) AS UltimaMembresia ON U.ID_USUARIO = UltimaMembresia.ID_USUARIO
JOIN cliente.HISTORICO_MEMBRESIA AS HM ON  U.ID_USUARIO = HM.ID_USUARIO AND UltimaMembresia.UltimaFechaInicio = HM.FECHA_INICIO
JOIN catalogo.MEMBRESIA AS M ON HM.ID_MEMBRESIA = M.ID_MEMBRESIA;
GO

/*
	CONSULTA 7: Agentes mejor recocidos en un mes especifico, 
	para eso cada que un agente auxilia a un usuario en algún incidente el usuario llena una pequeña encuesta.
*/

SELECT A.ID_EMPLEADO, E.NOMBRE, E.PATERNO, E.MATERNO,
    AVG(CASE WHEN F.CALIDAD_AUX = 'B' THEN 3
             WHEN F.CALIDAD_AUX = 'R' THEN 2
             WHEN F.CALIDAD_AUX = 'M' THEN 1
             ELSE 0 END) AS CalificacionPromedio
FROM trabajador.AUXILIAR AS A
JOIN trabajador.EMPLEADO AS E ON A.ID_EMPLEADO = E.ID_EMPLEADO
JOIN emergencia.FORMULARIO AS F ON A.ID_EMPLEADO = F.ID_EMPLEADO
WHERE MONTH(F.FECHA_ACCIDENTE) = '06' -- Filtrar por el mes específico
GROUP BY A.ID_EMPLEADO, E.NOMBRE, E.PATERNO, E.MATERNO
ORDER BY
    AVG(CASE WHEN F.CALIDAD_AUX = 'B' THEN 3
             WHEN F.CALIDAD_AUX = 'R' THEN 2
             WHEN F.CALIDAD_AUX = 'M' THEN 1
             ELSE 0 END) DESC;
GO

/*
	CONSULTA 8: Reporte de los empleados que hacen rondines entregan de manera (fecha, descripción, si hubo incidentes o no, 
	número de accidentes, estación donde se obtiene el reporte). Ellos cuentan a su vez con un supervisor que también es empleado que hace rondines.
*/

SELECT * FROM servicio.ESTACION AS e
JOIN trabajador.EMPLEADO AS super ON super.ID_EMPLEADO = e.ID_EMPLEADO

/*
	CONSULTA 9: Listado de empleados con su tipo 
*/

SELECT ID_EMPLEADO, RFC, NOMBRE, PATERNO, MATERNO, GENERO, TIPO_EMPLEADO FROM trabajador.EMPLEADO 
GO

/*
	CONSULTA 10: Informe de los recorridos, por estación y/o por periodo de tiempo (fecha inicio y fecha fin); 
	nombre del usuario, estación de partida, lugar de llegada, tiempo en minutos del recorrido y costo de empleados con su tipo 
*/

SELECT 
    v.FECHA, v.ID_VIAJE, v.ID_USUARIO, v.ID_BICICLETA, 
    EstacionInicio.ID_ESTACION AS ESTACION_PARTIDA, 
    EstacionFin.ID_ESTACION AS ESTACION_DESTINO, 
    DATEDIFF(MINUTE, HORA_INICIO, HORA_FIN) AS TIEMPO_DE_VIAJE ,v.TARIFA_AD, v.ID_FORMULARIO
FROM 
    servicio.VIAJE AS v
LEFT JOIN 
    servicio.ESTACION_VIAJE AS ev_inicio 
    ON v.ID_VIAJE = ev_inicio.ID_VIAJE AND ev_inicio.INICIO_FIN like 'I'
LEFT JOIN 
    servicio.ESTACION AS EstacionInicio 
    ON ev_inicio.ID_ESTACION = EstacionInicio.ID_ESTACION
LEFT JOIN 
    servicio.ESTACION_VIAJE AS ev_fin 
    ON v.ID_VIAJE = ev_fin.ID_VIAJE AND ev_fin.INICIO_FIN like 'F'
LEFT JOIN 
    servicio.ESTACION AS EstacionFin 
    ON ev_fin.ID_ESTACION = EstacionFin.ID_ESTACION;
GO

/*
	CONSULTA 11: Épocas del año con número de recorridos ordenados de mayor a menor
*/

SELECT DATEPART(QUARTER, FECHA) AS 'Epoca_del_Año', COUNT(*) AS 'Numero_de_Recorridos'
FROM  servicio.VIAJE
GROUP BY DATEPART(QUARTER, FECHA)
ORDER BY COUNT(*) DESC;
GO

/*
	CONSULTA 12: Obtener para cada agente sus datos personales y el 
	listado de los accidentes que han atendido (tipo de accidente, fecha, lugar)
*/

SELECT 
    AUX.ID_EMPLEADO AS 'ID_Agente_Auxiliar', EMP.RFC AS 'RFC', EMP.NOMBRE AS 'Nombre', EMP.PATERNO AS 'Paterno', EMP.MATERNO AS 'Materno',
    FORM.ID_FORMULARIO AS 'ID_Formulario_Accidente', ACC.DESCRIPCION AS 'Tipo_Accidente', FORM.FECHA_ACCIDENTE AS 'Fecha_Accidente', 
	LUGAR.CP AS 'Codigo_Postal', LUGAR.ALCALDIA AS 'Alcaldia', LUGAR.COLONIA AS 'Colonia', LUGAR.CALLE AS 'Calle', LUGAR.NUMERO AS 'Numero'
FROM trabajador.AUXILIAR AUX
INNER JOIN emergencia.FORMULARIO FORM ON AUX.ID_EMPLEADO = FORM.ID_EMPLEADO
INNER JOIN catalogo.TIPO_ACCIDENTE ACC ON FORM.ID_ACCIDENTE = ACC.ID_ACCIDENTE
INNER JOIN emergencia.LUGAR_ACCIDENTE LUGAR ON FORM.ID_FORMULARIO = LUGAR.ID_FORMULARIO
INNER JOIN trabajador.EMPLEADO EMP ON AUX.ID_EMPLEADO = EMP.ID_EMPLEADO
ORDER BY AUX.ID_EMPLEADO
GO

/*
	CONSULTA 13: Para el área de recursos humanos es importante un informe mensual de todos los empleados y sus datos: 
	RFC, nombre completo y sueldo, asimismo nombre de los empleados y puesto de los que tengan un sueldo de 13000 mensuales 
	y pertenezcan a la tercera edad.
*/

SELECT RFC, CONCAT(NOMBRE, ' ', PATERNO, ' ', MATERNO) AS 'Nombre_Completo', SUELDO AS 'Sueldo', PUESTO AS 'Puesto'
FROM trabajador.HISTORICO_EMPLEADO
WHERE SUELDO = 13000 AND EDAD >= 60;
GO