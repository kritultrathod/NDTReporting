USE [artha]
GO
/****** Object:  User [teamarth_Vikram]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_Vikram] FOR LOGIN [teamarth_Vikram] WITH DEFAULT_SCHEMA=[NDT_POC]
GO
/****** Object:  User [teamarth_sa]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_sa] FOR LOGIN [teamarth_sa] WITH DEFAULT_SCHEMA=[teamarth_sa]
GO
/****** Object:  User [teamarth_Ritesh]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_Ritesh] FOR LOGIN [teamarth_Ritesh] WITH DEFAULT_SCHEMA=[NDT_POC]
GO
/****** Object:  User [teamarth_Piyush]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_Piyush] FOR LOGIN [teamarth_Piyush] WITH DEFAULT_SCHEMA=[NDT_POC]
GO
/****** Object:  User [teamarth_NDT]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_NDT] FOR LOGIN [teamarth_NDT] WITH DEFAULT_SCHEMA=[teamarth_NDT]
GO
/****** Object:  User [teamarth_Kritul]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_Kritul] FOR LOGIN [teamarth_Kritul] WITH DEFAULT_SCHEMA=[NDT_POC]
GO
/****** Object:  User [teamarth_kalpesh]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_kalpesh] FOR LOGIN [teamarth_kalpesh] WITH DEFAULT_SCHEMA=[NDT_POC]
GO
/****** Object:  User [teamarth_Hitesh]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_Hitesh] FOR LOGIN [teamarth_Hitesh] WITH DEFAULT_SCHEMA=[teamarth_Hitesh]
GO
/****** Object:  User [teamarth_EFW]    Script Date: 12/09/2012 13:19:51 ******/
CREATE USER [teamarth_EFW] FOR LOGIN [teamarth_EFW] WITH DEFAULT_SCHEMA=[teamarth_EFW]
GO
/****** Object:  Schema [teamarth_Vikram]    Script Date: 12/09/2012 13:19:52 ******/
CREATE SCHEMA [teamarth_Vikram] AUTHORIZATION [teamarth_Vikram]
GO
/****** Object:  Schema [teamarth_sa]    Script Date: 12/09/2012 13:19:54 ******/
CREATE SCHEMA [teamarth_sa] AUTHORIZATION [teamarth_Kritul]
GO
/****** Object:  Schema [teamarth_Ritesh]    Script Date: 12/09/2012 13:19:54 ******/
CREATE SCHEMA [teamarth_Ritesh] AUTHORIZATION [teamarth_Ritesh]
GO
/****** Object:  Schema [teamarth_Piyush]    Script Date: 12/09/2012 13:19:55 ******/
CREATE SCHEMA [teamarth_Piyush] AUTHORIZATION [teamarth_Piyush]
GO
/****** Object:  Schema [teamarth_NDT]    Script Date: 12/09/2012 13:19:57 ******/
CREATE SCHEMA [teamarth_NDT] AUTHORIZATION [teamarth_Kritul]
GO
/****** Object:  Schema [teamarth_Kritul]    Script Date: 12/09/2012 13:19:57 ******/
CREATE SCHEMA [teamarth_Kritul] AUTHORIZATION [teamarth_Kritul]
GO
/****** Object:  Schema [teamarth_kalpesh]    Script Date: 12/09/2012 13:19:58 ******/
CREATE SCHEMA [teamarth_kalpesh] AUTHORIZATION [teamarth_kalpesh]
GO
/****** Object:  Schema [teamarth_Hitesh]    Script Date: 12/09/2012 13:19:58 ******/
CREATE SCHEMA [teamarth_Hitesh] AUTHORIZATION [teamarth_Hitesh]
GO
/****** Object:  Schema [teamarth_EFW]    Script Date: 12/09/2012 13:20:00 ******/
CREATE SCHEMA [teamarth_EFW] AUTHORIZATION [teamarth_Kritul]
GO
/****** Object:  Schema [NDT_POC]    Script Date: 12/09/2012 13:20:00 ******/
CREATE SCHEMA [NDT_POC] AUTHORIZATION [teamarth_Kritul]
GO
/****** Object:  Schema [NDT]    Script Date: 12/09/2012 13:20:01 ******/
CREATE SCHEMA [NDT] AUTHORIZATION [teamarth_Kritul]
GO
/****** Object:  Schema [MiEFW]    Script Date: 12/09/2012 13:20:03 ******/
CREATE SCHEMA [MiEFW] AUTHORIZATION [teamarth_Kritul]
GO
/****** Object:  StoredProcedure [teamarth_EFW].[Demo_ClsDataManager]    Script Date: 12/09/2012 13:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kalpesh
-- Create date: 29 Sept 2012
-- Description:	demo sp to test the Cls Class Manager
-- exec Demo_ClsDataManager 'U' 
-- =============================================
CREATE PROCEDURE [teamarth_EFW].[Demo_ClsDataManager] 
	-- Add the parameters for the stored procedure here
	@OjectType nchar(2) = 'U'	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from sysobjects where xtype = @OjectType 
	
	/*
	sp_help sysobjects
	select convert(datetime,crdate,104) as 'Create DAte' from sysobjects
	
	*/
	
END
GO
/****** Object:  Table [dbo].[WeldType]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WeldType](
	[WeldTypeId] [int] IDENTITY(1,1) NOT NULL,
	[WeldType] [varchar](50) NOT NULL,
	[WeldingMethod] [varchar](100) NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RefDocuments]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefDocuments](
	[RefDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[SubTestId] [int] NOT NULL,
	[Code] [nvarchar](100) NULL,
	[TestSpecification] [nvarchar](100) NULL,
	[TestProcedureNo] [nvarchar](100) NULL,
	[AcceptanceStandard] [nvarchar](100) NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RefDocuments] ON
INSERT [dbo].[RefDocuments] ([RefDocumentId], [SubTestId], [Code], [TestSpecification], [TestProcedureNo], [AcceptanceStandard], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (1, 1, N'ASTM for Radiogrphy of Weld', N'ASTM Sec V Article II', N'Co/RT/01', N'ASTM Reference Radiographs', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[RefDocuments] ([RefDocumentId], [SubTestId], [Code], [TestSpecification], [TestProcedureNo], [AcceptanceStandard], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (2, 2, N'ASTM for Radiography of Casting', N'ASTM Sec V Article VII', N'Co/RT/02', N'ASTM Reference Radiograph', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[RefDocuments] ([RefDocumentId], [SubTestId], [Code], [TestSpecification], [TestProcedureNo], [AcceptanceStandard], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (3, 3, N'ASME for UT of Weld', N'ASME Sec V 2001', N'Co/UT/Weld/01', N'ASTM SA 388', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[RefDocuments] OFF
/****** Object:  Table [dbo].[users]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[emailid] [nvarchar](50) NOT NULL,
	[userpassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [users_userid_PK] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [users_emailid_UK] UNIQUE NONCLUSTERED 
(
	[emailid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([userid], [emailid], [userpassword]) VALUES (1, N'xyz@gmail.com', N'9999')
INSERT [dbo].[users] ([userid], [emailid], [userpassword]) VALUES (2, N'artha@gmail.com', N'1234')
INSERT [dbo].[users] ([userid], [emailid], [userpassword]) VALUES (3, N'hitesh@gmail.com', N'12345')
INSERT [dbo].[users] ([userid], [emailid], [userpassword]) VALUES (4, N'abc@gmail.com', N'1212')
INSERT [dbo].[users] ([userid], [emailid], [userpassword]) VALUES (5, N'artha@yahoo.com', N'10000')
INSERT [dbo].[users] ([userid], [emailid], [userpassword]) VALUES (6, N'sachin@hotmail.com', N'222222')
INSERT [dbo].[users] ([userid], [emailid], [userpassword]) VALUES (7, N'aa@bb.com', N'123')
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [NDT_POC].[Txn_ReportData]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NDT_POC].[Txn_ReportData](
	[autoid] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateID] [int] NULL,
	[ReportID] [int] NULL,
	[ClientID] [int] NULL,
	[AppID] [int] NULL,
	[RecordID] [int] NULL,
	[FieldID] [int] NULL,
	[FieldValue] [nvarchar](4000) NULL,
	[LastModifiedBy] [nvarchar](200) NULL,
	[LastModifiedDt] [datetime] NULL,
 CONSTRAINT [PK_Txn_ReportData] PRIMARY KEY CLUSTERED 
(
	[autoid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [idx_reportData] ON [NDT_POC].[Txn_ReportData] 
(
	[RecordID] ASC,
	[FieldID] ASC,
	[LastModifiedBy] ASC,
	[LastModifiedDt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [NDT_POC].[Txn_ReportData] ON
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (1, 1, 1, 1, 1, 1, 3, N'Artha', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (2, 1, 1, 1, 1, 1, 4, N'Jogeshwari', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (3, 1, 1, 1, 1, 1, 5, N'Kalpesh', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (4, 1, 1, 1, 1, 1, 6, N'AABB01', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (5, 1, 1, 1, 1, 1, 7, N'12345', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (6, 1, 1, 1, 1, 1, 8, N'test', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (7, 1, 1, 1, 1, 1, 10, N'20120915', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (8, 1, 1, 1, 1, 1, 11, N'mat Spec', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (9, 1, 1, 1, 1, 1, 12, N'Weld type', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (10, 1, 1, 1, 1, 1, 13, N'Sur Cond', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (11, 1, 1, 1, 1, 1, 14, N'Weld Prep', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (12, 1, 1, 1, 1, 1, 15, N'ext Exam', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (13, 1, 1, 1, 1, 1, 16, N'welding Method', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (14, 1, 1, 1, 1, 1, 17, N'test litmus', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (15, 1, 1, 1, 1, 1, 18, N'stg o Exm', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (16, 1, 1, 1, 1, 1, 19, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (17, 1, 1, 1, 1, 1, 20, N'ASME Sec V (2001) Article 2', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (18, 1, 1, 1, 1, 1, 21, N'GISPL/RT/', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (19, 1, 1, 1, 1, 1, 22, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (20, 1, 1, 1, 1, 1, 23, N'Gamma Ray Source', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (21, 1, 1, 1, 1, 1, 24, N'Ir-192', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (22, 1, 1, 1, 1, 1, 25, N'2x2 mm', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (23, 1, 1, 1, 1, 1, 26, N'Inches', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (24, 1, 1, 1, 1, 1, 27, N'CL', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (25, 1, 1, 1, 1, 1, 28, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (26, 1, 1, 1, 1, 1, 29, N'X-Ray Machine Details', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (27, 1, 1, 1, 1, 1, 30, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (28, 1, 1, 1, 1, 1, 31, N'mm', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (29, 1, 1, 1, 1, 1, 32, N'Inchse', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (30, 1, 1, 1, 1, 1, 33, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (31, 1, 1, 1, 1, 1, 34, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (32, 1, 1, 1, 1, 1, 35, N'ASMET T-276', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (33, 1, 1, 1, 1, 1, 36, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (34, 1, 1, 1, 1, 1, 37, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (35, 1, 1, 1, 1, 1, 38, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (36, 1, 1, 1, 1, 1, 39, N'ASTM', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (37, 1, 1, 1, 1, 1, 40, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (38, 1, 1, 1, 1, 1, 41, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (39, 1, 1, 1, 1, 1, 42, N'mm', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (40, 1, 1, 1, 1, 1, 43, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (41, 1, 1, 1, 1, 1, 44, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (42, 1, 1, 1, 1, 1, 45, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (43, 1, 1, 1, 1, 1, 46, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (44, 1, 1, 1, 1, 1, 47, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (45, 1, 1, 1, 1, 1, 48, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (46, 1, 1, 1, 1, 1, 49, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (47, 1, 1, 1, 1, 1, 50, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (48, 1, 1, 1, 1, 1, 51, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (49, 1, 1, 1, 1, 1, 52, N'', N'mistryk', CAST(0x0000A0CE007BBF4C AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (50, 1, 1, 1, 1, 1, 53, N'', N'mistryk', CAST(0x0000A0CE007C1154 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (51, 1, 1, 1, 1, 2, 3, N'Acentria', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (52, 1, 1, 1, 1, 2, 4, N'Bandra', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (53, 1, 1, 1, 1, 2, 5, N'Vikram', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (54, 1, 1, 1, 1, 2, 6, N'AABB02', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (55, 1, 1, 1, 1, 2, 7, N'12345', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (56, 1, 1, 1, 1, 2, 8, N'test', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (57, 1, 1, 1, 1, 2, 10, N'20120915', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (58, 1, 1, 1, 1, 2, 11, N'mat Spec', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (59, 1, 1, 1, 1, 2, 12, N'Weld type', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (60, 1, 1, 1, 1, 2, 13, N'Sur Cond', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (61, 1, 1, 1, 1, 2, 14, N'Weld Prep', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (62, 1, 1, 1, 1, 2, 15, N'ext Exam', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (63, 1, 1, 1, 1, 2, 16, N'welding Method', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (64, 1, 1, 1, 1, 2, 17, N'test litmus', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (65, 1, 1, 1, 1, 2, 18, N'stg o Exm', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (66, 1, 1, 1, 1, 2, 19, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (67, 1, 1, 1, 1, 2, 20, N'ASME Sec V (2001) Article 2', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (68, 1, 1, 1, 1, 2, 21, N'GISPL/RT/', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (69, 1, 1, 1, 1, 2, 22, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (70, 1, 1, 1, 1, 2, 23, N'Gamma Ray Source', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (71, 1, 1, 1, 1, 2, 24, N'Ir-192', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (72, 1, 1, 1, 1, 2, 25, N'2x2 mm', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (73, 1, 1, 1, 1, 2, 26, N'Inches', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (74, 1, 1, 1, 1, 2, 27, N'CL', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (75, 1, 1, 1, 1, 2, 28, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (76, 1, 1, 1, 1, 2, 29, N'X-Ray Machine Details', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (77, 1, 1, 1, 1, 2, 30, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (78, 1, 1, 1, 1, 2, 31, N'mm', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (79, 1, 1, 1, 1, 2, 32, N'Inchse', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (80, 1, 1, 1, 1, 2, 33, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (81, 1, 1, 1, 1, 2, 34, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (82, 1, 1, 1, 1, 2, 35, N'ASMET T-276', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (83, 1, 1, 1, 1, 2, 36, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (84, 1, 1, 1, 1, 2, 37, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (85, 1, 1, 1, 1, 2, 38, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (86, 1, 1, 1, 1, 2, 39, N'ASTM', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (87, 1, 1, 1, 1, 2, 40, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (88, 1, 1, 1, 1, 2, 41, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (89, 1, 1, 1, 1, 2, 42, N'mm', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (90, 1, 1, 1, 1, 2, 43, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (91, 1, 1, 1, 1, 2, 44, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (92, 1, 1, 1, 1, 2, 45, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (93, 1, 1, 1, 1, 2, 46, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (94, 1, 1, 1, 1, 2, 47, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (95, 1, 1, 1, 1, 2, 48, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (96, 1, 1, 1, 1, 2, 49, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (97, 1, 1, 1, 1, 2, 50, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (98, 1, 1, 1, 1, 2, 51, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (99, 1, 1, 1, 1, 2, 52, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
INSERT [NDT_POC].[Txn_ReportData] ([autoid], [TemplateID], [ReportID], [ClientID], [AppID], [RecordID], [FieldID], [FieldValue], [LastModifiedBy], [LastModifiedDt]) VALUES (100, 1, 1, 1, 1, 2, 53, N'', N'mistryk', CAST(0x0000A0CE0080C028 AS DateTime))
GO
print 'Processed 100 total records'
SET IDENTITY_INSERT [NDT_POC].[Txn_ReportData] OFF
/****** Object:  Table [dbo].[Test]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](100) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Test] ON
INSERT [dbo].[Test] ([TestId], [TestName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (1, N'Radiographic Examination', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Test] ([TestId], [TestName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (2, N'Ultrasonic Examination', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Test] OFF
/****** Object:  Table [dbo].[Techniques]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Techniques](
	[TechniqueId] [int] IDENTITY(1,1) NOT NULL,
	[SubTestId] [int] NOT NULL,
	[TechniqueShortName] [varchar](50) NULL,
	[TechniqueName] [varchar](100) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Techniques] ON
INSERT [dbo].[Techniques] ([TechniqueId], [SubTestId], [TechniqueShortName], [TechniqueName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (1, 1, N'DWSI', N'Double Wall Single Image', CAST(0xA06E0000 AS SmallDateTime), 1, CAST(0xA06E0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Techniques] ([TechniqueId], [SubTestId], [TechniqueShortName], [TechniqueName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (2, 1, N'DWDI', N'Double Wall Double Image', CAST(0xA06E0000 AS SmallDateTime), 1, CAST(0xA06E0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Techniques] ([TechniqueId], [SubTestId], [TechniqueShortName], [TechniqueName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (3, 2, N'SWSI', N'Single Wall Single Image', CAST(0xA06E0000 AS SmallDateTime), 1, CAST(0xA06E0000 AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Techniques] OFF
/****** Object:  Table [dbo].[SubTest]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubTest](
	[SubTestId] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[SubTestName] [nvarchar](100) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SubTest] ON
INSERT [dbo].[SubTest] ([SubTestId], [TestId], [SubTestName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (1, 1, N'Welded Joints', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[SubTest] ([SubTestId], [TestId], [SubTestName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (2, 1, N'Castings', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[SubTest] ([SubTestId], [TestId], [SubTestName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (3, 2, N'Welded Joints', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[SubTest] ([SubTestId], [TestId], [SubTestName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (4, 2, N'Forging', CAST(0xA04F0000 AS SmallDateTime), 1, CAST(0xA04F0000 AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[SubTest] OFF
/****** Object:  Table [MiEFW].[SPManager_ProcMaster]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MiEFW].[SPManager_ProcMaster](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [nvarchar](30) NOT NULL,
	[ClientID] [nvarchar](30) NOT NULL,
	[AppID] [nvarchar](30) NOT NULL,
	[SPName] [nvarchar](255) NOT NULL,
	[ReportName] [nvarchar](300) NOT NULL,
	[ReportDescr] [nvarchar](4000) NULL,
	[ShowInReportListing] [nchar](3) NULL,
	[SPInstructions] [nvarchar](4000) NULL,
	[modifiedby] [nvarchar](30) NULL,
	[modifiedDt] [datetime] NULL,
	[deleted] [nchar](3) NULL,
 CONSTRAINT [PK_SPManager_ProcMaster] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [MiEFW].[SPManager_ProcMaster] ON
INSERT [MiEFW].[SPManager_ProcMaster] ([autoid], [StoreID], [ClientID], [AppID], [SPName], [ReportName], [ReportDescr], [ShowInReportListing], [SPInstructions], [modifiedby], [modifiedDt], [deleted]) VALUES (1, N'Demo_DataMnager', N'Artha', N'MiEFW', N'Demo_ClsDataManager', N'Sys Objects', N'Get All objects by xType', N'Y  ', N'Pass xtype as char', N'kalpesh', CAST(0x0000A0DB00000000 AS DateTime), N'N  ')
SET IDENTITY_INSERT [MiEFW].[SPManager_ProcMaster] OFF
/****** Object:  Table [MiEFW].[SPManager_ParameterMaster]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MiEFW].[SPManager_ParameterMaster](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[storeID] [nvarchar](30) NOT NULL,
	[ParaName] [nvarchar](255) NOT NULL,
	[ParaDataType] [int] NOT NULL,
	[ParaDataSize] [int] NOT NULL,
	[ParaDirection] [int] NOT NULL,
	[ParaDefaultVal] [nvarchar](3000) NULL,
	[ParaDescr] [nvarchar](2000) NULL,
	[modifiedby] [nvarchar](30) NULL,
	[modifieddt] [datetime] NULL,
	[deleted] [nchar](3) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [MiEFW].[SPManager_ParameterMaster] ON
INSERT [MiEFW].[SPManager_ParameterMaster] ([autoid], [storeID], [ParaName], [ParaDataType], [ParaDataSize], [ParaDirection], [ParaDefaultVal], [ParaDescr], [modifiedby], [modifieddt], [deleted]) VALUES (1, N'Demo_DataMnager', N'@OjectType', 12, 2, 1, N'U', N'xtype - Object Type', N'kalpesh', CAST(0x0000A0DB00000000 AS DateTime), N'N  ')
SET IDENTITY_INSERT [MiEFW].[SPManager_ParameterMaster] OFF
/****** Object:  Table [dbo].[RadiographicWeld]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RadiographicWeld](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Client] [nvarchar](200) NULL,
	[Location] [nvarchar](200) NULL,
	[ContactPerson] [nvarchar](200) NULL,
	[TestReportNumber] [nvarchar](50) NULL,
	[JobDescription] [nvarchar](500) NULL,
	[TestDate] [date] NULL,
	[RefDocumentId] [int] NULL,
	[RadiationSourceId] [int] NULL,
	[FilmMakeAndType] [varchar](100) NULL,
	[TypeofIQI] [varchar](50) NULL,
	[IQIBatchNo] [varchar](50) NULL,
	[TechniqueId] [int] NULL,
	[ShimThickness] [varchar](50) NULL,
	[DensitometerNo] [varchar](50) NULL,
	[CalibrationDate] [varchar](50) NULL,
	[GeometricalUnsharpness] [varchar](50) NULL,
	[MaterialSpecification] [varchar](50) NULL,
	[SurfaceCondition] [varchar](50) NULL,
	[SurfaceTemperature] [varchar](50) NULL,
	[ExtentofExamination] [varchar](50) NULL,
	[TestLimitations] [varchar](50) NULL,
	[WeldThickness] [varchar](50) NULL,
	[WeldPreparation] [varchar](50) NULL,
	[StageofExamination] [varchar](50) NULL,
	[ContactNumber] [varchar](30) NULL,
	[WeldType] [varchar](50) NULL,
	[WeldingMethod] [varchar](50) NULL,
 CONSTRAINT [PK_RadiographicWeld] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RadiographicWeld] ON
INSERT [dbo].[RadiographicWeld] ([ReportId], [Client], [Location], [ContactPerson], [TestReportNumber], [JobDescription], [TestDate], [RefDocumentId], [RadiationSourceId], [FilmMakeAndType], [TypeofIQI], [IQIBatchNo], [TechniqueId], [ShimThickness], [DensitometerNo], [CalibrationDate], [GeometricalUnsharpness], [MaterialSpecification], [SurfaceCondition], [SurfaceTemperature], [ExtentofExamination], [TestLimitations], [WeldThickness], [WeldPreparation], [StageofExamination], [ContactNumber], [WeldType], [WeldingMethod]) VALUES (105, N'OMG', N'', N'', N'', N'', CAST(0x78360B00 AS Date), 1, 2, N'', N'', N'', 1, N'', N'', N'Jan  2 2012 12:00AM', N'', N'Display MaterialSpecification', N'surface cond', N'', N'examination', N'Test limitation', N'', N'', N'', N'', N'Weld type', N'Weld method')
INSERT [dbo].[RadiographicWeld] ([ReportId], [Client], [Location], [ContactPerson], [TestReportNumber], [JobDescription], [TestDate], [RefDocumentId], [RadiationSourceId], [FilmMakeAndType], [TypeofIQI], [IQIBatchNo], [TechniqueId], [ShimThickness], [DensitometerNo], [CalibrationDate], [GeometricalUnsharpness], [MaterialSpecification], [SurfaceCondition], [SurfaceTemperature], [ExtentofExamination], [TestLimitations], [WeldThickness], [WeldPreparation], [StageofExamination], [ContactNumber], [WeldType], [WeldingMethod]) VALUES (106, N'1', N'1', N'1', N'1', N'1', CAST(0x7D360B00 AS Date), 2, 4, N'1', N'2', N'1', 1, N'1', N'1', N'Jan  1 2011 12:00AM', N'1', N'1', N'1', N'1', N'1', N'11', N'1', N'1', N'1', N'1', N'1', N'1')
SET IDENTITY_INSERT [dbo].[RadiographicWeld] OFF
/****** Object:  Table [dbo].[RadiationSource]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RadiationSource](
	[RadiationSourceId] [int] IDENTITY(1,1) NOT NULL,
	[TypeofSource] [varchar](50) NOT NULL,
	[UnitofEnergy] [varchar](50) NULL,
	[Identification] [varchar](50) NULL,
	[FocalSpotSize] [varchar](50) NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RadiationSource] ON
INSERT [dbo].[RadiationSource] ([RadiationSourceId], [TypeofSource], [UnitofEnergy], [Identification], [FocalSpotSize], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (2, N'X ray', N'200kv 5mA', N'XXG2005 Sr 6041', N'1.5x1.5mm', CAST(0xA06E0000 AS SmallDateTime), 1, CAST(0xA06E0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[RadiationSource] ([RadiationSourceId], [TypeofSource], [UnitofEnergy], [Identification], [FocalSpotSize], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (4, N'Ir192', N'15Ci', N'Delta IR/0910', N'2.5x2.5mm', CAST(0xA06E0000 AS SmallDateTime), 1, CAST(0xA06E0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[RadiationSource] ([RadiationSourceId], [TypeofSource], [UnitofEnergy], [Identification], [FocalSpotSize], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (5, N'Se75', N'10Ci', N'Spec2T SE/0812', N'2x2mm', CAST(0xA06E0000 AS SmallDateTime), 1, CAST(0xA06E0000 AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[RadiationSource] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Qty] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([ProductID], [Name], [Unit], [Qty]) VALUES (273, N'1', N'1', CAST(1 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[ReportTemplates]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTemplates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[ReportId] [int] NULL,
	[ReportTemplate] [nvarchar](max) NOT NULL,
	[FieldOrder] [nvarchar](max) NOT NULL,
	[Section] [nvarchar](50) NULL,
	[SectionsID] [int] NULL,
 CONSTRAINT [PK_ReportTemplates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ReportTemplates] ON
INSERT [dbo].[ReportTemplates] ([ID], [ClientId], [ReportId], [ReportTemplate], [FieldOrder], [Section], [SectionsID]) VALUES (1, 1, 1, N'&lt;DIV class=SectionHeading&gt;Job Description &lt;/DIV&gt; &lt;DIV id=JobDescription class=border&gt; &lt;DIV class="DivColumns left ui-sortable"&gt; &lt;DIV id=reportno class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Report No: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##reportnoValue## &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV id=Location class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Location: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##LocationValue## &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV id=description class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Description: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##descriptionValue## &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV id=Client class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Client: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##ClientValue## &lt;/DIV&gt; &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV class="DivColumns right ui-sortable"&gt; &lt;DIV id=testdate class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Test Date: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##testdateValue## &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV id=contactperson1 class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Contact Person1: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##contactperson1Value## &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV id=contactno class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Contact No: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##contactnoValue## &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV id=contactperson class=DivCells&gt; &lt;DIV class=DivFieldLabel&gt;Contact Person: &lt;/DIV&gt; &lt;DIV class=DivFieldValue&gt;##contactpersonValue## &lt;/DIV&gt; &lt;/DIV&gt; &lt;/DIV&gt; &lt;DIV class=clear&gt; &lt;/DIV&gt; &lt;/DIV&gt;', N'Client,Location,reportno,description|contactperson,contactperson1,contactno,testdate', N'JobDescription', 1)
INSERT [dbo].[ReportTemplates] ([ID], [ClientId], [ReportId], [ReportTemplate], [FieldOrder], [Section], [SectionsID]) VALUES (2, 1, 1, N'&lt;div class="SectionHeading"&gt;Test Results&lt;/div&gt;&lt;div id="Test Results" class="border"&gt;&lt;div id="TestResultsHeader"&gt;&lt;div style="width: 5%" class="TableHeader"&gt;No&lt;/div&gt;&lt;div style="width: 25%" class="TableHeader"&gt;Identification No&lt;/div&gt;&lt;div style="width: 10%" class="TableHeader"&gt;Joint No&lt;/div&gt;&lt;div style="width: 10%" class="TableHeader"&gt;Welder&lt;/div&gt;&lt;div style="width: 10%" class="TableHeader"&gt;Segment&lt;/div&gt;&lt;div style="width: 10%" class="TableHeader"&gt;Size&lt;/div&gt;&lt;div style="width: 15%" class="TableHeader"&gt;Observation&lt;/div&gt;&lt;div style="width: 15%" class="TableHeader"&gt;Remarks&lt;/div&gt;&lt;/div&gt;|&lt;div id="TestResultsDataList"&gt;&lt;div style="width: 5%" class="TableValueCenter"&gt;##SrNo##&lt;/div&gt;&lt;div style="width: 25%" class="TableValue"&gt;##IdentificationNo##&lt;/div&gt;&lt;div style="width: 10%" class="TableValueCenter"&gt;##JointNo##&lt;/div&gt;&lt;div style="width: 10%" class="TableValue"&gt;##Welder##&lt;/div&gt;&lt;div style="width: 10%" class="TableValue"&gt;##Segment##&lt;/div&gt;&lt;div style="width: 10%" class="TableValueCenter"&gt;##FilmSize##&lt;/div&gt;&lt;div style="width: 15%" class="TableValue"&gt;##Observations##&lt;/div&gt;&lt;div style="width: 15%" class="TableValue"&gt;##Remarks##&lt;/div&gt;&lt;/div&gt;|&lt;/div&gt;', N'', N'TestResult', 2)
INSERT [dbo].[ReportTemplates] ([ID], [ClientId], [ReportId], [ReportTemplate], [FieldOrder], [Section], [SectionsID]) VALUES (5, 1, 1, N'&lt;div class="SectionHeading"&gt;Reference Documents&lt;/div&gt;&lt;div id="ReferenceDocuments" class="border"&gt;&lt;div&gt;&lt;div id="code" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;Code:&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##CodeValue##&lt;/div&gt;&lt;/div&gt;&lt;div id="TestSpecification" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;TestSpecification:&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##TestSpecificationValue##&lt;/div&gt;&lt;/div&gt;&lt;div id="TestProcedureNo" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;Test Procedure No.:&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##TestProcedureValue## &lt;/div&gt;&lt;/div&gt;&lt;div id="AcceptanceStandard" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;Acceptance Standard:&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##AcceptanceStandardValue## &lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', N'', N'ReferenceDocuments', 3)
INSERT [dbo].[ReportTemplates] ([ID], [ClientId], [ReportId], [ReportTemplate], [FieldOrder], [Section], [SectionsID]) VALUES (7, 1, 1, N'&lt;div class="SectionHeading"&gt;Radiography Technique Details&lt;/div&gt;&lt;div id="RadiographyTechniqueDetail" class="border"&gt;&lt;div&gt;&lt;div id="TypeofSource" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;Type of Source:&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##TypeofSourceValue##&lt;/div&gt;&lt;/div&gt;&lt;div id="UnitofEnergy" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;Unit of Energy:&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##UnitofEnergyValue##&lt;/div&gt;&lt;/div&gt;&lt;div id="Identification" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;Identification :&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##IdentificationValue## &lt;/div&gt;&lt;/div&gt;&lt;div id="FocalSpotSize" class="DivCells"&gt;&lt;div class="DivFieldLabel"&gt;Focal Spot Size:&lt;/div&gt;&lt;div class="DivFieldValue"&gt;##FocalSpotSizeValue## &lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', N'', N'RadiographyTechniqueDetail', 4)
SET IDENTITY_INSERT [dbo].[ReportTemplates] OFF
/****** Object:  Table [dbo].[Remarks]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Remarks](
	[RemarksId] [int] IDENTITY(1,1) NOT NULL,
	[RemarksShortName] [varchar](10) NOT NULL,
	[Remarks] [varchar](50) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Remarks] ON
INSERT [dbo].[Remarks] ([RemarksId], [RemarksShortName], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (1, N'Accept', N'Accept to Specification', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Remarks] ([RemarksId], [RemarksShortName], [Remarks], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (2, N'Reject', N'Reject to Specification', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Remarks] OFF
/****** Object:  Table [dbo].[Observations]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observations](
	[ObservationsId] [int] IDENTITY(1,1) NOT NULL,
	[ObservationsShortName] [nvarchar](10) NOT NULL,
	[Observations] [nvarchar](50) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [smalldatetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Deleted] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Observations] ON
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (1, N'IP/LP', N'Incomplete Penetration', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (2, N'AD', N'Accumulated Defects', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (3, N'RT', N'Retake', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (4, N'LF', N'Lack of Fusion', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (5, N'Por', N'Porosity', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (6, N'RS', N'Reshoot', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (7, N'SL', N'Slag Line', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (8, N'Gr.Por', N'Group Porosity', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (9, N'Rep', N'Repair', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (10, N'UC', N'Under Cut', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (11, N'BT', N'Burn Through', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
INSERT [dbo].[Observations] ([ObservationsId], [ObservationsShortName], [Observations], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Deleted]) VALUES (12, N'Acc', N'Acceptable', CAST(0xA0CA0000 AS SmallDateTime), 1, CAST(0xA0CA0000 AS SmallDateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Observations] OFF
/****** Object:  Table [NDT_POC].[Mst_Template]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NDT_POC].[Mst_Template](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[AppID] [int] NULL,
	[TemplateID] [int] NULL,
	[ReportID] [int] NULL,
	[ReportHeaderID] [int] NULL,
	[FieldID] [int] NOT NULL,
	[FieldName] [nvarchar](200) NULL,
	[FieldDataType] [nvarchar](50) NULL,
	[ComponentInUse] [nvarchar](200) NULL,
	[PreFetch_SPName] [nchar](10) NULL,
	[XCordinate] [int] NULL,
	[YCordinate] [int] NULL,
	[SubmitValue] [nchar](10) NULL,
	[UniqueField] [nchar](10) NULL,
	[NullableField] [nchar](10) NULL,
	[RepetableField] [nchar](10) NULL,
 CONSTRAINT [PK_Mst_Template] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [NDT_POC].[Mst_Template] ON
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (1, 1, 1, 1, 1, 3, 3, N'Client Name', N'String', N'Textbox', N'          ', 1, 1, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (2, 1, 1, 1, 1, 3, 4, N'Location Of Work', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (3, 1, 1, 1, 1, 3, 5, N'Contact Person', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (4, 1, 1, 1, 1, 3, 6, N'Test Report No', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (5, 1, 1, 1, 1, 3, 7, N'Contract No', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (6, 1, 1, 1, 1, 3, 8, N'Job Description', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (7, 1, 1, 1, 1, 3, 10, N'Test Date', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (8, 1, 1, 1, 1, 4, 11, N'Material Specification', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (9, 1, 1, 1, 1, 4, 12, N'Weld Type', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (10, 1, 1, 1, 1, 4, 13, N'Surface Condition', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (11, 1, 1, 1, 1, 4, 14, N'Weld Preparation', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (12, 1, 1, 1, 1, 4, 15, N'Extent Of Examinatin', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (13, 1, 1, 1, 1, 4, 16, N'Welcing Method', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (14, 1, 1, 1, 1, 4, 17, N'Test Limitations (if Any)', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (15, 1, 1, 1, 1, 4, 18, N'Stage of Examinations', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (16, 1, 1, 1, 1, 5, 19, N'Code OF Construction', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (17, 1, 1, 1, 1, 5, 20, N'Radiographic Test Specification', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (18, 1, 1, 1, 1, 5, 21, N'RT Procedure No', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (19, 1, 1, 1, 1, 5, 22, N'Acceptance Standard', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (20, 1, 1, 1, 1, 6, 23, N'Source', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (21, 1, 1, 1, 1, 6, 24, N'Identification', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (22, 1, 1, 1, 1, 6, 25, N'Source Size', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (23, 1, 1, 1, 1, 6, 26, N'S.D.F', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (24, 1, 1, 1, 1, 6, 27, N'Activity', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (25, 1, 1, 1, 1, 6, 28, N'Exposure Time', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (26, 1, 1, 1, 1, 6, 29, N'Details', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (27, 1, 1, 1, 1, 6, 30, N'Identification', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (28, 1, 1, 1, 1, 6, 31, N'Focal spot', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (29, 1, 1, 1, 1, 6, 32, N'S.F.D', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (30, 1, 1, 1, 1, 6, 33, N'Kv & mA', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (31, 1, 1, 1, 1, 6, 34, N'Exposure Time', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (32, 1, 1, 1, 1, 6, 35, N'Sensitivity Level', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (33, 1, 1, 1, 1, 6, 36, N'Technique Of Exposure', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (34, 1, 1, 1, 1, 6, 37, N'Film Make & Type', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (35, 1, 1, 1, 1, 6, 38, N'Shim Thickness (if Used)', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (36, 1, 1, 1, 1, 6, 39, N'Type of IQI & ID No', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (37, 1, 1, 1, 1, 6, 40, N'Densitometer No & Calibration Date', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (38, 1, 1, 1, 1, 6, 41, N'No Of IQI & Batch No', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (39, 1, 1, 1, 1, 6, 42, N'Geometrical Un Sharpness', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (40, 1, 1, 1, 1, 6, 43, N'Optical Density', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (41, 1, 1, 1, 1, 7, 44, N'Identification No', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (42, 1, 1, 1, 1, 7, 45, N'Joint No', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (43, 1, 1, 1, 1, 7, 46, N'Welder', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (44, 1, 1, 1, 1, 7, 47, N'Segment', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (45, 1, 1, 1, 1, 7, 48, N'Film size', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (46, 1, 1, 1, 1, 7, 49, N'Observation', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (47, 1, 1, 1, 1, 7, 50, N'Remarks', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (48, 1, 1, 1, 1, 8, 51, N'Radiographs Viewed By', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (49, 1, 1, 1, 1, 8, 52, N'Client Approval', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (50, 1, 1, 1, 1, 8, 53, N'Authority Witness', N'String', N'Textbox', NULL, NULL, NULL, N'Yes       ', N'N0        ', N'Yes       ', N'No        ')
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (51, 1, 1, 2, 1, 3, 54, N'Client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (52, 1, 1, 2, 1, 3, 55, N'Contract No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (53, 1, 1, 2, 1, 3, 56, N'Location Of Work', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (54, 1, 1, 2, 1, 3, 57, N'Test Report No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (55, 1, 1, 2, 1, 3, 58, N'Test Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (56, 1, 1, 2, 1, 4, 59, N'Radiographic Test Specification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (57, 1, 1, 2, 1, 4, 60, N'RT Procedure No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (58, 1, 1, 2, 1, 4, 61, N'Acceptance Standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (59, 1, 1, 2, 1, 6, 62, N'Source', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (60, 1, 1, 2, 1, 6, 63, N'Identification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (61, 1, 1, 2, 1, 6, 64, N'Source Size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (62, 1, 1, 2, 1, 6, 65, N'S.D.F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (63, 1, 1, 2, 1, 6, 66, N'Activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (64, 1, 1, 2, 1, 6, 67, N'Exposure Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (65, 1, 1, 2, 1, 6, 68, N'Details', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (66, 1, 1, 2, 1, 6, 69, N'Identification', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (67, 1, 1, 2, 1, 6, 70, N'Focal spot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (68, 1, 1, 2, 1, 6, 71, N'S.F.D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (69, 1, 1, 2, 1, 6, 72, N'Kv & mA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (70, 1, 1, 2, 1, 6, 73, N'Exposure Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (71, 1, 1, 2, 1, 6, 74, N'Sensitivity Level', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (72, 1, 1, 2, 1, 6, 75, N'Technique Of Exposure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (73, 1, 1, 2, 1, 6, 76, N'Film Make & Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (74, 1, 1, 2, 1, 6, 77, N'Shim Thickness (if Used)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (75, 1, 1, 2, 1, 6, 78, N'Type of IQI & ID No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (76, 1, 1, 2, 1, 6, 79, N'Densitometer No & Calibration Date', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (77, 1, 1, 2, 1, 6, 80, N'No Of IQI & Batch No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (78, 1, 1, 2, 1, 6, 81, N'Geometrical Un Sharpness', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (79, 1, 1, 2, 1, 7, 82, N'Identification No', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (80, 1, 1, 2, 1, 7, 83, N'IQI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (81, 1, 1, 2, 1, 7, 84, N'Thickness (mm)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (82, 1, 1, 2, 1, 7, 85, N'Segment', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (83, 1, 1, 2, 1, 7, 86, N'Film size', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (84, 1, 1, 2, 1, 7, 87, N'Optical Density', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (85, 1, 1, 2, 1, 7, 88, N'Category', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (86, 1, 1, 2, 1, 7, 89, N'Severity Level', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (87, 1, 1, 2, 1, 10, 90, N'Results', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (88, 1, 1, 2, 1, 8, 91, N'Radiographs Viewed By', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (89, 1, 1, 2, 1, 8, 92, N'Client Approval', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [NDT_POC].[Mst_Template] ([AutoID], [ClientID], [AppID], [TemplateID], [ReportID], [ReportHeaderID], [FieldID], [FieldName], [FieldDataType], [ComponentInUse], [PreFetch_SPName], [XCordinate], [YCordinate], [SubmitValue], [UniqueField], [NullableField], [RepetableField]) VALUES (90, 1, 1, 2, 1, 8, 93, N'Authority Witness', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [NDT_POC].[Mst_Template] OFF
/****** Object:  Table [NDT_POC].[Mst_Client]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NDT_POC].[Mst_Client](
	[AutoID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Mst_Client] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [NDT_POC].[Mst_Client] ON
INSERT [NDT_POC].[Mst_Client] ([AutoID], [ClientName]) VALUES (1, N'Artha')
INSERT [NDT_POC].[Mst_Client] ([AutoID], [ClientName]) VALUES (2, N'Mi Labs')
INSERT [NDT_POC].[Mst_Client] ([AutoID], [ClientName]) VALUES (3, N'Acentria Solutions')
SET IDENTITY_INSERT [NDT_POC].[Mst_Client] OFF
/****** Object:  Table [NDT_POC].[Mst_Application]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NDT_POC].[Mst_Application](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Mst_Application] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [NDT_POC].[Mst_Application] ON
INSERT [NDT_POC].[Mst_Application] ([AutoId], [ApplicationName]) VALUES (1, N'NDT Reporting')
INSERT [NDT_POC].[Mst_Application] ([AutoId], [ApplicationName]) VALUES (2, N'Entitlement Framework')
SET IDENTITY_INSERT [NDT_POC].[Mst_Application] OFF
/****** Object:  Table [MiEFW].[MiDBTool_ReportMaster]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MiEFW].[MiDBTool_ReportMaster](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [nvarchar](30) NOT NULL,
	[SPName] [nvarchar](255) NOT NULL,
	[ReportName] [nvarchar](300) NOT NULL,
	[ReportDescr] [nvarchar](4000) NULL,
	[ShowInReportListing] [nchar](3) NULL,
	[SPInstructions] [nvarchar](4000) NULL,
	[modifiedby] [nvarchar](30) NULL,
	[modifiedDt] [datetime] NULL,
	[deleted] [nchar](3) NULL,
 CONSTRAINT [PK_MiDBTool_ReportMaster] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MiEFW].[MiDBTool_ParameterMaster]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MiEFW].[MiDBTool_ParameterMaster](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[storeID] [nvarchar](30) NOT NULL,
	[ParaName] [nvarchar](255) NOT NULL,
	[ParaDataType] [int] NOT NULL,
	[ParaDataSize] [int] NOT NULL,
	[ParaDirection] [int] NOT NULL,
	[ParaDefaultVal] [nvarchar](3000) NULL,
	[ParaDescr] [nvarchar](2000) NULL,
	[modifiedby] [nvarchar](30) NULL,
	[modifieddt] [datetime] NULL,
	[deleted] [nchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NDT_POC].[Metadata]    Script Date: 12/09/2012 13:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NDT_POC].[Metadata](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[ResourceType] [nvarchar](500) NULL,
	[ResourceName] [nvarchar](2000) NULL,
	[ResourceValue] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [NDT_POC].[Metadata] ON
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (1, N'Template', N'TemplateID', N'Radiography Examination Report')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (2, N'Report', N'ReportID', N'Welded Joints')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (3, N'ReportHeader', N'RepHeadID', N'Job Description')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (4, N'ReportHeader', N'RepHeadID', N'Job Details')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (5, N'ReportHeader', N'RepHeadID', N'Reference Documents')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (6, N'ReportHeader', N'RepHeadID', N'Radiography Technique Details')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (7, N'ReportHeader', N'RepHeadID', N'Test Results')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (8, N'ReportHeader', N'RepHeadID', N'Radiographer')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (9, N'Report', N'ReportID', N'Casting')
INSERT [NDT_POC].[Metadata] ([AutoId], [ResourceType], [ResourceName], [ResourceValue]) VALUES (10, N'ReportHeader', N'RepHeadID', N'Results')
SET IDENTITY_INSERT [NDT_POC].[Metadata] OFF
/****** Object:  StoredProcedure [MiEFW].[getSPParametersFromStoreID]    Script Date: 12/09/2012 13:34:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kalpesh
-- Create date: 23 May 2011
-- Description:	get the SP Name from the Store
-- =============================================
create  PROCEDURE [MiEFW].[getSPParametersFromStoreID] 
	-- Add the parameters for the stored procedure here
	@StoreID nvarchar(300) = ''
	
/*
getSPNameFromStoreID 'test123'
*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select autoid, storeid, paraname, paradatatype, paradatasize, paradirection, paradefaultval,paradescr, modifiedby, modifieddt, deleted
	from mief.DyEXT_ParameterMaster where deleted = 'N' and storeID = @StoreID
	order by ParaName
	
	-- select * from mief.DyEXT_ParameterMaster
END
GO
/****** Object:  StoredProcedure [MiEFW].[getSPParameters_bySPName]    Script Date: 12/09/2012 13:34:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [MiEFW].[getSPParameters_bySPName]
@SPNAME as nvarchar(255)
as
/*
exec mief.getSPParameters_bySPName 'getConfig_ByCategory'
*/
begin
select  specific_name,ordinal_position,parameter_mode,is_Result,Parameter_name,data_type,character_Maximum_Length
from INFORMATION_SCHEMA.PARAMETERS
where specific_name = @SPNAME
order by ordinal_position
end
GO
/****** Object:  StoredProcedure [NDT_POC].[getReportTemplate_ByTEmplateID]    Script Date: 12/09/2012 13:34:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kalpesh N Mistry
-- Create date: 16 Sept 2012
-- Description:	get the report fields for transaction by TEmplate ID
/*

exec getReportTemplate_ByTEmplateID 1

*/

-- =============================================
CREATE PROCEDURE [NDT_POC].[getReportTemplate_ByTEmplateID] 
	-- Add the parameters for the stored procedure here
	@TEmplateID int = 0 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


--select top 5 * from NDT_POC.mst_template

-- commit tran

select 
A.AutoID, 
D.ClientName, 
C.applicationname, 
B.ResourceValue as 'Template Name', 
E.ResourceValue  as 'Report Category' , 
A.FieldID,A.Fieldname,A.fielddatatype,a.ComponentInUse,a.prefetch_SPName, a.xcordinate, A.yCordinate,
A.SubmitValue, A.UniqueField, A.nullableField, A.repetableField

from 
NDT_POC.mst_template A,
NDT_POC.Metadata B, NDT_POC.Metadata E, 
NDT_POC.Mst_Application C, 
NDT_POC.Mst_Client D

where 
D.autoid = A.clientid and 
C.autoid = A.appid and 
B.Autoid = A.templateID and 
E.Autoid = A.ReportHeaderID
and A.TemplateID = @TEmplateID 

END
GO
/****** Object:  StoredProcedure [NDT_POC].[getReportData_byRecID]    Script Date: 12/09/2012 13:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kalpesh
-- Create date: 15 Sept 2012
-- Description:	Get Report Data per Record by Record ID
/*

exec getReportData_byRecID 1
exec getReportData_byRecID 0

*/
-- =============================================
CREATE PROCEDURE [NDT_POC].[getReportData_byRecID] 
	-- Add the parameters for the stored procedure here
	@RecID int = 0
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
     if (@RecID <> 0 )
		 begin
				select 
				A.recordid, A.FieldID, B.FieldName, A.fieldvalue, A.LastModifiedBy, A.LastModifiedDt
				from ndt_poc.Txn_reportdata A, ndt_poc.Mst_Template B
				where A.fieldid = B.FieldID and A.recordid = @recid
				order by A.recordid,A.fieldid, A.lastmodifiedby,A.lastmodifieddt asc
		 end
     else     
		 begin 
				select 
				A.recordid, A.FieldID, B.FieldName, A.fieldvalue, A.LastModifiedBy, A.LastModifiedDt
				from ndt_poc.Txn_reportdata A, ndt_poc.Mst_Template B
				where A.fieldid = B.FieldID
				order by A.recordid,A.fieldid, A.lastmodifiedby,A.lastmodifieddt asc
		 end
     


END
GO
/****** Object:  StoredProcedure [dbo].[getEmailbyID]    Script Date: 12/09/2012 13:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getEmailbyID] 
(
    @userid  int,
    @emailid nvarchar(50) OUTPUT  
)
AS	
Begin
select @emailid = emailid from users where @userid = userid
end
return
GO
/****** Object:  Table [dbo].[registration]    Script Date: 12/09/2012 13:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[companyname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[mobilenumber] [nvarchar](14) NOT NULL,
	[registrationdate] [date] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[registration] ON
INSERT [dbo].[registration] ([id], [userid], [companyname], [name], [mobilenumber], [registrationdate]) VALUES (1, 1, N'Artha', N'HiteshRD', N'+919699891420', CAST(0x67360B00 AS Date))
INSERT [dbo].[registration] ([id], [userid], [companyname], [name], [mobilenumber], [registrationdate]) VALUES (2, 2, N'artha1', N'ravi', N'9892055122', CAST(0x48360B00 AS Date))
INSERT [dbo].[registration] ([id], [userid], [companyname], [name], [mobilenumber], [registrationdate]) VALUES (3, 3, N'IBM', N'sunil', N'123456', CAST(0x73360B00 AS Date))
INSERT [dbo].[registration] ([id], [userid], [companyname], [name], [mobilenumber], [registrationdate]) VALUES (4, 4, N'HCL', N'abc', N'989898', CAST(0x73360B00 AS Date))
INSERT [dbo].[registration] ([id], [userid], [companyname], [name], [mobilenumber], [registrationdate]) VALUES (5, 5, N'artha', N'xyz', N'112233', CAST(0x73360B00 AS Date))
INSERT [dbo].[registration] ([id], [userid], [companyname], [name], [mobilenumber], [registrationdate]) VALUES (6, 6, N'samsang', N'sachin', N'123123', CAST(0x74360B00 AS Date))
INSERT [dbo].[registration] ([id], [userid], [companyname], [name], [mobilenumber], [registrationdate]) VALUES (7, 7, N'xx', N'RR', N'987654321', CAST(0x7D360B00 AS Date))
SET IDENTITY_INSERT [dbo].[registration] OFF
/****** Object:  StoredProcedure [NDT_POC].[prc_GetReportTemplateByClientIDAndReportID]    Script Date: 12/09/2012 13:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [NDT_POC].[prc_GetReportTemplateByClientIDAndReportID]
	@ClientId AS INT,
	@ReportId AS INT 
AS
BEGIN
	SELECT * FROM ReportTemplates 
	WHERE ClientId = @ClientId AND ReportId = @ReportId
	ORDER BY SectionsID
END
RETURN 0
GO
/****** Object:  StoredProcedure [MiEFW].[SPMAnager_getSPParametersTable]    Script Date: 12/09/2012 13:34:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kalpesh
-- Create date: 23 May 2011
-- Description:	get the SP Name from the Store
-- =============================================
CREATE  PROCEDURE [MiEFW].[SPMAnager_getSPParametersTable] 
	-- Add the parameters for the stored procedure here
	@StoreID nvarchar(300) = ''
	
/*
getSPNameFromStoreID 'test123'
*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select autoid, storeid, paraname, paradatatype, paradatasize, paradirection, paradefaultval,paradescr, modifiedby, modifieddt, deleted
	from miefw.SPManager_ParameterMaster where deleted = 'N' and storeID = @StoreID
	order by ParaName
	

	
	-- select * from mief.DyEXT_ParameterMaster
END
GO
/****** Object:  StoredProcedure [MiEFW].[SPManager_getSPNameFromStoreID]    Script Date: 12/09/2012 13:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kalpesh
-- Create date: 23 May 2011
-- Description:	get the SP Name from the Store
-- =============================================
create  PROCEDURE [MiEFW].[SPManager_getSPNameFromStoreID] 
	-- Add the parameters for the stored procedure here
	@StoreID nvarchar(300) = ''
	
/*
getSPNameFromStoreID 'test123'
*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select autoid, StoreID, SPName, ReportName, ReportDescr, modifiedby, modifiedDt, deleted 
	from miefw.SPManager_ProcMaster where deleted = 'N' and storeID = @StoreID
	order by SPName
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[resetpassword]    Script Date: 12/09/2012 13:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[resetpassword] 
(
	@resetpassword nvarchar(50) ,
	@userid int
 )
AS	 
Begin
update users set userpassword=@resetpassword where userid = @userid 
end
GO
/****** Object:  Table [dbo].[RadiographicWeldTestResult]    Script Date: 12/09/2012 13:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RadiographicWeldTestResult](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[ReportId] [int] NOT NULL,
	[IdentificationNo] [nvarchar](100) NULL,
	[JointNo] [int] NULL,
	[Welder] [nvarchar](200) NULL,
	[Segment] [nvarchar](200) NULL,
	[FlimSize] [nvarchar](50) NULL,
	[Density] [decimal](5, 2) NULL,
	[Sensitivity] [varchar](50) NULL,
	[ObservationsId] [int] NULL,
	[RemarksId] [int] NULL,
 CONSTRAINT [PK_RadiographicWeldTestResult] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RadiographicWeldTestResult] ON
INSERT [dbo].[RadiographicWeldTestResult] ([TestId], [ReportId], [IdentificationNo], [JointNo], [Welder], [Segment], [FlimSize], [Density], [Sensitivity], [ObservationsId], [RemarksId]) VALUES (172, 105, N'1', 1, N'1', N'1', N'1', CAST(1.00 AS Decimal(5, 2)), N'1', 2, 1)
INSERT [dbo].[RadiographicWeldTestResult] ([TestId], [ReportId], [IdentificationNo], [JointNo], [Welder], [Segment], [FlimSize], [Density], [Sensitivity], [ObservationsId], [RemarksId]) VALUES (173, 106, N'1', 1, N'1', N'1', N'1', CAST(1.00 AS Decimal(5, 2)), N'1', 12, 1)
INSERT [dbo].[RadiographicWeldTestResult] ([TestId], [ReportId], [IdentificationNo], [JointNo], [Welder], [Segment], [FlimSize], [Density], [Sensitivity], [ObservationsId], [RemarksId]) VALUES (174, 106, N'2', 2, N'2', N'2', N'2', CAST(2.00 AS Decimal(5, 2)), N'2', 10, 2)
SET IDENTITY_INSERT [dbo].[RadiographicWeldTestResult] OFF
/****** Object:  StoredProcedure [dbo].[Verify]    Script Date: 12/09/2012 13:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Verify] 
(
    @emailid nvarchar(50),
    @userpassword nvarchar(50),
    @userid int output
)
AS	
If exists (select emailid,userpassword from users where emailid = @emailid and userpassword = @userpassword)
Begin
select @userid=userid from users where emailid=+ @emailid
--select @tomail=mobilenumber from users join registration on users.userid = registration.userid where mobilenumber = @mobilenumber
End 
Else
begin
Set  @userid = 0
--select emailid,userpassword from users where emailid = @emailid and userpassword = @userpassword 
End
Return
GO
/****** Object:  StoredProcedure [dbo].[usersdetail]    Script Date: 12/09/2012 13:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usersdetail] 
(
@emailid nvarchar(50),
@userpassword nvarchar(50),
@companyname nvarchar(50),
@name nvarchar(50),
@mobilenumber nvarchar(14),
@registrationdate date
)
as
Begin
DECLARE @ID INT
Insert into dbo.users(emailid,userpassword)Values(@emailid,@userpassword);

Select @ID=@@Identity
from users where emailid=@emailid 
insert into registration(userid,companyname,name,mobilenumber,registrationdate)
values(@ID,@companyname,@name,@mobilenumber,@registrationdate)
end
GO
/****** Object:  StoredProcedure [dbo].[usercheck]    Script Date: 12/09/2012 13:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usercheck] 
(
    @emailid nvarchar(50),
    @mobilenumber nvarchar(14),
    @userid int OUTPUT
 )
AS	
If exists (select emailid,mobilenumber from users join registration on users.userid = registration.userid where emailid = @emailid and mobilenumber = @mobilenumber)
Begin
select @userid=userid from users where emailid=+ @emailid
--select @tomail=mobilenumber from users join registration on users.userid = registration.userid where mobilenumber = @mobilenumber
End 
Else
begin
Set  @userid = 0
End
Return
GO
/****** Object:  StoredProcedure [NDT_POC].[prc_getReportById]    Script Date: 12/09/2012 13:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [NDT_POC].[prc_getReportById]    
 @ClientId AS INT ,    
 @ReportId AS INT      
AS      
BEGIN     
 --SELECT * FROM ReportTemplates A WHERE A.Id = @ID    
 SELECT * FROM ReportTemplates A WHERE A.ClientId = @ClientId --AND A.ReportId = @ReportId 
 ORDER BY A.SectionsID    
 --modified by ritesh
 SELECT A.*,B.*,C.* FROM dbo.RadiographicWeld A,RefDocuments B,RadiationSource C    
 WHERE   A.RefDocumentId=B.RefDocumentId  
 and A.RadiationSourceId = C.RadiationSourceId 
 and A.ReportId = @ReportId
 --modified by ritesh
 SELECT ROW_NUMBER() OVER(ORDER BY TestId DESC) AS SrNo,A.*,B.Observations,C.Remarks FROM dbo.RadiographicWeldTestResult A, dbo.Observations B, dbo.Remarks C 
 WHERE A.ObservationsId = B.ObservationsId and 
 A.RemarksId = C.RemarksId and 
 A.ReportId = @ReportId    
END
GO
/****** Object:  StoredProcedure [dbo].[getdate]    Script Date: 12/09/2012 13:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getdate] 
(
    @userid  int,
    @registrationdate date OUTPUT  
)
AS	
Begin
select  @registrationdate  =  registrationdate  from  registration where @userid = userid
end
return
GO
/****** Object:  StoredProcedure [dbo].[getcompanyname]    Script Date: 12/09/2012 13:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getcompanyname] 
(
    @userid  int,
    @companyname nvarchar(50) OUTPUT  
)
AS	
Begin
select @companyname = companyname from registration where @userid = userid
end
return
GO
/****** Object:  ForeignKey [FK_Mst_Template_Mst_Template]    Script Date: 12/09/2012 13:34:50 ******/
ALTER TABLE [NDT_POC].[Mst_Template]  WITH CHECK ADD  CONSTRAINT [FK_Mst_Template_Mst_Template] FOREIGN KEY([AutoID])
REFERENCES [NDT_POC].[Mst_Template] ([AutoID])
GO
ALTER TABLE [NDT_POC].[Mst_Template] CHECK CONSTRAINT [FK_Mst_Template_Mst_Template]
GO
/****** Object:  ForeignKey [FK__registrat__useri__59FA5E80]    Script Date: 12/09/2012 13:34:53 ******/
ALTER TABLE [dbo].[registration]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
/****** Object:  ForeignKey [FK_RadiographicWeldTestResult_RadiographicWeld]    Script Date: 12/09/2012 13:34:56 ******/
ALTER TABLE [dbo].[RadiographicWeldTestResult]  WITH CHECK ADD  CONSTRAINT [FK_RadiographicWeldTestResult_RadiographicWeld] FOREIGN KEY([ReportId])
REFERENCES [dbo].[RadiographicWeld] ([ReportId])
GO
ALTER TABLE [dbo].[RadiographicWeldTestResult] CHECK CONSTRAINT [FK_RadiographicWeldTestResult_RadiographicWeld]
GO
