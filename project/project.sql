USE [EcgGlobalMonitoring]
GO
/****** Object:  User [Cardiocenter]    Script Date: 18.07.2020 10:21:05 ******/
CREATE USER [Cardiocenter] FOR LOGIN [Cardiocenter] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DEV105954]    Script Date: 18.07.2020 10:21:05 ******/
CREATE USER [DEV105954] FOR LOGIN [DEV105954] WITH DEFAULT_SCHEMA=[Device]
GO
/****** Object:  User [Device123]    Script Date: 18.07.2020 10:21:05 ******/
CREATE USER [Device123] FOR LOGIN [DEVICE123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Kirill]    Script Date: 18.07.2020 10:21:05 ******/
CREATE USER [Kirill] FOR LOGIN [Kirill] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [Device]    Script Date: 18.07.2020 10:21:05 ******/
CREATE ROLE [Device]
GO
/****** Object:  DatabaseRole [ServiceEngineer]    Script Date: 18.07.2020 10:21:05 ******/
CREATE ROLE [ServiceEngineer]
GO
/****** Object:  DatabaseRole [WorkingPlace]    Script Date: 18.07.2020 10:21:05 ******/
CREATE ROLE [WorkingPlace]
GO
ALTER ROLE [WorkingPlace] ADD MEMBER [Cardiocenter]
GO
ALTER ROLE [Device] ADD MEMBER [DEV105954]
GO
ALTER ROLE [Device] ADD MEMBER [Device123]
GO
ALTER ROLE [ServiceEngineer] ADD MEMBER [Kirill]
GO
/****** Object:  Schema [Device]    Script Date: 18.07.2020 10:21:05 ******/
CREATE SCHEMA [Device]
GO
/****** Object:  Schema [WorkingPlace]    Script Date: 18.07.2020 10:21:05 ******/
CREATE SCHEMA [WorkingPlace]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](128) NOT NULL,
	[Street] [nvarchar](128) NOT NULL,
	[Home] [int] NOT NULL,
	[Building] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Channel]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[Code] [varchar](8) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Order] [tinyint] NOT NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](64) NOT NULL,
	[FirstName] [nvarchar](64) NOT NULL,
	[Patronymic] [nvarchar](64) NOT NULL,
	[PhoneNumber] [nvarchar](64) NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[SerialNumber] [char](9) NOT NULL,
	[SimCardID] [nvarchar](64) NOT NULL,
	[MicroControllerID] [nvarchar](64) NOT NULL,
	[RadioModuleImei] [nvarchar](64) NOT NULL,
	[FirmwareVersion] [varchar](16) NOT NULL,
	[Battery] [tinyint] NOT NULL,
	[RSSI] [tinyint] NOT NULL,
 CONSTRAINT [PK_dbo.Device] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmware]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firmware](
	[Version] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Firmware] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MicroController]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MicroController](
	[ID] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_dbo.MicroController] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monitoring]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monitoring](
	[DeviceSerialNumber] [char](9) NOT NULL,
	[WorkingPlaceName] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Monitoring] PRIMARY KEY CLUSTERED 
(
	[DeviceSerialNumber] ASC,
	[WorkingPlaceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[DeviceSerialNumber] [char](9) NOT NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[Hour] [tinyint] NOT NULL,
	[Minute] [tinyint] NOT NULL,
	[Second] [tinyint] NOT NULL,
	[Value] [binary](960) NOT NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[DeviceSerialNumber] ASC,
	[RecordStartDateTime] ASC,
	[Day] ASC,
	[Hour] ASC,
	[Minute] ASC,
	[Second] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Initials] [nchar](3) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RadioModule]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RadioModule](
	[Imei] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_dbo.RadioModule] PRIMARY KEY CLUSTERED 
(
	[Imei] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[DeviceSerialNumber] [char](9) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[Patient] [int] NULL,
	[Channel0] [varchar](8) NOT NULL,
	[Channel1] [varchar](8) NOT NULL,
	[Channel2] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[DeviceSerialNumber] ASC,
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SimCard]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SimCard](
	[ID] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_dbo.SimCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingPlace]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingPlace](
	[Name] [nvarchar](128) NOT NULL,
	[Address] [int] NOT NULL,
	[Contacts] [int] NOT NULL,
 CONSTRAINT [PK_dbo.WorkingPlace] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_LastName]  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_FirstName]  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_Patronymic]  DEFAULT ('') FOR [Patronymic]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[Device] ADD  CONSTRAINT [DF_Device_CurrentBattery]  DEFAULT ((0)) FOR [Battery]
GO
ALTER TABLE [dbo].[Device] ADD  CONSTRAINT [DF_Device_CurrentRSSI]  DEFAULT ((0)) FOR [RSSI]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_HeartRateTrend_DayNumber]  DEFAULT ((0)) FOR [Day]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_Channel0]  DEFAULT ((0)) FOR [Channel0]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_Channel1]  DEFAULT ((0)) FOR [Channel1]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_Channel2]  DEFAULT ((0)) FOR [Channel2]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Device_dbo.MicroController_MicroControllerID] FOREIGN KEY([MicroControllerID])
REFERENCES [dbo].[MicroController] ([ID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_dbo.Device_dbo.MicroController_MicroControllerID]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Device_dbo.RadioModule_RadioModuleImei] FOREIGN KEY([RadioModuleImei])
REFERENCES [dbo].[RadioModule] ([Imei])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_dbo.Device_dbo.RadioModule_RadioModuleImei]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Device_dbo.SimCard_SimCardID] FOREIGN KEY([SimCardID])
REFERENCES [dbo].[SimCard] ([ID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_dbo.Device_dbo.SimCard_SimCardID]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Firmware] FOREIGN KEY([FirmwareVersion])
REFERENCES [dbo].[Firmware] ([Version])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_Firmware]
GO
ALTER TABLE [dbo].[Monitoring]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Monitoring_dbo.Device_DeviceSerialNumber] FOREIGN KEY([DeviceSerialNumber])
REFERENCES [dbo].[Device] ([SerialNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Monitoring] CHECK CONSTRAINT [FK_dbo.Monitoring_dbo.Device_DeviceSerialNumber]
GO
ALTER TABLE [dbo].[Monitoring]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Monitoring_dbo.WorkingPlace_WorkingPlaceName] FOREIGN KEY([WorkingPlaceName])
REFERENCES [dbo].[WorkingPlace] ([Name])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Monitoring] CHECK CONSTRAINT [FK_dbo.Monitoring_dbo.WorkingPlace_WorkingPlaceName]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Record] FOREIGN KEY([DeviceSerialNumber], [RecordStartDateTime])
REFERENCES [dbo].[Record] ([DeviceSerialNumber], [StartDateTime])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Record]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Record_dbo.Device_DeviceSerialNumber] FOREIGN KEY([DeviceSerialNumber])
REFERENCES [dbo].[Device] ([SerialNumber])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_dbo.Record_dbo.Device_DeviceSerialNumber]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Channel0] FOREIGN KEY([Channel0])
REFERENCES [dbo].[Channel] ([Code])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Channel0]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Channel1] FOREIGN KEY([Channel1])
REFERENCES [dbo].[Channel] ([Code])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Channel1]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Channel2] FOREIGN KEY([Channel2])
REFERENCES [dbo].[Channel] ([Code])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Channel2]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Patient] FOREIGN KEY([Patient])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Patient]
GO
ALTER TABLE [dbo].[WorkingPlace]  WITH CHECK ADD  CONSTRAINT [FK_WorkingPlace_Address] FOREIGN KEY([Address])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[WorkingPlace] CHECK CONSTRAINT [FK_WorkingPlace_Address]
GO
ALTER TABLE [dbo].[WorkingPlace]  WITH CHECK ADD  CONSTRAINT [FK_WorkingPlace_Contacts] FOREIGN KEY([Contacts])
REFERENCES [dbo].[Contacts] ([ID])
GO
ALTER TABLE [dbo].[WorkingPlace] CHECK CONSTRAINT [FK_WorkingPlace_Contacts]
GO
/****** Object:  StoredProcedure [Device].[CreatePackage]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Device].[CreatePackage]
	@StartDateTime datetime,
	@Day tinyint,
	@Hour tinyint,
	@Minute tinyint,
	@Second tinyint,
	@Value binary(960)
AS
BEGIN
	SET NOCOUNT ON;


	INSERT INTO [dbo].[Package]
           ([DeviceSerialNumber]
           ,[RecordStartDateTime]
           ,[Day]
           ,[Hour]
           ,[Minute]
           ,[Second]
           ,[Value])
     VALUES
           (CURRENT_USER
           ,@StartDateTime
           ,@Day
           ,@Hour
           ,@Minute
           ,@Second
           ,@Value)

END
GO
/****** Object:  StoredProcedure [Device].[CreateRecord]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Device].[CreateRecord]
	@StartDateTime datetime
AS
BEGIN
	SET NOCOUNT ON;


	INSERT INTO dbo.Record
           (DeviceSerialNumber
           ,StartDateTime)
     VALUES
           (CURRENT_USER
           ,@StartDateTime)

END
GO
/****** Object:  StoredProcedure [Device].[SetSelfData]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Device].[SetSelfData]
	@SimCardID nvarchar(64),
	@MicroControllerID nvarchar(64),
	@RadioModuleImei nvarchar(64),
	@FirmwareVersion varchar(16),
	@Battery tinyint,
	@RSSI tinyint
AS
BEGIN
	SET NOCOUNT ON;


	UPDATE dbo.Device
	SET [SimCardID] = @SimCardID
      ,[MicroControllerID] = @MicroControllerID
      ,[RadioModuleImei] = @RadioModuleImei
      ,[FirmwareVersion] = @FirmwareVersion
      ,[Battery] = @Battery
      ,[RSSI] = @RSSI
	WHERE SerialNumber = CURRENT_USER

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[GetDeviceCurrentRecord]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[GetDeviceCurrentRecord]
	@DeviceSerialNumber char(9)
AS
BEGIN
	SET NOCOUNT ON;


	SELECT TOP(1) R.DeviceSerialNumber, R.PatientInitials, R.StartDateTime, R.Channel0, R.Channel1, R.Channel2
	FROM dbo.Record AS R
	JOIN dbo.Monitoring AS M ON R.DeviceSerialNumber = M.DeviceSerialNumber
	WHERE R.DeviceSerialNumber = @DeviceSerialNumber AND M.WorkingPlaceName = CURRENT_USER
	ORDER BY R.StartDateTime DESC

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[GetDeviceRecords]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[GetDeviceRecords]
	@DeviceSerialNumber char(9),
	@DateFrom datetime,
	@DateTo datetime
AS
BEGIN
	SET NOCOUNT ON;


	SELECT R.DeviceSerialNumber, R.PatientInitials, R.StartDateTime, R.Channel0, R.Channel1, R.Channel2
	FROM dbo.Record AS R
	JOIN dbo.Monitoring AS M ON R.DeviceSerialNumber = M.DeviceSerialNumber
	WHERE R.DeviceSerialNumber = @DeviceSerialNumber 
		AND M.WorkingPlaceName = CURRENT_USER
		AND R.StartDateTime BETWEEN @DateFrom AND @DateTo

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[GetDevices]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[GetDevices]
AS
BEGIN
	SET NOCOUNT ON;


	SELECT DeviceSerialNumber 
	FROM dbo.Monitoring
	WHERE WorkingPlaceName = CURRENT_USER;

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[SetRecordChannels]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[SetRecordChannels]
	@DeviceSerialNumber char(9),
	@StartDateTime datetime,
	@Channel0 tinyint,
	@Channel1 tinyint,
	@Channel2 tinyint
AS
BEGIN
	SET NOCOUNT ON;


    UPDATE R
    SET R.Channel0 = @Channel0
       ,R.Channel1 = @Channel1
       ,R.Channel2 = @Channel2
    FROM dbo.Record AS R
    JOIN dbo.Monitoring AS M ON R.DeviceSerialNumber = M.DeviceSerialNumber
    WHERE R.DeviceSerialNumber = @DeviceSerialNumber AND R.StartDateTime = @StartDateTime
		AND M.WorkingPlaceName = CURRENT_USER


END
GO
/****** Object:  StoredProcedure [WorkingPlace].[SetRecordPatient]    Script Date: 18.07.2020 10:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[SetRecordPatient]
	@DeviceSerialNumber char(9),
	@StartDateTime datetime,
	@PatientInitials char(3)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	INSERT INTO [dbo].[Patient]
           ([Initials])
     VALUES
           (@PatientInitials)



	UPDATE R
    SET R.Patient = @@IDENTITY
    FROM dbo.Record AS R
    JOIN dbo.Monitoring AS M ON R.DeviceSerialNumber = M.DeviceSerialNumber
    WHERE R.DeviceSerialNumber = @DeviceSerialNumber AND R.StartDateTime = @StartDateTime
		AND M.WorkingPlaceName = CURRENT_USER

	COMMIT TRANSACTION
    


END
GO
