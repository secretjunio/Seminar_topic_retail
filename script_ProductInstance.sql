USE [RetailSeminar]
GO
/****** Object:  Table [dbo].[ProductInstance]    Script Date: 14/04/2022 10:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInstance](
	[product_intance_id] [nvarchar](450) NOT NULL,
	[product_line_id] [nvarchar](450) NOT NULL,
	[is_purchased] [bit]
 CONSTRAINT [PK_ProductInstance] PRIMARY KEY CLUSTERED 
(
	[product_intance_id] ASC,
	[product_line_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ProductInstance] ([product_intance_id], [product_line_id]) VALUES (N'ABC123', N'1', 1)
INSERT [dbo].[ProductInstance] ([product_intance_id], [product_line_id]) VALUES (N'ABC124', N'1', 1)
INSERT [dbo].[ProductInstance] ([product_intance_id], [product_line_id]) VALUES (N'ABC223', N'2', 0)
GO
