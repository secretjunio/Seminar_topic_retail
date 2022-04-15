/****** Object:  Table [dbo].[ProductLine]    Script Date: 15/4/2022 2:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLine](
	[product_line_id] [nvarchar](450) NOT NULL,
	[name] [nvarchar](max) NULL,
	[price] [nvarchar](max) NULL,
	[stock] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductLine] PRIMARY KEY CLUSTERED 
(
	[product_line_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
