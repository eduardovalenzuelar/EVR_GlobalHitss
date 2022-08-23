USE [TEST_GLOBALHITSS]
GO

/****** Object: User [gerencial]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.database_principals WHERE name = N'gerencial' AND type IN ('S', 'U', 'G', 'C', 'K')))
BEGIN
	DROP USER [gerencial]
END

GO

/****** Object: User [reports]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.database_principals WHERE name = N'reports' AND type IN ('S', 'U', 'G', 'C', 'K')))
BEGIN
	DROP USER [reports]
END

GO

/****** Object: User [unigest]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.database_principals WHERE name = N'unigest' AND type IN ('S', 'U', 'G', 'C', 'K')))
BEGIN
	DROP USER [unigest]
END

GO

/****** Object: Role Member [db_owner].[gerencial]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.database_role_members WHERE role_principal_id = USER_ID(N'db_owner') AND member_principal_id = USER_ID(N'gerencial')))
BEGIN
	EXECUTE [sp_droprolemember]
		@rolename = N'db_owner',
		@membername = N'gerencial'
END

GO

EXECUTE [sp_addrolemember]
	@rolename = N'db_owner',
	@membername = N'gerencial'
GO

/****** Object: Role Member [db_owner].[reports]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.database_role_members WHERE role_principal_id = USER_ID(N'db_owner') AND member_principal_id = USER_ID(N'reports')))
BEGIN
	EXECUTE [sp_droprolemember]
		@rolename = N'db_owner',
		@membername = N'reports'
END

GO

EXECUTE [sp_addrolemember]
	@rolename = N'db_owner',
	@membername = N'reports'
GO

/****** Object: Role Member [db_owner].[unigest]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.database_role_members WHERE role_principal_id = USER_ID(N'db_owner') AND member_principal_id = USER_ID(N'unigest')))
BEGIN
	EXECUTE [sp_droprolemember]
		@rolename = N'db_owner',
		@membername = N'unigest'
END

GO

EXECUTE [sp_addrolemember]
	@rolename = N'db_owner',
	@membername = N'unigest'
GO

/****** Object: Schema [db_accessadmin]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_accessadmin'))
BEGIN
	DROP SCHEMA [db_accessadmin]
END

GO

CREATE SCHEMA [db_accessadmin]
AUTHORIZATION [db_accessadmin]	
GO

/****** Object: Schema [db_backupoperator]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_backupoperator'))
BEGIN
	DROP SCHEMA [db_backupoperator]
END

GO

CREATE SCHEMA [db_backupoperator]
AUTHORIZATION [db_backupoperator]	
GO

/****** Object: Schema [db_datareader]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_datareader'))
BEGIN
	DROP SCHEMA [db_datareader]
END

GO

CREATE SCHEMA [db_datareader]
AUTHORIZATION [db_datareader]	
GO

/****** Object: Schema [db_datawriter]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_datawriter'))
BEGIN
	DROP SCHEMA [db_datawriter]
END

GO

CREATE SCHEMA [db_datawriter]
AUTHORIZATION [db_datawriter]	
GO

/****** Object: Schema [db_ddladmin]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_ddladmin'))
BEGIN
	DROP SCHEMA [db_ddladmin]
END

GO

CREATE SCHEMA [db_ddladmin]
AUTHORIZATION [db_ddladmin]	
GO

/****** Object: Schema [db_denydatareader]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_denydatareader'))
BEGIN
	DROP SCHEMA [db_denydatareader]
END

GO

CREATE SCHEMA [db_denydatareader]
AUTHORIZATION [db_denydatareader]	
GO

/****** Object: Schema [db_denydatawriter]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_denydatawriter'))
BEGIN
	DROP SCHEMA [db_denydatawriter]
END

GO

CREATE SCHEMA [db_denydatawriter]
AUTHORIZATION [db_denydatawriter]	
GO

/****** Object: Schema [db_owner]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_owner'))
BEGIN
	DROP SCHEMA [db_owner]
END

GO

CREATE SCHEMA [db_owner]
AUTHORIZATION [db_owner]	
GO

/****** Object: Schema [db_securityadmin]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.schemas WHERE name = N'db_securityadmin'))
BEGIN
	DROP SCHEMA [db_securityadmin]
END

GO

CREATE SCHEMA [db_securityadmin]
AUTHORIZATION [db_securityadmin]	
GO

ALTER USER [gerencial]
WITH DEFAULT_SCHEMA=[dbo]
GO

ALTER USER [reports]
WITH DEFAULT_SCHEMA=[dbo]
GO

ALTER USER [unigest]
WITH DEFAULT_SCHEMA=[dbo]
GO

/****** Object: Table [dbo].[CLIENTES]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLIENTES]') AND type ='U'))
BEGIN
	DROP TABLE [dbo].[CLIENTES]
END

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CLIENTES] (
	[dbid] bigint IDENTITY(1, 1),
	[dbidTipoIdentificacion] bigint NOT NULL,
	[Nombre] varchar(50) NOT NULL,
	[Numero_identificacion] varchar(20) NOT NULL,
	[email] varchar(50) NOT NULL,
	[Movil] bigint NOT NULL,
	[Direccion] varchar(300) NOT NULL,
	[Direccion_Instalacion] varchar(300) NOT NULL,
	[Fechacreacion] datetime NULL,
	[FechaModificacion] datetime NULL,
	[Estado] int NOT NULL DEFAULT ((1))
) ON [PRIMARY]
WITH(DATA_COMPRESSION = NONE)
GO

EXECUTE [sp_tableoption]
	@TableNamePattern  = N'[dbo].[CLIENTES]',
	@OptionName  = 'vardecimal storage format',
	@OptionValue  = 'OFF'
GO

ALTER TABLE [dbo].[CLIENTES] SET(LOCK_ESCALATION = TABLE)

GO

EXECUTE [sp_tableoption]
	@TableNamePattern  = N'[dbo].[CLIENTES]',
	@OptionName  = 'table lock on bulk load',
	@OptionValue  = 'OFF'
GO

/****** Object: Table [dbo].[TIPO_IDENTIFICACION]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPO_IDENTIFICACION]') AND type ='U'))
BEGIN
	DROP TABLE [dbo].[TIPO_IDENTIFICACION]
END

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TIPO_IDENTIFICACION] (
	[dbid] bigint IDENTITY(1, 1),
	[Descripcion] varchar(50) NOT NULL
) ON [PRIMARY]
WITH(DATA_COMPRESSION = NONE)
GO

EXECUTE [sp_tableoption]
	@TableNamePattern  = N'[dbo].[TIPO_IDENTIFICACION]',
	@OptionName  = 'vardecimal storage format',
	@OptionValue  = 'OFF'
GO

ALTER TABLE [dbo].[TIPO_IDENTIFICACION] SET(LOCK_ESCALATION = TABLE)

GO

EXECUTE [sp_tableoption]
	@TableNamePattern  = N'[dbo].[TIPO_IDENTIFICACION]',
	@OptionName  = 'table lock on bulk load',
	@OptionValue  = 'OFF'
GO

/****** Object: Stored Procedure [dbo].[SP_CLIENTE_CAMBIO_ESTADO]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_CLIENTE_CAMBIO_ESTADO]') AND type IN ('P', 'RF', 'PC')))
BEGIN
	DROP PROCEDURE [dbo].[SP_CLIENTE_CAMBIO_ESTADO]
END

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CLIENTE_CAMBIO_ESTADO]
@strdbid bigint
WITH EXEC AS CALLER
AS
DECLARE @ESTADO INT
SELECT  @ESTADO = Estado FROM CLIENTES WHERE dbid = @strdbid;
BEGIN TRAN
  UPDATE CLIENTES SET Estado = (IIF (@ESTADO = 1,0,1)) WHERE dbid = @strdbid;
COMMIT
GO

/****** Object: Trigger [dbo].[ActualizarFecha]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActualizarFecha]') AND type IN ('TR', 'TA')))
BEGIN
	DROP TRIGGER [dbo].[ActualizarFecha]
END

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [ActualizarFecha] ON [dbo].[CLIENTES]
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;

DECLARE @DBIDCLIENTE BIGINT;

SELECT @DBIDCLIENTE = (SELECT DBID FROM Inserted)

UPDATE CLIENTES SET FechaModificacion = GETDATE() WHERE dbid = @DBIDCLIENTE

SELECT @DBIDCLIENTE

END
GO

ENABLE TRIGGER [dbo].[ActualizarFecha] ON [dbo].[CLIENTES]
GO

/****** Object: Trigger [dbo].[Insertafechas]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Insertafechas]') AND type IN ('TR', 'TA')))
BEGIN
	DROP TRIGGER [dbo].[Insertafechas]
END

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Insertafechas] ON [dbo].[CLIENTES]
WITH EXEC AS CALLER
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @DBIDCLIENTE BIGINT;
SET @DBIDCLIENTE = (SELECT DBID FROM Inserted)
UPDATE CLIENTES SET Fechacreacion = GETDATE() WHERE dbid = @DBIDCLIENTE
END
GO

DISABLE TRIGGER [dbo].[Insertafechas] ON [dbo].[CLIENTES]
GO

/****** Object: Primary Key [PK__CLIENTES__2032EA019197A765]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PK__CLIENTES__2032EA019197A765]') AND type IN ('PK', 'UQ')))
BEGIN
	ALTER TABLE [dbo].[CLIENTES]
	DROP CONSTRAINT [PK__CLIENTES__2032EA019197A765]
END

GO

ALTER TABLE [dbo].[CLIENTES]
 ADD CONSTRAINT [PK__CLIENTES__2032EA019197A765] PRIMARY KEY([dbid]) WITH (FILLFACTOR=100,
		DATA_COMPRESSION = NONE) ON [PRIMARY]
GO

/****** Object: Primary Key    Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

ALTER TABLE [dbo].[TIPO_IDENTIFICACION]
 ADD PRIMARY KEY([dbid]) WITH (FILLFACTOR=100,
		DATA_COMPRESSION = NONE) ON [PRIMARY]
GO

/****** Object: Statistic [dbo].[CLIENTES].[_WA_Sys_00000002_145C0A3F]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.stats WHERE object_id = OBJECT_ID(N'[dbo].[CLIENTES]') AND name = N'_WA_Sys_00000002_145C0A3F'))
BEGIN
	DROP STATISTICS [dbo].[CLIENTES].[_WA_Sys_00000002_145C0A3F]
END

GO

CREATE STATISTICS [_WA_Sys_00000002_145C0A3F]
ON [dbo].[CLIENTES] ([dbidTipoIdentificacion])
GO

/****** Object: Foreign Key [FK_TIPO_IDENTIFICACION]   Script Date: 23/08/2022 1:58:39 p. m. ******/
GO

IF (EXISTS(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FK_TIPO_IDENTIFICACION]') AND type ='F'))
BEGIN
	ALTER TABLE [dbo].[CLIENTES]
	DROP CONSTRAINT [FK_TIPO_IDENTIFICACION]
END

GO

ALTER TABLE [dbo].[CLIENTES]
 ADD CONSTRAINT [FK_TIPO_IDENTIFICACION] FOREIGN KEY ([dbidTipoIdentificacion])
		REFERENCES [dbo].[TIPO_IDENTIFICACION] ([dbid])
	
GO