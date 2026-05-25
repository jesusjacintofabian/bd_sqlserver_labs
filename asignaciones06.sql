/************************************************************************
ASIGNACION 06: CREACION DE BD, LOGINS Y USUARIOS
ESTUDIANTE: JESUS JACINTO FABIAN
CONTRASEÑA: BDDS_2026
**************************************************************************/

USE master;
GO

/*************************************************************************
1. CREACION DE LAS 5 BASES DE DATOS SECUENCIALES
**************************************************************************/

CREATE DATABASE bd_A6_JESUS_JACINTO_FABIAN_01;
GO

CREATE DATABASE bd_A6_JESUS_JACINTO_FABIAN_02;
GO

CREATE DATABASE bd_A6_JESUS_JACINTO_FABIAN_03;
GO

CREATE DATABASE bd_A6_JESUS_JACINTO_FABIAN_04;
GO

CREATE DATABASE bd_A6_JESUS_JACINTO_FABIAN_05;
GO

/*************************************************************************
2. CREACION DE LOS 10 LOGINS (ACCESO AL DBMS)
**************************************************************************/

/*********************** LOGINS 01 Y 02 ************************/

USE master;
GO

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_01
WITH PASSWORD='Bdds_01#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_01];
GO

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_02
WITH PASSWORD='Bdds_02#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_01];
GO

/*********************** LOGINS 03 Y 04 ************************/

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_03
WITH PASSWORD='Bdds_03#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_02];
GO

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_04
WITH PASSWORD='Bdds_04#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_02];
GO

/*********************** LOGINS 05 Y 06 ************************/

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_05
WITH PASSWORD='Bdds_05#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_03];
GO

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_06
WITH PASSWORD='Bdds_06#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_03];
GO

/*********************** LOGINS 07 Y 08 ************************/

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_07
WITH PASSWORD='Bdds_07#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_04];
GO

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_08
WITH PASSWORD='Bdds_08#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_04];
GO

/*********************** LOGINS 09 Y 10 ************************/

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_09
WITH PASSWORD='Bdds_09#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_05];
GO

CREATE LOGIN usr_A6_JESUS_JACINTO_FABIAN_10
WITH PASSWORD='Bdds_10#',
DEFAULT_DATABASE=[bd_A6_JESUS_JACINTO_FABIAN_05];
GO

/*************************************************************************
3. CREACION DE LOS USUARIOS POR CADA BASE DE DATOS
**************************************************************************/

/***********************************************************************
USUARIOS PARA LA BASE DE DATOS bd_A6_JESUS_JACINTO_FABIAN_01
************************************************************************/

USE bd_A6_JESUS_JACINTO_FABIAN_01;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_01
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_01;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_02
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_02;
GO

/***********************************************************************
USUARIOS PARA LA BASE DE DATOS bd_A6_JESUS_JACINTO_FABIAN_02
************************************************************************/

USE bd_A6_JESUS_JACINTO_FABIAN_02;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_03
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_03;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_04
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_04;
GO

/***********************************************************************
USUARIOS PARA LA BASE DE DATOS bd_A6_JESUS_JACINTO_FABIAN_03
************************************************************************/

USE bd_A6_JESUS_JACINTO_FABIAN_03;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_05
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_05;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_06
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_06;
GO

/***********************************************************************
USUARIOS PARA LA BASE DE DATOS bd_A6_JESUS_JACINTO_FABIAN_04
************************************************************************/

USE bd_A6_JESUS_JACINTO_FABIAN_04;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_07
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_07;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_08
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_08;
GO

/***********************************************************************
USUARIOS PARA LA BASE DE DATOS bd_A6_JESUS_JACINTO_FABIAN_05
************************************************************************/

USE bd_A6_JESUS_JACINTO_FABIAN_05;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_09
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_09;
GO

CREATE USER usr_A6_JESUS_JACINTO_FABIAN_10
FOR LOGIN usr_A6_JESUS_JACINTO_FABIAN_10;
GO