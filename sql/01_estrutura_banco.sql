-- Estrutura do banco Projeto_Ecomm (SQL Server)
-- Schemas: staging (CSVs do Olist) e dw (modelo dimensional usado no Power BI)
-- Contem apenas a estrutura (DDL). Os dados sao carregados a partir dos CSVs do Olist.

USE [master]
GO
CREATE DATABASE [Projeto_Ecomm]
GO
USE [Projeto_Ecomm]
GO
/****** Objeto:  Schema [dw]    Data do Script: 21/11/2026 19:04:51 ******/
CREATE SCHEMA [dw]
GO
/****** Objeto:  Schema [staging]    Data do Script: 21/11/2026 19:04:51 ******/
CREATE SCHEMA [staging]
GO
/****** Objeto:  Table [dw].[dim_calendario]    Data do Script: 21/11/2026 19:04:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[dim_calendario](
	[data] [date] NOT NULL,
	[ano] [int] NOT NULL,
	[trimestre] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[nome_mes] [nvarchar](20) NOT NULL,
	[ano_mes] [char](7) NOT NULL,
	[dia] [int] NOT NULL,
	[dia_semana] [int] NOT NULL,
	[nome_dia_semana] [nvarchar](20) NOT NULL,
	[fim_de_semana] [bit] NOT NULL,
 CONSTRAINT [PK_dim_calendario] PRIMARY KEY CLUSTERED 
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[dim_customers]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[dim_customers](
	[customer_id] [nvarchar](50) NOT NULL,
	[customer_unique_id] [nvarchar](50) NULL,
	[customer_zip_code_prefix] [nvarchar](5) NULL,
	[customer_city] [nvarchar](100) NULL,
	[customer_state] [nvarchar](2) NULL,
 CONSTRAINT [PK_dim_customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[dim_products]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[dim_products](
	[product_id] [nvarchar](50) NOT NULL,
	[product_category_name] [nvarchar](100) NULL,
	[product_category_name_english] [nvarchar](100) NULL,
	[product_name_length] [int] NULL,
	[product_description_length] [int] NULL,
	[product_photos_qty] [int] NULL,
	[product_weight_g] [int] NULL,
	[product_length_cm] [int] NULL,
	[product_height_cm] [int] NULL,
	[product_width_cm] [int] NULL,
 CONSTRAINT [PK_dim_products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[dim_sellers]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[dim_sellers](
	[seller_id] [nvarchar](50) NOT NULL,
	[seller_zip_code_prefix] [nvarchar](5) NULL,
	[seller_city] [nvarchar](100) NULL,
	[seller_state] [nvarchar](2) NULL,
 CONSTRAINT [PK_dim_sellers] PRIMARY KEY CLUSTERED 
(
	[seller_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[fato_pagamentos]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[fato_pagamentos](
	[order_id] [nvarchar](50) NOT NULL,
	[payment_sequential] [int] NOT NULL,
	[payment_type] [nvarchar](50) NULL,
	[payment_installments] [int] NULL,
	[payment_value] [decimal](12, 2) NOT NULL,
	[customer_id] [nvarchar](50) NULL,
	[order_purchase_date] [date] NULL,
 CONSTRAINT [PK_fato_pagamentos] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[payment_sequential] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[fato_pedidos]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[fato_pedidos](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](30) NULL,
	[order_purchase_date] [date] NULL,
	[order_approved_date] [date] NULL,
	[order_delivered_carrier_date] [date] NULL,
	[order_delivered_customer_date] [date] NULL,
	[order_estimated_delivery_date] [date] NULL,
 CONSTRAINT [PK_fato_pedidos] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[fato_reviews]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[fato_reviews](
	[review_id] [nvarchar](50) NOT NULL,
	[order_id] [nvarchar](50) NOT NULL,
	[review_score] [int] NOT NULL,
	[review_comment_title] [nvarchar](max) NULL,
	[review_comment_message] [nvarchar](max) NULL,
	[review_creation_date] [datetime2](7) NULL,
	[review_answer_timestamp] [datetime2](7) NULL,
	[review_creation_date_only] [date] NULL,
	[customer_id] [nvarchar](50) NULL,
 CONSTRAINT [PK_fato_reviews] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[fato_vendas]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[fato_vendas](
	[order_id] [nvarchar](50) NOT NULL,
	[order_item_id] [int] NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[seller_id] [nvarchar](50) NOT NULL,
	[price] [decimal](12, 2) NOT NULL,
	[freight_value] [decimal](12, 2) NOT NULL,
	[total_item_value]  AS ([price]+[freight_value]),
	[customer_id] [nvarchar](50) NULL,
	[order_purchase_date] [date] NULL,
 CONSTRAINT [PK_fato_vendas] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [dw].[orders]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[orders](
	[order_id] [nvarchar](50) NOT NULL,
	[customer_id] [nvarchar](50) NOT NULL,
	[order_status] [nvarchar](30) NULL,
	[order_purchase_timestamp] [datetime2](7) NULL,
	[order_approved_at] [datetime2](7) NULL,
	[order_delivered_carrier_date] [datetime2](7) NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[order_estimated_delivery_date] [datetime2](7) NULL,
	[order_purchase_date] [date] NULL,
	[order_approved_date] [date] NULL,
	[order_delivered_carrier_date_only] [date] NULL,
	[order_delivered_customer_date_only] [date] NULL,
	[order_estimated_delivery_date_only] [date] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_customers_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_customers_dataset](
	[customer_id] [nvarchar](50) NULL,
	[customer_unique_id] [nvarchar](50) NULL,
	[customer_zip_code_prefix] [nvarchar](50) NULL,
	[customer_city] [nvarchar](50) NULL,
	[customer_state] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_geolocation_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_geolocation_dataset](
	[geolocation_zip_code_prefix] [nvarchar](50) NULL,
	[geolocation_lat] [nvarchar](50) NULL,
	[geolocation_lng] [nvarchar](50) NULL,
	[geolocation_city] [nvarchar](50) NULL,
	[geolocation_state] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_order_items_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_order_items_dataset](
	[order_id] [nvarchar](50) NULL,
	[order_item_id] [nvarchar](50) NULL,
	[product_id] [nvarchar](50) NULL,
	[seller_id] [nvarchar](50) NULL,
	[shipping_limit_date] [datetime2](7) NULL,
	[price] [nvarchar](50) NULL,
	[freight_value] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_order_payments_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_order_payments_dataset](
	[order_id] [nvarchar](50) NULL,
	[payment_sequential] [tinyint] NULL,
	[payment_type] [nvarchar](50) NULL,
	[payment_installments] [tinyint] NULL,
	[payment_value] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_order_reviews_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_order_reviews_dataset](
	[review_id] [nvarchar](50) NULL,
	[order_id] [nvarchar](50) NULL,
	[review_score] [tinyint] NULL,
	[review_comment_title] [nvarchar](50) NULL,
	[review_comment_message] [nvarchar](250) NULL,
	[review_creation_date] [datetime2](7) NULL,
	[review_answer_timestamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_orders_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_orders_dataset](
	[order_id] [nvarchar](50) NULL,
	[customer_id] [nvarchar](50) NULL,
	[order_status] [nvarchar](50) NULL,
	[order_purchase_timestamp] [datetime2](7) NULL,
	[order_approved_at] [datetime2](7) NULL,
	[order_delivered_carrier_date] [datetime2](7) NULL,
	[order_delivered_customer_date] [datetime2](7) NULL,
	[order_estimated_delivery_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_products_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_products_dataset](
	[product_id] [nvarchar](50) NULL,
	[product_category_name] [nvarchar](50) NULL,
	[product_name_lenght] [tinyint] NULL,
	[product_description_lenght] [smallint] NULL,
	[product_photos_qty] [tinyint] NULL,
	[product_weight_g] [int] NULL,
	[product_length_cm] [tinyint] NULL,
	[product_height_cm] [tinyint] NULL,
	[product_width_cm] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[olist_sellers_dataset]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[olist_sellers_dataset](
	[seller_id] [nvarchar](50) NULL,
	[seller_zip_code_prefix] [nvarchar](50) NULL,
	[seller_city] [nvarchar](50) NULL,
	[seller_state] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Objeto:  Table [staging].[product_category_name_translation]    Data do Script: 21/11/2026 19:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[product_category_name_translation](
	[column1] [nvarchar](50) NOT NULL,
	[column2] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dw].[fato_pagamentos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pagamentos_calendario] FOREIGN KEY([order_purchase_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_pagamentos] CHECK CONSTRAINT [FK_fato_pagamentos_calendario]
GO
ALTER TABLE [dw].[fato_pagamentos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pagamentos_customers] FOREIGN KEY([customer_id])
REFERENCES [dw].[dim_customers] ([customer_id])
GO
ALTER TABLE [dw].[fato_pagamentos] CHECK CONSTRAINT [FK_fato_pagamentos_customers]
GO
ALTER TABLE [dw].[fato_pagamentos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pagamentos_orders] FOREIGN KEY([order_id])
REFERENCES [dw].[orders] ([order_id])
GO
ALTER TABLE [dw].[fato_pagamentos] CHECK CONSTRAINT [FK_fato_pagamentos_orders]
GO
ALTER TABLE [dw].[fato_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pedidos_calendario_aprovacao] FOREIGN KEY([order_approved_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_pedidos] CHECK CONSTRAINT [FK_fato_pedidos_calendario_aprovacao]
GO
ALTER TABLE [dw].[fato_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pedidos_calendario_compra] FOREIGN KEY([order_purchase_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_pedidos] CHECK CONSTRAINT [FK_fato_pedidos_calendario_compra]
GO
ALTER TABLE [dw].[fato_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pedidos_calendario_entrega] FOREIGN KEY([order_delivered_customer_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_pedidos] CHECK CONSTRAINT [FK_fato_pedidos_calendario_entrega]
GO
ALTER TABLE [dw].[fato_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pedidos_calendario_previsao] FOREIGN KEY([order_estimated_delivery_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_pedidos] CHECK CONSTRAINT [FK_fato_pedidos_calendario_previsao]
GO
ALTER TABLE [dw].[fato_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pedidos_calendario_transportadora] FOREIGN KEY([order_delivered_carrier_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_pedidos] CHECK CONSTRAINT [FK_fato_pedidos_calendario_transportadora]
GO
ALTER TABLE [dw].[fato_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_fato_pedidos_customers] FOREIGN KEY([customer_id])
REFERENCES [dw].[dim_customers] ([customer_id])
GO
ALTER TABLE [dw].[fato_pedidos] CHECK CONSTRAINT [FK_fato_pedidos_customers]
GO
ALTER TABLE [dw].[fato_reviews]  WITH CHECK ADD  CONSTRAINT [FK_fato_reviews_calendario] FOREIGN KEY([review_creation_date_only])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_reviews] CHECK CONSTRAINT [FK_fato_reviews_calendario]
GO
ALTER TABLE [dw].[fato_reviews]  WITH CHECK ADD  CONSTRAINT [FK_fato_reviews_customers] FOREIGN KEY([customer_id])
REFERENCES [dw].[dim_customers] ([customer_id])
GO
ALTER TABLE [dw].[fato_reviews] CHECK CONSTRAINT [FK_fato_reviews_customers]
GO
ALTER TABLE [dw].[fato_reviews]  WITH CHECK ADD  CONSTRAINT [FK_fato_reviews_orders] FOREIGN KEY([order_id])
REFERENCES [dw].[orders] ([order_id])
GO
ALTER TABLE [dw].[fato_reviews] CHECK CONSTRAINT [FK_fato_reviews_orders]
GO
ALTER TABLE [dw].[fato_vendas]  WITH CHECK ADD  CONSTRAINT [FK_fato_vendas_calendario] FOREIGN KEY([order_purchase_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[fato_vendas] CHECK CONSTRAINT [FK_fato_vendas_calendario]
GO
ALTER TABLE [dw].[fato_vendas]  WITH CHECK ADD  CONSTRAINT [FK_fato_vendas_customers] FOREIGN KEY([customer_id])
REFERENCES [dw].[dim_customers] ([customer_id])
GO
ALTER TABLE [dw].[fato_vendas] CHECK CONSTRAINT [FK_fato_vendas_customers]
GO
ALTER TABLE [dw].[fato_vendas]  WITH CHECK ADD  CONSTRAINT [FK_fato_vendas_orders] FOREIGN KEY([order_id])
REFERENCES [dw].[orders] ([order_id])
GO
ALTER TABLE [dw].[fato_vendas] CHECK CONSTRAINT [FK_fato_vendas_orders]
GO
ALTER TABLE [dw].[fato_vendas]  WITH CHECK ADD  CONSTRAINT [FK_fato_vendas_products] FOREIGN KEY([product_id])
REFERENCES [dw].[dim_products] ([product_id])
GO
ALTER TABLE [dw].[fato_vendas] CHECK CONSTRAINT [FK_fato_vendas_products]
GO
ALTER TABLE [dw].[fato_vendas]  WITH CHECK ADD  CONSTRAINT [FK_fato_vendas_sellers] FOREIGN KEY([seller_id])
REFERENCES [dw].[dim_sellers] ([seller_id])
GO
ALTER TABLE [dw].[fato_vendas] CHECK CONSTRAINT [FK_fato_vendas_sellers]
GO
ALTER TABLE [dw].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_calendario_aprovacao] FOREIGN KEY([order_approved_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[orders] CHECK CONSTRAINT [FK_orders_calendario_aprovacao]
GO
ALTER TABLE [dw].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_calendario_entrega] FOREIGN KEY([order_delivered_customer_date_only])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[orders] CHECK CONSTRAINT [FK_orders_calendario_entrega]
GO
ALTER TABLE [dw].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_calendario_previsao] FOREIGN KEY([order_estimated_delivery_date_only])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[orders] CHECK CONSTRAINT [FK_orders_calendario_previsao]
GO
ALTER TABLE [dw].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_calendario_transportadora] FOREIGN KEY([order_delivered_carrier_date_only])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[orders] CHECK CONSTRAINT [FK_orders_calendario_transportadora]
GO
ALTER TABLE [dw].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_dim_calendario] FOREIGN KEY([order_purchase_date])
REFERENCES [dw].[dim_calendario] ([data])
GO
ALTER TABLE [dw].[orders] CHECK CONSTRAINT [FK_orders_dim_calendario]
GO
ALTER TABLE [dw].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_dim_customers] FOREIGN KEY([customer_id])
REFERENCES [dw].[dim_customers] ([customer_id])
GO
ALTER TABLE [dw].[orders] CHECK CONSTRAINT [FK_orders_dim_customers]
GO
ALTER TABLE [dw].[fato_reviews]  WITH CHECK ADD  CONSTRAINT [CK_fato_reviews_score] CHECK  (([review_score]>=(1) AND [review_score]<=(5)))
GO
ALTER TABLE [dw].[fato_reviews] CHECK CONSTRAINT [CK_fato_reviews_score]
GO
USE [master]
GO
