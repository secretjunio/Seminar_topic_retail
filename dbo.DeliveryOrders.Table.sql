/****** Object:  Table [dbo].[DeliveryOrders]    Script Date: 15/4/2022 2:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryOrders](
	[delivery_order_id] [nvarchar](450) NOT NULL,
	[delivery_order_date] [datetime2](7) NOT NULL,
	[order_status] [bit] NOT NULL,
	[expected_quantity] [int] NOT NULL,
	[actual_quantity] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryOrders] PRIMARY KEY CLUSTERED 
(
	[delivery_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
