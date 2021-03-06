USE [EcgGlobalMonitoring]
GO
/****** Object:  DatabaseRole [Device]    Script Date: 20.07.2020 20:24:07 ******/
CREATE ROLE [Device]
GO
/****** Object:  DatabaseRole [MajorServiceEngineer]    Script Date: 20.07.2020 20:24:07 ******/
CREATE ROLE [MajorServiceEngineer]
GO
/****** Object:  DatabaseRole [MinorServiceEngineer]    Script Date: 20.07.2020 20:24:07 ******/
CREATE ROLE [MinorServiceEngineer]
GO
/****** Object:  DatabaseRole [WorkingPlace]    Script Date: 20.07.2020 20:24:07 ******/
CREATE ROLE [WorkingPlace]
GO
/****** Object:  Schema [Device]    Script Date: 20.07.2020 20:24:07 ******/
CREATE SCHEMA [Device]
GO
/****** Object:  Schema [MajorServiceEngineer]    Script Date: 20.07.2020 20:24:07 ******/
CREATE SCHEMA [MajorServiceEngineer]
GO
/****** Object:  Schema [ServiceEngineer]    Script Date: 20.07.2020 20:24:07 ******/
CREATE SCHEMA [ServiceEngineer]
GO
/****** Object:  Schema [WorkingPlace]    Script Date: 20.07.2020 20:24:07 ******/
CREATE SCHEMA [WorkingPlace]
GO
/****** Object:  Table [dbo].[Channel]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Channel](
	[Code] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkingPlace] [nvarchar](128) NOT NULL,
	[LastName] [nvarchar](64) NOT NULL,
	[FirstName] [nvarchar](64) NOT NULL,
	[Patronymic] [nvarchar](64) NOT NULL,
	[PhoneNumber] [nvarchar](64) NOT NULL,
	[AdditionalPhoneNumber] [nvarchar](64) NOT NULL,
	[Email] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[SerialNumber] [char](9) NOT NULL,
	[OwningWorkingPlace] [nvarchar](128) NULL,
	[SimCard] [nvarchar](64) NULL,
	[MicroController] [nvarchar](64) NULL,
	[RadioModule] [nvarchar](64) NULL,
	[Firmware] [varchar](16) NULL,
 CONSTRAINT [PK_dbo.Device] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firmware]    Script Date: 20.07.2020 20:24:07 ******/
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
/****** Object:  Table [dbo].[Measurement]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[Device] [char](9) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Battery] [tinyint] NOT NULL,
	[RSSI] [tinyint] NOT NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MicroController]    Script Date: 20.07.2020 20:24:07 ******/
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
/****** Object:  Table [dbo].[Monitoring]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monitoring](
	[Device] [char](9) NOT NULL,
	[WorkingPlace] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Monitoring] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[WorkingPlace] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[Device] [char](9) NOT NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[Minute] [tinyint] NOT NULL,
	[Value] [binary](8000) NOT NULL,
 CONSTRAINT [PK_Package_1] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[RecordStartDateTime] ASC,
	[Minute] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package_InMemory]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package_InMemory]
(
	[Device] [char](9) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[RecordStartDateTime] [datetime] NOT NULL,
	[Minute] [int] NOT NULL,
	[Value] [binary](8000) NOT NULL,

 CONSTRAINT [Package_InMemory_primaryKey]  PRIMARY KEY NONCLUSTERED 
(
	[Device] DESC,
	[RecordStartDateTime] DESC,
	[Minute] DESC
)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 20.07.2020 20:24:07 ******/
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
/****** Object:  Table [dbo].[RadioModule]    Script Date: 20.07.2020 20:24:07 ******/
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
/****** Object:  Table [dbo].[Record]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[Device] [char](9) NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[Patient] [int] NULL,
	[Channel0] [varchar](3) NOT NULL,
	[Channel1] [varchar](3) NOT NULL,
	[Channel2] [varchar](3) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[Device] ASC,
	[StartDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SimCard]    Script Date: 20.07.2020 20:24:07 ******/
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
/****** Object:  Table [dbo].[WorkingPlace]    Script Date: 20.07.2020 20:24:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingPlace](
	[Name] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.WorkingPlace] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Channel] ([Code]) VALUES (N'-')
INSERT [dbo].[Channel] ([Code]) VALUES (N'A')
INSERT [dbo].[Channel] ([Code]) VALUES (N'avF')
INSERT [dbo].[Channel] ([Code]) VALUES (N'avL')
INSERT [dbo].[Channel] ([Code]) VALUES (N'avR')
INSERT [dbo].[Channel] ([Code]) VALUES (N'D')
INSERT [dbo].[Channel] ([Code]) VALUES (N'I')
INSERT [dbo].[Channel] ([Code]) VALUES (N'Stm')
INSERT [dbo].[Channel] ([Code]) VALUES (N'V1')
INSERT [dbo].[Channel] ([Code]) VALUES (N'V2')
INSERT [dbo].[Channel] ([Code]) VALUES (N'V3')
INSERT [dbo].[Channel] ([Code]) VALUES (N'V4')
INSERT [dbo].[Channel] ([Code]) VALUES (N'V5')
INSERT [dbo].[Channel] ([Code]) VALUES (N'V6')
INSERT [dbo].[Channel] ([Code]) VALUES (N'X')
INSERT [dbo].[Channel] ([Code]) VALUES (N'Y')
INSERT [dbo].[Channel] ([Code]) VALUES (N'Z')
INSERT [dbo].[WorkingPlace] ([Name]) VALUES (N'База')
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_LastName]  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_FirstName]  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_Patronymic]  DEFAULT ('') FOR [Patronymic]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_PhoneNumber]  DEFAULT ('') FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_AdditionalPhoneNumber]  DEFAULT ('') FOR [AdditionalPhoneNumber]
GO
ALTER TABLE [dbo].[Contacts] ADD  CONSTRAINT [DF_Contacts_Email]  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_Channel0]  DEFAULT ((0)) FOR [Channel0]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_Channel1]  DEFAULT ((0)) FOR [Channel1]
GO
ALTER TABLE [dbo].[Record] ADD  CONSTRAINT [DF_Record_Channel2]  DEFAULT ((0)) FOR [Channel2]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_WorkingPlace] FOREIGN KEY([WorkingPlace])
REFERENCES [dbo].[WorkingPlace] ([Name])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_WorkingPlace]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Device_dbo.MicroController_MicroControllerID] FOREIGN KEY([MicroController])
REFERENCES [dbo].[MicroController] ([ID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_dbo.Device_dbo.MicroController_MicroControllerID]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Device_dbo.RadioModule_RadioModuleImei] FOREIGN KEY([RadioModule])
REFERENCES [dbo].[RadioModule] ([Imei])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_dbo.Device_dbo.RadioModule_RadioModuleImei]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Device_dbo.SimCard_SimCardID] FOREIGN KEY([SimCard])
REFERENCES [dbo].[SimCard] ([ID])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_dbo.Device_dbo.SimCard_SimCardID]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Firmware] FOREIGN KEY([Firmware])
REFERENCES [dbo].[Firmware] ([Version])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_Firmware]
GO
ALTER TABLE [dbo].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_WorkingPlace] FOREIGN KEY([OwningWorkingPlace])
REFERENCES [dbo].[WorkingPlace] ([Name])
GO
ALTER TABLE [dbo].[Device] CHECK CONSTRAINT [FK_Device_WorkingPlace]
GO
ALTER TABLE [dbo].[Measurement]  WITH CHECK ADD  CONSTRAINT [FK_Measurement_Device] FOREIGN KEY([Device])
REFERENCES [dbo].[Device] ([SerialNumber])
GO
ALTER TABLE [dbo].[Measurement] CHECK CONSTRAINT [FK_Measurement_Device]
GO
ALTER TABLE [dbo].[Monitoring]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Monitoring_dbo.Device_DeviceSerialNumber] FOREIGN KEY([Device])
REFERENCES [dbo].[Device] ([SerialNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Monitoring] CHECK CONSTRAINT [FK_dbo.Monitoring_dbo.Device_DeviceSerialNumber]
GO
ALTER TABLE [dbo].[Monitoring]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Monitoring_dbo.WorkingPlace_WorkingPlaceName] FOREIGN KEY([WorkingPlace])
REFERENCES [dbo].[WorkingPlace] ([Name])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Monitoring] CHECK CONSTRAINT [FK_dbo.Monitoring_dbo.WorkingPlace_WorkingPlaceName]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Record] FOREIGN KEY([Device], [RecordStartDateTime])
REFERENCES [dbo].[Record] ([Device], [StartDateTime])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Record]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Record_dbo.Device_DeviceSerialNumber] FOREIGN KEY([Device])
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
/****** Object:  StoredProcedure [Device].[AddMeasurement]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Device].[AddMeasurement]
	@DateTime datetime
   ,@Battery tinyint
   ,@RSSI tinyint
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Measurement]
           (Device
           ,DateTime
           ,Battery
           ,RSSI)
     VALUES
           (CURRENT_USER
           ,@DateTime
           ,@Battery
           ,@RSSI)


END
GO
/****** Object:  StoredProcedure [Device].[AddPackage]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Device].[AddPackage]
	@Device char(9)
   ,@RecordStartDateTime datetime
   ,@Minute int
   ,@Value binary(8000)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Package]
           (Device
           ,RecordStartDateTime
           ,Minute
           ,Value)
     VALUES
           (@Device
           ,@RecordStartDateTime
           ,@Minute
           ,@Value)


	IF @@ERROR = '' 
	BEGIN


		INSERT INTO [dbo].[Package_InMemory]
			   (Device
			   ,RecordStartDateTime
			   ,Minute
			   ,Value)
		 VALUES
			   (@Device
			   ,@RecordStartDateTime
			   ,@Minute
			   ,@Value)
	END

END
GO
/****** Object:  StoredProcedure [Device].[SetHardware]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Device].[SetHardware]
	@SimCard nvarchar(64),
	@MicroController nvarchar(64),
	@RadioModule nvarchar(64),
	@Firmware varchar(16)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	INSERT INTO dbo.SimCard
           (ID)
     VALUES
           (@SimCard)

	INSERT INTO dbo.MicroController
           (ID)
     VALUES
           (@MicroController)

	INSERT INTO dbo.RadioModule
           (Imei)
     VALUES
           (@RadioModule)

	INSERT INTO dbo.Firmware
           (Version)
     VALUES
           (@Firmware)

	UPDATE dbo.Device
	SET SimCard = NULL
	WHERE SimCard = @SimCard AND SerialNumber != CURRENT_USER

	UPDATE dbo.Device
	SET MicroController = NULL
	WHERE MicroController = @MicroController AND SerialNumber != CURRENT_USER

	UPDATE dbo.Device
	SET RadioModule = NULL
	WHERE RadioModule = @RadioModule AND SerialNumber != CURRENT_USER

	UPDATE dbo.Device
	SET SimCard = @SimCard
      ,MicroController = @MicroController
      ,RadioModule = @RadioModule
      ,Firmware = @Firmware
	WHERE SerialNumber = CURRENT_USER

	COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [MajorServiceEngineer].[AddDevice]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [MajorServiceEngineer].[AddDevice]
	@SerialNumber char(9),
	@Password nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	DECLARE @queryLogin nvarchar(64) = N'CREATE LOGIN ' + @SerialNumber 
		+ ' WITH PASSWORD = ''' + @Password + '''; ';

	EXEC sp_executesql @queryLogin;

	IF @@ERROR <> '' ROLLBACK TRANSACTION

	DECLARE @queryUser nvarchar(64) = N'CREATE USER ' + @SerialNumber 
		+ ' FROM LOGIN ' + @SerialNumber;

	EXEC sp_executesql @queryUser;

	IF @@ERROR <> '' ROLLBACK TRANSACTION

	EXEC sp_addrolemember 'Device', @SerialNumber

	INSERT INTO dbo.Device
            (SerialNumber)
     VALUES 
			(@SerialNumber)

	IF @@ERROR <> '' ROLLBACK TRANSACTION

	COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [MajorServiceEngineer].[AddWorkingPlace]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [MajorServiceEngineer].[AddWorkingPlace]
	@WorkingPlaceName char(9),
	@Password nvarchar(64)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	DECLARE @queryLogin nvarchar(64) = N'CREATE LOGIN ' + @WorkingPlaceName 
		+ ' WITH PASSWORD = ''' + @Password + '''; ';

	EXEC sp_executesql @queryLogin;

	IF @@ERROR <> '' ROLLBACK TRANSACTION

	DECLARE @queryUser nvarchar(64) = N'CREATE USER ' + @WorkingPlaceName 
		+ ' FROM LOGIN ' + @WorkingPlaceName;

	EXEC sp_executesql @queryUser;

	IF @@ERROR <> '' ROLLBACK TRANSACTION

	EXEC sp_addrolemember 'WorkingPlace', @WorkingPlaceName

	INSERT INTO dbo.WorkingPlace
            (Name)
     VALUES 
			(@WorkingPlaceName)

	IF @@ERROR <> '' ROLLBACK TRANSACTION

	COMMIT TRANSACTION

END
GO
/****** Object:  StoredProcedure [ServiceEngineer].[GetDeviceCurrentRecord]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ServiceEngineer].[GetDeviceCurrentRecord]
	@Device char(9)
AS
BEGIN
	SET NOCOUNT ON;


	SELECT TOP(1) R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2, R.IsActive
		, isnull(MAX(P.Minute) + 1, 0) AS RecordLength
	FROM dbo.Record AS R
	LEFT OUTER JOIN dbo.Patient AS Pat ON R.Patient = Pat.ID
	LEFT OUTER JOIN dbo.Package AS P ON P.Device = R.Device AND P.RecordStartDateTime = R.StartDateTime
	WHERE R.Device = @Device
	GROUP BY R.Device, R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2, R.IsActive
	ORDER BY R.StartDateTime DESC

END
GO
/****** Object:  StoredProcedure [ServiceEngineer].[GetDeviceRecords]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ServiceEngineer].[GetDeviceRecords]
	@Device char(9),
	@DateFrom datetime,
	@DateTo datetime
AS
BEGIN
	SET NOCOUNT ON;

	SELECT R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2, R.IsActive
		, isnull(MAX(P.Minute) + 1, 0) AS RecordLength
	FROM dbo.Record AS R
	LEFT OUTER JOIN dbo.Patient AS Pat ON R.Patient = Pat.ID
	LEFT OUTER JOIN dbo.Package AS P ON P.Device = R.Device AND P.RecordStartDateTime = R.StartDateTime
	WHERE R.Device = @Device  AND R.StartDateTime BETWEEN @DateFrom AND @DateTo
	GROUP BY R.Device, R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2, R.IsActive

END
GO
/****** Object:  StoredProcedure [ServiceEngineer].[SetDeviceOwningWorkingPlace]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ServiceEngineer].[SetDeviceOwningWorkingPlace]
	@Device char(9),
	@OwningWorkingPlace nvarchar(128)
AS
BEGIN
	SET NOCOUNT ON;


	UPDATE dbo.Device
    SET OwningWorkingPlace = @OwningWorkingPlace
	WHERE SerialNumber = @Device

END
GO
/****** Object:  StoredProcedure [ServiceEngineer].[SetRecordIsActive]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [ServiceEngineer].[SetRecordIsActive]
	@Device char(9),
	@RecordStartDateTime datetime,
	@IsActive bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Record
	SET IsActive = @IsActive
	WHERE Device = @Device AND StartDateTime = @RecordStartDateTime

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[GetDeviceCurrentRecord]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[GetDeviceCurrentRecord]
	@Device char(9)
AS
BEGIN
	SET NOCOUNT ON;


	SELECT TOP(1) R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2
		, isnull(MAX(P.Minute) + 1, 0) AS RecordLength
	FROM dbo.Record AS R
	JOIN dbo.Monitoring AS M ON R.Device = M.Device
	LEFT OUTER JOIN dbo.Patient AS Pat ON R.Patient = Pat.ID
	LEFT OUTER JOIN dbo.Package AS P ON P.Device = R.Device AND P.RecordStartDateTime = R.StartDateTime
	WHERE R.Device = @Device AND M.WorkingPlace = CURRENT_USER AND R.IsActive = 1
	GROUP BY R.Device, R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2
	ORDER BY R.StartDateTime DESC

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[GetDeviceRecords]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[GetDeviceRecords]
	@Device char(9),
	@DateFrom datetime,
	@DateTo datetime
AS
BEGIN
	SET NOCOUNT ON;



	SELECT R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2
		, isnull(MAX(P.Minute) + 1, 0) AS RecordLength
	FROM dbo.Record AS R
	JOIN dbo.Monitoring AS M ON R.Device = M.Device
	LEFT OUTER JOIN dbo.Patient AS Pat ON R.Patient = Pat.ID
	LEFT OUTER JOIN dbo.Package AS P ON P.Device = R.Device AND P.RecordStartDateTime = R.StartDateTime
	WHERE R.Device = @Device  AND R.StartDateTime BETWEEN @DateFrom AND @DateTo
		AND M.WorkingPlace = CURRENT_USER
	GROUP BY R.Device, R.StartDateTime, Pat.Initials, R.Channel0, R.Channel1, R.Channel2


END
GO
/****** Object:  StoredProcedure [WorkingPlace].[GetDevices]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[GetDevices]
AS
BEGIN
	SET NOCOUNT ON;


	SELECT D.SerialNumber
	FROM dbo.Monitoring AS M
	JOIN dbo.Device AS D ON M.Device = D.SerialNumber
	WHERE M.WorkingPlace = CURRENT_USER;

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[GetRecordPackage]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [WorkingPlace].[GetRecordPackage]
	@Device char(9),
	@RecordStartDateTime datetime,
	@Minute int
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM dbo.Monitoring WHERE Device = @Device AND WorkingPlace = CURRENT_USER)
		AND EXISTS(SELECT 1 FROM dbo.Record WHERE Device = @Device AND StartDateTime = @RecordStartDateTime
			AND IsActive = 1)
	BEGIN

		DECLARE @UseOnlyDiskTable bit = 1;


		IF DATEADD(minute, @Minute, @RecordStartDateTime) < DATEADD(day, -7, GETDATE()) /*Полагаем, что пакеты недельной давности уже отсутствуют в In-Memory таблице*/
		BEGIN

			SET @UseOnlyDiskTable = 0;

			SELECT P.Value
			FROM dbo.Package_InMemory AS P
			WHERE P.Device = @Device AND P.RecordStartDateTime = @RecordStartDateTime
				AND P.Minute = @Minute

		END


		IF (@UseOnlyDiskTable = 1 OR @@ROWCOUNT = 0)
		BEGIN
			SELECT P.Value
			FROM dbo.Package AS P
			WHERE P.Device = @Device AND P.RecordStartDateTime = @RecordStartDateTime
				AND P.Minute = @Minute
		END
	END

END
GO
/****** Object:  StoredProcedure [WorkingPlace].[SetRecordChannels]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[SetRecordChannels]
	@Device char(9),
	@StartDateTime datetime,
	@Channel0 tinyint,
	@Channel1 tinyint,
	@Channel2 tinyint
AS
BEGIN



    UPDATE R
    SET R.Channel0 = @Channel0
       ,R.Channel1 = @Channel1
       ,R.Channel2 = @Channel2
    FROM dbo.Record AS R
    JOIN dbo.Monitoring AS M ON R.Device = M.Device
    WHERE R.Device = @Device AND R.StartDateTime = @StartDateTime AND R.IsActive = 1
		AND M.WorkingPlace = CURRENT_USER


END
GO
/****** Object:  StoredProcedure [WorkingPlace].[SetRecordPatient]    Script Date: 20.07.2020 20:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [WorkingPlace].[SetRecordPatient]
	@Device char(9),
	@StartDateTime datetime,
	@PatientInitials char(3)
AS
BEGIN


	BEGIN TRANSACTION

	INSERT INTO [dbo].[Patient]
           ([Initials])
     VALUES
           (@PatientInitials)



	UPDATE R
    SET R.Patient = @@IDENTITY
    FROM dbo.Record AS R
    JOIN dbo.Monitoring AS M ON R.Device= M.Device
    WHERE R.Device= @Device AND R.StartDateTime = @StartDateTime AND R.IsActive = 1
		AND M.WorkingPlace= CURRENT_USER

	COMMIT TRANSACTION
    


END
GO
