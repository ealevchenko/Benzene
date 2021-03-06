USE [BENZINEweb]
GO
/****** Object:  Table [dbo].[usersList]    Script Date: 11.12.2020 13:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](60) NULL,
	[security] [nvarchar](max) NULL,
	[privilige] [int] NULL,
	[session_length] [int] NULL,
 CONSTRAINT [PK_usersList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usersList] ON 

INSERT [dbo].[usersList] ([ID], [user_name], [security], [privilige], [session_length]) VALUES (1, N'admin', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, 7200)
INSERT [dbo].[usersList] ([ID], [user_name], [security], [privilige], [session_length]) VALUES (5, N'responseUser', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, 3600)
INSERT [dbo].[usersList] ([ID], [user_name], [security], [privilige], [session_length]) VALUES (6, N'viewUser', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 2, 3600)
SET IDENTITY_INSERT [dbo].[usersList] OFF
