

/************************************************************************
EXAMEN - SOLICITUDES DE VIATICOS (SV)
Y PAGOS DE ALIMENTACION Y TRANSPORTE (PAT)

ESTUDIANTE: JESUS JACINTO FABIAN
**************************************************************************/

USE master;
GO

/************************************************************************
1. CREACION DE LAS 5 BASES DE DATOS
************************************************************************/

CREATE DATABASE bd_JesusFabian_01;
GO

CREATE DATABASE bd_JesusFabian_02;
GO

CREATE DATABASE bd_JesusFabian_03;
GO

CREATE DATABASE bd_JesusFabian_04;
GO

CREATE DATABASE bd_JesusFabian_05;
GO

/************************************************************************
2. CREACION DE LOS 5 LOGINS
************************************************************************/

USE master;
GO

CREATE LOGIN usr_JesusFabian_01
WITH PASSWORD='Bdds_01#2026',
DEFAULT_DATABASE=bd_JesusFabian_01;
GO

CREATE LOGIN usr_JesusFabian_02
WITH PASSWORD='Bdds_02#2026',
DEFAULT_DATABASE=bd_JesusFabian_02;
GO

CREATE LOGIN usr_JesusFabian_03
WITH PASSWORD='Bdds_03#2026',
DEFAULT_DATABASE=bd_JesusFabian_03;
GO

CREATE LOGIN usr_JesusFabian_04
WITH PASSWORD='Bdds_04#2026',
DEFAULT_DATABASE=bd_JesusFabian_04;
GO

CREATE LOGIN usr_JesusFabian_05
WITH PASSWORD='Bdds_05#2026',
DEFAULT_DATABASE=bd_JesusFabian_05;
GO

/************************************************************************
3. CREACION DE LOS 5 USUARIOS
************************************************************************/

USE bd_JesusFabian_01;
GO
CREATE USER usr_JesusFabian_01 FOR LOGIN usr_JesusFabian_01;
GO

USE bd_JesusFabian_02;
GO
CREATE USER usr_JesusFabian_02 FOR LOGIN usr_JesusFabian_02;
GO

USE bd_JesusFabian_03;
GO
CREATE USER usr_JesusFabian_03 FOR LOGIN usr_JesusFabian_03;
GO

USE bd_JesusFabian_04;
GO
CREATE USER usr_JesusFabian_04 FOR LOGIN usr_JesusFabian_04;
GO

USE bd_JesusFabian_05;
GO
CREATE USER usr_JesusFabian_05 FOR LOGIN usr_JesusFabian_05;
GO

/************************************************************************
4. CREACION DE TABLAS
************************************************************************/

USE bd_JesusFabian_01;
GO

/************************************************************************
TABLA: TipoTransporte
************************************************************************/

CREATE TABLE TipoTransporte(

    IdTipoTransporte TINYINT NOT NULL,
    DescripcionTransporte VARCHAR(100) NULL,

    CONSTRAINT PK_TipoTransporte
    PRIMARY KEY (IdTipoTransporte)

);
GO

/************************************************************************
TABLA: Estatus
************************************************************************/

CREATE TABLE Estatus(

    IdEstatus TINYINT NOT NULL,
    DescripcionEstatus VARCHAR(300) NULL,

    CONSTRAINT PK_Estatus
    PRIMARY KEY (IdEstatus)

);
GO

/************************************************************************
TABLA: Documentos
************************************************************************/

CREATE TABLE Documentos(

    IdTipoDocumento TINYINT NOT NULL,
    NombreDocumento VARCHAR(100) NULL,
    Abreviatura VARCHAR(5) NULL,

    CONSTRAINT PK_Documentos
    PRIMARY KEY (IdTipoDocumento)

);
GO

/************************************************************************
TABLA: Colaborador
************************************************************************/

CREATE TABLE Colaborador(

    IdColaborador BIGINT IDENTITY(1,1) NOT NULL,
    Nombre1 VARCHAR(200) NULL,
    Nombre2 VARCHAR(200) NULL,
    Apellido1 VARCHAR(200) NULL,
    Apellido2 VARCHAR(200) NULL,
    ApellidoCasada VARCHAR(200) NULL,
    TipoID TINYINT NULL,
    Identificacion VARCHAR(100) NULL,

    CONSTRAINT PK_Colaborador
    PRIMARY KEY (IdColaborador)

);
GO

/************************************************************************
TABLA: Solicitud_Viatico_PAT
************************************************************************/

CREATE TABLE Solicitud_Viatico_PAT(

    IdSolicitud_Viatico_PAT BIGINT IDENTITY(1,1) NOT NULL,
    NumeroDocumento VARCHAR(20) NOT NULL,
    Fecha DATE NOT NULL,
    IdTipoDocumento TINYINT NOT NULL,
    IdColaborador BIGINT NOT NULL,
    Observaciones VARCHAR(500) NULL,
    IdEstatus TINYINT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinal DATE NOT NULL,

    CONSTRAINT PK_Solicitud_Viatico_PAT
    PRIMARY KEY (IdSolicitud_Viatico_PAT),

    CONSTRAINT FK_Solicitud_Documentos
    FOREIGN KEY (IdTipoDocumento)
    REFERENCES Documentos(IdTipoDocumento),

    CONSTRAINT FK_Solicitud_Colaborador
    FOREIGN KEY (IdColaborador)
    REFERENCES Colaborador(IdColaborador),

    CONSTRAINT FK_Solicitud_Estatus
    FOREIGN KEY (IdEstatus)
    REFERENCES Estatus(IdEstatus)

);
GO

/************************************************************************
TABLA: Solicitud_Viatico_PAT_Detalle
************************************************************************/

CREATE TABLE Solicitud_Viatico_PAT_Detalle(

    IdSolicitud_Viatico_PAT_Detalle BIGINT IDENTITY(1,1) NOT NULL,
    IdSolicitud_Viatico_PAT BIGINT NOT NULL,
    Renglon TINYINT NULL,
    FechaHora_Inicio DATETIME NULL,
    FechaHora_Final DATETIME NULL,
    IdTipoTransporte TINYINT NOT NULL,
    LugarSalida VARCHAR(200) NULL,
    LugarDestino VARCHAR(200) NULL,
    MovilizacionExterna DECIMAL(7,2) NULL,
    MovilizacionInterna DECIMAL(7,2) NULL,
    MontoDesayuno DECIMAL(7,2) NULL,
    MontoAlmuerzo DECIMAL(7,2) NULL,
    MontoCena DECIMAL(7,2) NULL,
    Hospedaje DECIMAL(7,2) NULL,

    CONSTRAINT PK_Solicitud_Viatico_PAT_Detalle
    PRIMARY KEY (IdSolicitud_Viatico_PAT_Detalle),

    CONSTRAINT FK_Detalle_Solicitud
    FOREIGN KEY (IdSolicitud_Viatico_PAT)
    REFERENCES Solicitud_Viatico_PAT(IdSolicitud_Viatico_PAT),

    CONSTRAINT FK_Detalle_TipoTransporte
    FOREIGN KEY (IdTipoTransporte)
    REFERENCES TipoTransporte(IdTipoTransporte)

);
GO