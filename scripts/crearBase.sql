/*
	Asignatura: Bases de datos
	Grupo: 02
	Nombre del proyecto: EcoBici
	Num. Equipo: 6
	Nombre del equipo: Los Primis
	Autor: Rosas Meza Isaías
	Descripción: Creación de la Base de datos (DDL)
*/
---------------------------------------------------------------------------------

-- CREACIÓN E INCIALIZACIÓN DE LA DATABASE

CREATE DATABASE LosPrimis_EcoBici
GO

USE LosPrimis_EcoBici
GO

---------------------------------------------------------------------------------

-- FASE 0: Crear esquemas para tener mejor orden en la creacion de las tablas.

CREATE SCHEMA trabajador
GO

CREATE SCHEMA catalogo
GO

CREATE SCHEMA cliente
GO

CREATE SCHEMA servicio
GO

CREATE SCHEMA emergencia
GO

---------------------------------------------------------------------------------

-- FASE 1: Creación de las tablas de la BD

/*  Lista de CONSIDERACIONES SEMÁNTICAS:
	*CS1: B-Básica, I-Intermedia, P-Premium
	*CS2: B=$120, I=$400, P=$3500
	*CS3: Primera vez: $50, Reposición: $30
	*CS4: C-Tarjeta de Crédito/Débito, P-Paypal
	*CS5: Se calcula con la fecha de nacimiento
	*CS6: NULL si no hubo tarifa ad,; $5*cada 10 min si se excedió el tiempo
	*CS7: PB:Problemas con la bici, CA:Choque con alguien, CB:Caida de la bici
	*CS8: DT:Daños a terceros, CO:Composturas a la bici, PF:Plan Full
	*CS9: S:Soltero, C:Casado, D:Divorciado, V:Viudo
	*CS10: Sueldo de $13000 mensuales
	*CS11: Entre 18 y 23 años
	*CS12: D:Dañada, F:Funcionamiento, B:Baja
	*CS13: CH:Chica, ME:Mediana, GR:Grande
	*CS14: Si el método de pago se quita, la vigencia ahora es de ese día		[PENDIENTE]
	*CS15: M-Masculino, F-Femenino
	*CS16: B-Buena, R-Regular, M-Mala
	*CS17: ADM-Administración, MNT-Mantenimiento, AUX-Auxiliar
	*CS18: I-Inicio, F-Fin
*/


	---- CATALOGO ----

-- TABLA: Catálogo de faltas
CREATE TABLE catalogo.CAT_FALTA(
    ID_TIPO_FALTA    tinyint        NOT NULL,  -- Identificador único del tipo de falta
    NOMBRE           varchar(40)    NOT NULL,  -- Nombre del tipo de falta

    CONSTRAINT pk_catalogo_faltas PRIMARY KEY NONCLUSTERED (ID_TIPO_FALTA)
);
go

-- TABLA: Catalogo de los tipos de Membresía
CREATE TABLE catalogo.MEMBRESIA(
    ID_MEMBRESIA         int        IDENTITY(1,1),      -- Identificador único de la membresía
	TIPO                 char(1)    NOT NULL,			-- CS1: B-Básica, I-Intermedia, P-Premium
    ALQUILER		     money      NOT NULL,			-- CS2: B=$120, I=$400, P=$3500
    SEGURO				 char(2)    NOT NULL,			-- CS8: DT:Daños a terceros, CO:Composturas a la bici, PF:Plan Full

    CONSTRAINT pk_membresia PRIMARY KEY NONCLUSTERED (ID_MEMBRESIA),

	CONSTRAINT ck_tipo_membresia CHECK (TIPO in ('B','I','P')),				-- CS1
	CONSTRAINT ck_alquiler_memb CHECK (ALQUILER in (120,400,3500)),			-- CS2
	CONSTRAINT ck_tipo_seguro CHECK (SEGURO in ('DT','CO','PF'))			-- CS8
);
go

-- TABLA: Catalogo para los tipos de accidente
CREATE TABLE catalogo.TIPO_ACCIDENTE(
    ID_ACCIDENTE         int        IDENTITY(1,1),		-- Identificador único del tipo de accidente
    DESCRIPCION			 char(2)    NOT NULL,			-- CS7

    CONSTRAINT pk_tipo_accidente PRIMARY KEY NONCLUSTERED (ID_ACCIDENTE),

	CONSTRAINT ck_descripcion CHECK (DESCRIPCION in ('PB','CA','CB'))		-- CS7
);
go


	---- TRABAJADOR ----

-- TABLA: Empleado
CREATE TABLE trabajador.EMPLEADO(
    ID_EMPLEADO           int            IDENTITY(1,1),   -- Identificador único del empleado
    RFC                   varchar(13)    NOT NULL,        -- RFC del empleado
    NOMBRE                varchar(20)    NOT NULL,        -- Nombre del empleado
    PATERNO               varchar(20)    NOT NULL,        -- Apellido paterno del empleado
    MATERNO               varchar(20)    NOT NULL,        -- Apellido materno del empleado
    GENERO				  char(1)        NOT NULL,		  -- CS15: M-Masculino, F-Femenino
    TELEFONO              char(10)       NOT NULL,        -- Teléfono del empleado
    ESTADO_CIVIL		  varchar(1)     NOT NULL,		  -- CS9: S:Soltero, C:Casado, D:Divorciado, V:Viudo
    TIPO_EMPLEADO         char(3)        NOT NULL,        -- CS17: ADM-Administración, MNT-Mantenimiento, AUX-Auxiliar
    SUPERVISOR            int            NOT NULL,        -- Supervisor del empleado

    CONSTRAINT pk_empleado PRIMARY KEY CLUSTERED (ID_EMPLEADO),
	CONSTRAINT uq_rfc UNIQUE (RFC),
	CONSTRAINT fk_empleado_super FOREIGN KEY (SUPERVISOR) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO),

	CONSTRAINT ck_tipoEmpleado check (TIPO_EMPLEADO in ('MNT','ADM','AUX')),		-- CS17 para Supertipos
	CONSTRAINT ck_genero_empleado check (GENERO in ('M','F')),						-- CS15
	CONSTRAINT ck_estado_civil check (ESTADO_CIVIL in ('S','C','D','V'))			-- CS9
);
go


-- TABLA: Idiomas del empleado
CREATE TABLE trabajador.IDIOMA(
    ID_IDIOMA        tinyint        NOT NULL,		-- Identificador único del idioma
    NOMBRE_IDIOMA    varchar(30)    NOT NULL,		-- Nombre del idioma
	ID_EMPLEADO		 integer		NOT NULL,		-- Id del empleado referenciado

    CONSTRAINT pk_idioma PRIMARY KEY CLUSTERED (ID_IDIOMA),
	CONSTRAINT fk_idioma_empleado FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO)
);
go

-- TABLA: Historico del empleado
CREATE TABLE trabajador.HISTORICO_EMPLEADO(
    ID_HISTORICO_EMP    int              IDENTITY(1,1),   -- Identificador único del historial del empleado
    NOMBRE              varchar(40)      NOT NULL,        -- Nombre del empleado
    PATERNO             varchar(40)      NOT NULL,        -- Apellido paterno del empleado
    MATERNO             varchar(40)      NOT NULL,        -- Apellido materno del empleado
    RFC                 char(13)         NOT NULL,        -- RFC del empleado
    FECHA_INICIO        date             NOT NULL,        -- Fecha de inicio de empleo
    FECHA_FIN           date             NOT NULL,        -- Fecha de fin de empleo
    PUESTO              varchar(40)      NOT NULL,        -- Puesto del empleado
    SUELDO			    money            NOT NULL,		  -- CS10: Sueldo de $13000 mensuales [Informe]
    EDAD				numeric(2, 0)    NOT NULL,		  -- CS11: Entre 18 y 23 años [Informe]
    ID_EMPLEADO         int              NOT NULL,        -- Identificador único del empleado

    CONSTRAINT pk_historico_emp PRIMARY KEY CLUSTERED (ID_HISTORICO_EMP),
	CONSTRAINT fk_id_empleado FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO),
);
go


-- TABLA: Registro de faltas
CREATE TABLE trabajador.REGISTRO_FALTAS(
    ID_FALTA         int        IDENTITY(1,1),  -- Identificador único del registro de falta
    FECHA            date       NOT NULL,       -- Fecha de la falta
    ID_TIPO_FALTA    tinyint    NOT NULL,       -- Identificador del tipo de falta
    ID_EMPLEADO      int        NOT NULL,       -- Identificador único del empleado

    CONSTRAINT pk_registro_faltas PRIMARY KEY CLUSTERED (ID_FALTA),
	CONSTRAINT fk_id_empleado_faltas FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO),
	CONSTRAINT fk_tipoFalta FOREIGN KEY (ID_TIPO_FALTA) REFERENCES catalogo.CAT_FALTA(ID_TIPO_FALTA)
);
go

-- TABLA: Dirección del empleado
CREATE TABLE trabajador.DIRECCION(
    ID_EMPLEADO    int            NOT NULL,  -- Identificador único del empleado
    CALLE          varchar(60)    NOT NULL,  -- Calle de la dirección
    NUM_EXT        varchar(20)    NOT NULL,  -- Número exterior
    ALCALDIA       varchar(40)    NOT NULL,  -- Alcaldía de la dirección
    NUM_INT        varchar(20)    NOT NULL,  -- Número interior
    COLONIA        varchar(40)    NOT NULL,  -- Colonia de la dirección

    CONSTRAINT pk_id_empleado_direccion PRIMARY KEY CLUSTERED (ID_EMPLEADO),
	CONSTRAINT fk_direccion_empleado FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO)
);
go

-- TABLA: Empleado de mantenimiento
CREATE TABLE trabajador.MANTENIMIENTO(
    ID_EMPLEADO          int            NOT NULL,  -- Identificador único del empleado
    TIPO_ESPECIALIDAD    varchar(40)    NOT NULL,  -- Especialidad del empleado de mantenimiento

    CONSTRAINT pk_trabajador_mantenimiento PRIMARY KEY CLUSTERED (ID_EMPLEADO),
	CONSTRAINT fk_empleado_mantenimiento FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO)

);
go

-- TABLA: Empleado de Administración
CREATE TABLE trabajador.ADMINISTRACION(
    ID_EMPLEADO    int            NOT NULL,  -- Identificador único del empleado
    FUNCION        varchar(40)    NOT NULL,  -- Función del empleado de administración

    CONSTRAINT pk_trabajador_administracion PRIMARY KEY CLUSTERED (ID_EMPLEADO),
	CONSTRAINT fk_empleado_administracion FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO)
);
go

-- TABLA: Empleado Auxiliar para accidentes
CREATE TABLE trabajador.AUXILIAR(
    ID_EMPLEADO    int    NOT NULL,  -- Identificador único del empleado

    CONSTRAINT pk_trabajador_auxiliar PRIMARY KEY CLUSTERED (ID_EMPLEADO),
	CONSTRAINT fk_empleado_auxiliar FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO)
);
go


	---- CLIENTE ----

-- TABLA: Usuario
CREATE TABLE cliente.USUARIO(
    ID_USUARIO       int              IDENTITY(1,1),   -- Identificador único del usuario
    CODIGO_INE       char(13)         NOT NULL,        -- Código INE del usuario
    NOMBRE           varchar(40)      NOT NULL,        -- Nombre del usuario
    PATERNO          varchar(40)      NOT NULL,        -- Apellido paterno del usuario
    MATERNO          varchar(40)      NOT NULL,        -- Apellido materno del usuario
    GENERO			 char(1)          NOT NULL,		   -- CS15: M-Masculino, F-Femenino
    CORREO           varchar(40)      NOT NULL,        -- Correo electrónico del usuario
    FECHA_NAC        date             NOT NULL,        -- Fecha de nacimiento del usuario
    EDAD			 numeric(2, 0)    NOT NULL,		   -- CS5: Se calcula con la fecha de nacimiento
	ID_MEMBRESIA	 int			  NOT NULL,

    CONSTRAINT pk_usuario PRIMARY KEY CLUSTERED (ID_USUARIO),
	CONSTRAINT uq_usuario UNIQUE (CODIGO_INE),
	CONSTRAINT fk_membresia_usuario FOREIGN KEY (ID_MEMBRESIA) REFERENCES catalogo.MEMBRESIA(ID_MEMBRESIA),

	CONSTRAINT ck_genero_usuario CHECK (GENERO in ('M','F')),				-- CS15
);
go

-- TABLA: Telefono del usuario
CREATE TABLE cliente.TELEFONO(
    ID_TELEFONO    int         IDENTITY(1,1),  -- Identificador único del teléfono
    NUMERO         char(10)    NOT NULL,       -- Número de teléfono
    ID_USUARIO     int         NOT NULL,       -- Identificador único del usuario

    CONSTRAINT pk_telefono_usu PRIMARY KEY CLUSTERED (ID_TELEFONO),
	CONSTRAINT fk_id_usuario FOREIGN KEY (ID_USUARIO) REFERENCES cliente.USUARIO(ID_USUARIO)
);
go

-- TABLA: Tarjeta de movilidad
CREATE TABLE cliente.TARJETA_MOV(
    CODIGO_QR              char(13)    NOT NULL,  -- Código QR de la tarjeta de movilidad
    COSTO_TARJETA		   money       NOT NULL,  -- CS3: Primera vez: $50, Reposición: $30
    SALDO	               money       NOT NULL,  -- Saldo de la tarjeta de movilidad
    ID_USUARIO             int         NOT NULL,  -- Identificador único del usuario
    REPOSICION             char(13)    NULL,	  -- CS3: Primera vez: $50, Reposición: $30

    CONSTRAINT pk_tarjeta_movilidad PRIMARY KEY CLUSTERED (CODIGO_QR),
	CONSTRAINT fk_id_usuario_tarjeta FOREIGN KEY (ID_USUARIO) REFERENCES cliente.USUARIO(ID_USUARIO),
	CONSTRAINT fk_reposicion_tarjeta FOREIGN KEY (REPOSICION) REFERENCES cliente.TARJETA_MOV(CODIGO_QR),
);
go


-- TABLA: Historico de Membresía
CREATE TABLE cliente.HISTORICO_MEMBRESIA(
    ID_HISTORICO_USUARIO	int			IDENTITY(1,1),	-- Llave primaria del historico para los usuarios y sus membresías
	ID_MEMBRESIA			int         NOT NULL,		-- Identificador único de la membresía
    ID_USUARIO				int         NOT NULL,		-- Identificador único del usuario
	FECHA_INICIO			date		NOT NULL,		-- Fecha de inicio de la membresía
    VIGENCIA				date		NOT NULL,		-- CS14: Si el método de pago se quita, la vigencia ahora es de ese día
    METODO_PAGO				char(1)		NULL,			-- CS4: C-Tarjeta de Crédito/Débito, P-Paypal
    FECHA_CAMBIO			date        NULL,			-- Fecha del cambio en la membresía

    CONSTRAINT pk_historico_membresia_usuario PRIMARY KEY CLUSTERED (ID_HISTORICO_USUARIO),
	CONSTRAINT fk_membresia_historico FOREIGN KEY (ID_MEMBRESIA) REFERENCES catalogo.MEMBRESIA(ID_MEMBRESIA),
	CONSTRAINT fk_usuario_historico FOREIGN KEY (ID_USUARIO) REFERENCES cliente.USUARIO(ID_USUARIO),

	-- CONSTRAINT ck_vigencia CHECK (if METODO_PAGO = NULL, VIGENCIA = ''),	-- CS14 [PENDIENTE]
	CONSTRAINT ck_metodo_pago CHECK (METODO_PAGO in ('C','P'))				-- CS4
);
go


	---- EMERGENCIA ----

-- TABLA: Formulario en caso de haber un accidente
CREATE TABLE emergencia.FORMULARIO(
    ID_FORMULARIO         int        IDENTITY(1,1),  -- Identificador único del formulario
    FECHA_ACCIDENTE       date       NOT NULL,       -- Fecha del accidente
    HORA_ACCIDENTE        time       NOT NULL,       -- Hora del accidente
    ALTITUD               float      NOT NULL,       -- Altitud del accidente
    LONGITUD              float      NOT NULL,       -- Longitud del accidente
	CALIDAD_AUX			  char(1)    NOT NULL,		 -- CS16: B-Buena, R-Regular, M-Mala
    ID_EMPLEADO           int        NOT NULL,       -- Identificador único del empleado auxiliar
    ID_ACCIDENTE          int        NOT NULL,       -- Identificador único del tipo de accidente

    CONSTRAINT pk_formulario PRIMARY KEY CLUSTERED (ID_FORMULARIO),
	CONSTRAINT fk_empleado_aux_form FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.AUXILIAR(ID_EMPLEADO),
	CONSTRAINT fk_tipoAccidente FOREIGN KEY (ID_ACCIDENTE) REFERENCES catalogo.TIPO_ACCIDENTE(ID_ACCIDENTE),

	CONSTRAINT ck_calidad_aux CHECK (CALIDAD_AUX in ('B','R','M'))			-- CS16
);
go

-- TABLA: Lugar del accidente
CREATE TABLE emergencia.LUGAR_ACCIDENTE(
    ID_FORMULARIO    int            NOT NULL,  -- Identificador único del formulario de accidente
    CP               char(5)        NOT NULL,  -- Código postal del lugar del accidente
    ALCALDIA         varchar(40)    NOT NULL,  -- Alcaldía del lugar del accidente
    COLONIA          varchar(40)    NOT NULL,  -- Colonia del lugar del accidente
    CALLE            varchar(40)    NOT NULL,  -- Calle del lugar del accidente
    NUMERO           varchar(40)    NOT NULL,  -- Número del lugar del accidente

    CONSTRAINT pk_lugar_accidente PRIMARY KEY CLUSTERED (ID_FORMULARIO),
	CONSTRAINT fk_lugarAccidente_formulario FOREIGN KEY (ID_FORMULARIO) REFERENCES emergencia.FORMULARIO(ID_FORMULARIO)
);
go


	---- SERVICIO ----

-- TABLA: Estacion
CREATE TABLE servicio.ESTACION(
    ID_ESTACION        int               IDENTITY(1,1),  -- Identificador único de la estación
    NOMBRE_ESTACION    varchar(40)       NOT NULL,       -- Nombre de la estación
    NUM_REPORTES       numeric(10, 0)    NULL			 CONSTRAINT DF_NumReportes DEFAULT(0), -- Número de reportes de la estación
    ID_EMPLEADO        int               NOT NULL,       -- Identificador único del empleado asociado a la estación

    CONSTRAINT pk_estacion PRIMARY KEY CLUSTERED (ID_ESTACION),
	CONSTRAINT fk_empleado_estacion FOREIGN KEY (ID_EMPLEADO) REFERENCES trabajador.EMPLEADO(ID_EMPLEADO)
);
go

-- TABLA: Bicicletas
CREATE TABLE servicio.BICICLETA(
    ID_BICICLETA	  integer		 IDENTITY(1,1), -- Número de identificación de la bicicleta
	NUM_SERIE         char(17)       NOT NULL,		-- Número de serie de la bicicleta
    TAMAÑO			  char(2)        NOT NULL,		-- CS13: CH:Chica, ME:Mediana, GR:Grande
    COLOR             varchar(80)    NOT NULL,		-- Color de la bicicleta
    ESTATUS			  char(1)        NOT NULL,		-- CS12: D:Dañada, F:Funcionamiento, B:Baja
    ID_ESTACION       int            NOT NULL,		-- Identificador de la estación asociada a la bicicleta

    CONSTRAINT pk_bicicleta PRIMARY KEY CLUSTERED (ID_BICICLETA),
	CONSTRAINT uq_bicicleta UNIQUE (NUM_SERIE),
	CONSTRAINT fk_bici_estacion FOREIGN KEY (ID_ESTACION) REFERENCES servicio.ESTACION(ID_ESTACION),

	CONSTRAINT ck_tamaño_bici CHECK (TAMAÑO in ('CH','ME','GR')),			-- CS13
	CONSTRAINT ck_estatus CHECK (ESTATUS in ('D','F','B'))					-- CS12
);
go

-- TABLA: Viaje
CREATE TABLE servicio.VIAJE(
    ID_VIAJE         int         IDENTITY(1,1),  -- Identificador único del viaje
    FECHA            date        NOT NULL,       -- Fecha del viaje
    HORA_INICIO      time        NOT NULL,       -- Hora de inicio del viaje
    HORA_FIN         time        NOT NULL,       -- Hora de fin del viaje
	TARIFA_AD        money       NULL			 CONSTRAINT DF_TarifaAd DEFAULT(0),	-- CS6: NULL si no hubo tarifa ad,; $5*cada 10 min si se excedió el tiempo
    ID_USUARIO       int         NOT NULL,       -- Identificador único del usuario
    ID_BICICLETA     int         NOT NULL,       -- Número de serie de la bicicleta
    ID_FORMULARIO    int         NULL,           -- Identificador único del formulario en caso de accidente

    CONSTRAINT pk_viaje PRIMARY KEY CLUSTERED (ID_VIAJE),
	CONSTRAINT fk_formulario FOREIGN KEY (ID_FORMULARIO) REFERENCES emergencia.FORMULARIO(ID_FORMULARIO),
	CONSTRAINT fk_id_usuario FOREIGN KEY (ID_USUARIO) REFERENCES cliente.USUARIO(ID_USUARIO),
	CONSTRAINT fk_numero_bicicleta FOREIGN KEY (ID_BICICLETA) REFERENCES servicio.BICICLETA(ID_BICICLETA),
);
go

-- TABLA: Estacion-Viaje
CREATE TABLE servicio.ESTACION_VIAJE(
    ID_VIAJE       int              NOT NULL,  -- Identificador único del viaje
	ID_ESTACION    int              NOT NULL,  -- Identificador único de la estación
    INICIO_FIN     char(1)			NOT NULL,  -- CS18: I-Inicio, F-Fin

    CONSTRAINT pk_estacion_viaje PRIMARY KEY CLUSTERED (ID_VIAJE, ID_ESTACION),
	CONSTRAINT fk_viaje FOREIGN KEY (ID_VIAJE) REFERENCES servicio.VIAJE(ID_VIAJE),
	CONSTRAINT fk_estacion FOREIGN KEY (ID_ESTACION) REFERENCES servicio.ESTACION(ID_ESTACION),

	CONSTRAINT ck_inicio_fin CHECK (INICIO_FIN in ('I', 'F'))
);
go

---------------------------------------------------------------------------------

-- FASE 2: Creación de los índices restantes [Van en orden alfabético]

	---- 1. trabajador ----

CREATE UNIQUE INDEX RFC ON trabajador.EMPLEADO(RFC)
go

CREATE INDEX idx_trabajador_administracion1 ON trabajador.ADMINISTRACION(ID_EMPLEADO)
go

CREATE INDEX idx_trabajador_auxiliar1 ON trabajador.AUXILIAR(ID_EMPLEADO)
go

CREATE INDEX idx_trabajador_direccion1 ON trabajador.DIRECCION(ID_EMPLEADO)
go

CREATE INDEX idx_trabajador_supervisor ON trabajador.EMPLEADO(SUPERVISOR)
go

CREATE INDEX idx_trabajador_idioma ON trabajador.IDIOMA(ID_EMPLEADO)
go

CREATE INDEX idx_trabajador_historico ON trabajador.HISTORICO_EMPLEADO(ID_EMPLEADO)
go

CREATE INDEX idx_trabajador_mantenimiento ON trabajador.MANTENIMIENTO(ID_EMPLEADO)
go

CREATE INDEX idx_trabajador_registroFaltas1 ON trabajador.REGISTRO_FALTAS(ID_EMPLEADO)
go

CREATE INDEX idx_trabajador_registroFaltas2 ON trabajador.REGISTRO_FALTAS(ID_TIPO_FALTA)
go

	---- 2. cliente ----

CREATE UNIQUE INDEX CODIGO_INE ON cliente.USUARIO(CODIGO_INE)
go

CREATE INDEX idx_cliente_historicoMemb1 ON cliente.HISTORICO_MEMBRESIA(ID_MEMBRESIA) 
go

CREATE INDEX idx_cliente_historicoMemb2 ON cliente.HISTORICO_MEMBRESIA(ID_USUARIO) 
go

CREATE INDEX idx_cliente_membresia ON cliente.USUARIO(ID_MEMBRESIA) 
go

CREATE INDEX idx_cliente_tarjetaMov1 ON cliente.TARJETA_MOV(ID_USUARIO) 
go

CREATE INDEX idx_cliente_tarjetaMov2 ON cliente.TARJETA_MOV(REPOSICION) 
go

CREATE INDEX idx_cliente_telefono1 ON cliente.TELEFONO(ID_USUARIO)
go

	---- 3. servicio ----

CREATE UNIQUE INDEX NUM_SERIE ON servicio.BICICLETA(ID_BICICLETA)
go

CREATE INDEX idx_servicio_bicicleta1 ON servicio.BICICLETA(ID_ESTACION)
go

CREATE INDEX idx_servicio_estacion1 ON servicio.ESTACION(ID_EMPLEADO)
go

CREATE INDEX idx_servicio_estacionViaje1 ON servicio.ESTACION_VIAJE(ID_VIAJE)
go

CREATE INDEX idx_servicio_estacionViaje2 ON servicio.ESTACION_VIAJE(ID_ESTACION)
go

CREATE INDEX idx_servicio_viaje2 ON servicio.VIAJE(ID_USUARIO)
go

CREATE INDEX idx_servicio_viaje3 ON servicio.VIAJE(ID_BICICLETA)
go

CREATE INDEX idx_servicio_viaje1 ON servicio.VIAJE(ID_FORMULARIO)
go

	---- 4. emergencia ----

CREATE INDEX idx_emergencia_formulario1 ON emergencia.FORMULARIO(ID_EMPLEADO)
go

CREATE INDEX idx_emergencia_formulario2 ON emergencia.FORMULARIO(ID_ACCIDENTE)
go

CREATE INDEX idx_emergencia_lugarAccidente ON emergencia.LUGAR_ACCIDENTE(ID_FORMULARIO)
go



---------------------------------------------------------------------------------

-- FASE 3: Adición de las columnas calculadas [revisión de checks particulares]

-- CHECK para la edad de los USUARIOS
ALTER TABLE cliente.USUARIO
ADD CONSTRAINT ch_edad_usuario CHECK (EDAD = DATEDIFF(year, FECHA_NAC, getdate()))
GO


-- Función y CHECK para la CS3: Primera vez: $50, Reposición: $30

CREATE FUNCTION cliente.ValidarCostoReposicion (@costo money, @reposicion char(13))
RETURNS bit
AS
BEGIN
    DECLARE @valido bit;

    IF (@costo = 30 AND @reposicion IS NOT NULL)
        SET @valido = 1;
    ELSE IF (@costo = 50 AND @reposicion IS NULL)
        SET @valido = 1;
    ELSE
        SET @valido = 0;

    RETURN @valido;
END;
GO

ALTER TABLE cliente.TARJETA_MOV
ADD CONSTRAINT ck_costo_reposicion_valido CHECK (cliente.ValidarCostoReposicion(COSTO_TARJETA, REPOSICION) = 1);
GO