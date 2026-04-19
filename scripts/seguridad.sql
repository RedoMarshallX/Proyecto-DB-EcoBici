/*
	Asignatura: Bases de datos
	Grupo: 02
	Nombre del proyecto: EcoBici
	Num. Equipo: 6
	Nombre del equipo: Los Primis
	Autor: Rosas Meza Isaías
	Descripción: Script para el Lenguaje de Control de Datos (DCL)
*/

-- Se crean los roles para la BD
create role Supervisor
GO 
create role Administracion
GO
create role Mantenimiento 
GO
create role Auxiliar 
GO


-- Se crea el login para el usuario 'administradorEcoBici'
create login administradorEcoBici with password = 'EcoBici1234.',
	default_database = LosPrimis_EcoBici,
	check_expiration = OFF,
	check_policy = OFF
GO

-- Se agrega el usuario a la base de datos 
alter authorization on database:: LosPrimis_EcoBici to administradorEcoBici
GO

-- Se agrega el usuario de 'administradorEcoBici' al rol para que pueda crear otros usuarios
EXEC master..sp_addsrvrolemember @loginame = N'administradorEcoBici',
@rolename = N'securityadmin'
GO

-- Se crea el usuario 'administradorEcoBici' y se añade al rol de "Supervisor" con sus permisos respectivos
create user administradorEcoBici for login administradorEcoBici
GO

alter role Supervisor add member administradorEcoBici
GO
	
GRANT select, insert, delete, update on SCHEMA :: trabajador to Supervisor
GRANT select, insert, delete, update on SCHEMA :: cliente to Supervisor
GRANT select, insert, delete, update on SCHEMA :: servicio to Supervisor
GRANT select, insert, delete, update on SCHEMA :: emergencia to Supervisor
GRANT select, insert, delete, update on SCHEMA :: catalogo to Supervisor
GO

-- Rol de Administración:
GRANT select on TABLE :: REGISTRO_FALTA to Administracion
GRANT select on TABLE :: IDIOMA to Administracion
GRANT select, insert, delete, update on SCHEMA :: cliente to Administracion
GRANT select on SCHEMA :: servicio to Administracion
GRANT insert, delete, update on TABLE :: ESTACION_VIAJE to Administracion
GRANT insert, delete, update on COLUMN :: NUM_REPORTES to Administracion
GRANT select, insert, delete, update on SCHEMA :: emergencia to Administracion
GRANT select on SCHEMA :: catalogo to Administracion
GO

-- Rol de Mantenimiento:
GRANT select, update on SCHEMA :: trabajador to Mantenimiento
GRANT select, update on SCHEMA :: cliente to Mantenimiento
GRANT select, insert, update on SCHEMA :: servicio to Mantenimiento
GRANT select, insert, delete, update on SCHEMA :: emergencia to Mantenimiento
GRANT select, update on SCHEMA :: catalogo to Mantenimiento
GO


-- Rol de Auxiliar:
GRANT select on SCHEMA :: trabajador to Auxiliar
GRANT select on SCHEMA :: cliente to Auxiliar
GRANT select on SCHEMA :: servicio to Auxiliar
GRANT select on SCHEMA :: emergencia to Auxiliar
GRANT select on SCHEMA :: catalogo to Auxiliar
GO