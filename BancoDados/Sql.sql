USE [LanManager]
GO
/****** Object:  Table [dbo].[AccessPoint]    Script Date: 10/31/2009 11:10:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccessPoint](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_AccessPoint_Id]  DEFAULT (newid()),
	[Name] [varchar](100) NOT NULL,
	[NextCommandToExecute] [varchar](50) NULL,
 CONSTRAINT [PK_AccessPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Config]    Script Date: 10/31/2009 11:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Config](
	[ShortName] [varchar](20) NOT NULL,
	[Value] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ShortName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 10/31/2009 11:10:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Admin] ON [dbo].[Admin] 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10/31/2009 11:10:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Client_Id]  DEFAULT (newid()),
	[MainClient] [uniqueidentifier] NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[MinutesLeft] [int] NOT NULL CONSTRAINT [DF_Client_Credit]  DEFAULT ((0)),
	[MinutesBonus] [int] NOT NULL CONSTRAINT [DF_Client_BonusCredit]  DEFAULT ((0)),
	[MaxDebit] [int] NOT NULL,
	[HasMidnightPermission] [bit] NOT NULL,
	[CanAccessAnyApplication] [bit] NULL,
	[CanAccessAnyTime] [bit] NULL,
	[FullName] [varchar](100) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[DocumentID] [varchar](30) NOT NULL,
	[Nickname] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
	[LastUpdateDate] [datetime] NULL,
	[FatherName] [varchar](100) NULL,
	[MotherName] [varchar](100) NULL,
	[StreetAddress] [varchar](200) NULL,
	[Neighborhood] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [char](8) NULL,
	[Phone] [bigint] NULL,
	[MobilePhone] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[School] [varchar](100) NULL,
	[SchoolTime] [int] NULL,
	[CPF] [varchar](11) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [ClientLogin] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'CONSTRAINT',@level2name=N'ClientLogin'
GO
/****** Object:  Table [dbo].[ApplicationGroup]    Script Date: 10/31/2009 11:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationGroup](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_ApplicationGroup_Id]  DEFAULT (newid()),
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ApplicationGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientApplicationLog]    Script Date: 10/31/2009 11:10:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientApplicationLog](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_ClientLog_Id]  DEFAULT (newid()),
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[ClientID] [uniqueidentifier] NOT NULL,
	[ApplicationID] [uniqueidentifier] NOT NULL,
	[ClientSessionID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ClientLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationDependentPermission]    Script Date: 10/31/2009 11:10:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationDependentPermission](
	[Application] [uniqueidentifier] NOT NULL,
	[Client] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ApplicationDependentPermission_1] PRIMARY KEY CLUSTERED 
(
	[Application] ASC,
	[Client] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSession]    Script Date: 10/31/2009 11:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSession](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_ClientSession_Id]  DEFAULT (newid()),
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[LastClientPing] [datetime] NOT NULL,
	[Client] [uniqueidentifier] NOT NULL,
	[AccessPoint] [uniqueidentifier] NOT NULL,
	[MinutesPaid] [int] NULL,
	[MinutesBonusUsed] [int] NULL,
 CONSTRAINT [PK_ClientSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ClientID_ClientSession] ON [dbo].[ClientSession] 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeriodAllowed]    Script Date: 10/31/2009 11:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeriodAllowed](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_PeriodAllowed_Id]  DEFAULT (newid()),
	[DayOfWeek] [int] NULL,
	[StartHour] [int] NOT NULL,
	[EndHour] [int] NOT NULL,
	[DependentClient] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PeriodAllowed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10/31/2009 11:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [uniqueidentifier] NOT NULL,
	[Client] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ImageBinary] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Imagem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MinutesPurchased]    Script Date: 10/31/2009 11:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinutesPurchased](
	[Id] [uniqueidentifier] NOT NULL,
	[ClientId] [uniqueidentifier] NOT NULL,
	[Amount] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_MinutesPurchased] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupDependentPermission]    Script Date: 10/31/2009 11:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupDependentPermission](
	[ApplicationGroup] [uniqueidentifier] NOT NULL,
	[Client] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GroupDependentPermission_1] PRIMARY KEY CLUSTERED 
(
	[ApplicationGroup] ASC,
	[Client] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 10/31/2009 11:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Application_Id]  DEFAULT (newid()),
	[Name] [varchar](50) NOT NULL,
	[DefaultPath] [varchar](max) NOT NULL,
	[RunArguments] [varchar](50) NULL,
	[MinimumAge] [int] NOT NULL CONSTRAINT [DF_Application_MinimumAge]  DEFAULT ((0)),
	[Icon] [image] NULL,
	[ApplicationGroupID] [uniqueidentifier] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [CK_PeriodAllowed_DayOfWeek]    Script Date: 10/31/2009 11:11:01 ******/
ALTER TABLE [dbo].[PeriodAllowed]  WITH CHECK ADD  CONSTRAINT [CK_PeriodAllowed_DayOfWeek] CHECK  (([DayOfWeek]>=(0) AND [DayOfWeek]<=(6)))
GO
ALTER TABLE [dbo].[PeriodAllowed] CHECK CONSTRAINT [CK_PeriodAllowed_DayOfWeek]
GO
/****** Object:  ForeignKey [FK_Application_Application]    Script Date: 10/31/2009 11:10:38 ******/
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Application] FOREIGN KEY([ApplicationGroupID])
REFERENCES [dbo].[ApplicationGroup] ([Id])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Application]
GO
/****** Object:  ForeignKey [FK_ApplicationDependentPermission_Application]    Script Date: 10/31/2009 11:10:39 ******/
ALTER TABLE [dbo].[ApplicationDependentPermission]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationDependentPermission_Application] FOREIGN KEY([Application])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[ApplicationDependentPermission] CHECK CONSTRAINT [FK_ApplicationDependentPermission_Application]
GO
/****** Object:  ForeignKey [FK_ApplicationDependentPermission_DependentClient]    Script Date: 10/31/2009 11:10:39 ******/
ALTER TABLE [dbo].[ApplicationDependentPermission]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationDependentPermission_DependentClient] FOREIGN KEY([Client])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ApplicationDependentPermission] CHECK CONSTRAINT [FK_ApplicationDependentPermission_DependentClient]
GO
/****** Object:  ForeignKey [FK_Client_Client]    Script Date: 10/31/2009 11:10:49 ******/
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Client] FOREIGN KEY([MainClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Client]
GO
/****** Object:  ForeignKey [FK_ClientLog_Application]    Script Date: 10/31/2009 11:10:51 ******/
ALTER TABLE [dbo].[ClientApplicationLog]  WITH CHECK ADD  CONSTRAINT [FK_ClientLog_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[ClientApplicationLog] CHECK CONSTRAINT [FK_ClientLog_Application]
GO
/****** Object:  ForeignKey [FK_ClientLog_Client]    Script Date: 10/31/2009 11:10:51 ******/
ALTER TABLE [dbo].[ClientApplicationLog]  WITH CHECK ADD  CONSTRAINT [FK_ClientLog_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ClientApplicationLog] CHECK CONSTRAINT [FK_ClientLog_Client]
GO
/****** Object:  ForeignKey [FK_ClientLog_ClientSession]    Script Date: 10/31/2009 11:10:51 ******/
ALTER TABLE [dbo].[ClientApplicationLog]  WITH CHECK ADD  CONSTRAINT [FK_ClientLog_ClientSession] FOREIGN KEY([ClientSessionID])
REFERENCES [dbo].[ClientSession] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientApplicationLog] CHECK CONSTRAINT [FK_ClientLog_ClientSession]
GO
/****** Object:  ForeignKey [FK_ClientSession_AccessPoint]    Script Date: 10/31/2009 11:10:54 ******/
ALTER TABLE [dbo].[ClientSession]  WITH CHECK ADD  CONSTRAINT [FK_ClientSession_AccessPoint] FOREIGN KEY([AccessPoint])
REFERENCES [dbo].[AccessPoint] ([Id])
GO
ALTER TABLE [dbo].[ClientSession] CHECK CONSTRAINT [FK_ClientSession_AccessPoint]
GO
/****** Object:  ForeignKey [FK_ClientSession_Client]    Script Date: 10/31/2009 11:10:54 ******/
ALTER TABLE [dbo].[ClientSession]  WITH CHECK ADD  CONSTRAINT [FK_ClientSession_Client] FOREIGN KEY([Client])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ClientSession] CHECK CONSTRAINT [FK_ClientSession_Client]
GO
/****** Object:  ForeignKey [FK_GroupDependentPermission_ApplicationGroup]    Script Date: 10/31/2009 11:10:56 ******/
ALTER TABLE [dbo].[GroupDependentPermission]  WITH CHECK ADD  CONSTRAINT [FK_GroupDependentPermission_ApplicationGroup] FOREIGN KEY([ApplicationGroup])
REFERENCES [dbo].[ApplicationGroup] ([Id])
GO
ALTER TABLE [dbo].[GroupDependentPermission] CHECK CONSTRAINT [FK_GroupDependentPermission_ApplicationGroup]
GO
/****** Object:  ForeignKey [FK_GroupDependentPermission_DependentClient]    Script Date: 10/31/2009 11:10:56 ******/
ALTER TABLE [dbo].[GroupDependentPermission]  WITH CHECK ADD  CONSTRAINT [FK_GroupDependentPermission_DependentClient] FOREIGN KEY([Client])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[GroupDependentPermission] CHECK CONSTRAINT [FK_GroupDependentPermission_DependentClient]
GO
/****** Object:  ForeignKey [FK_Imagem_Client]    Script Date: 10/31/2009 11:10:57 ******/
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Client] FOREIGN KEY([Client])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Imagem_Client]
GO
/****** Object:  ForeignKey [FK_MinutesPurchased_Client]    Script Date: 10/31/2009 11:10:59 ******/
ALTER TABLE [dbo].[MinutesPurchased]  WITH CHECK ADD  CONSTRAINT [FK_MinutesPurchased_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[MinutesPurchased] CHECK CONSTRAINT [FK_MinutesPurchased_Client]
GO
/****** Object:  ForeignKey [FK_PeriodAllowed_DependentClient]    Script Date: 10/31/2009 11:11:01 ******/
ALTER TABLE [dbo].[PeriodAllowed]  WITH CHECK ADD  CONSTRAINT [FK_PeriodAllowed_DependentClient] FOREIGN KEY([DependentClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[PeriodAllowed] CHECK CONSTRAINT [FK_PeriodAllowed_DependentClient]
GO

insert into Admin values (newid(), 'admin', 'admin', 'Admin', 1)
