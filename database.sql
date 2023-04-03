
CREATE DATABASE [RiceStore]
 
USE [RiceStore]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [int] NULL,
	[num] [int] NULL,
	[total_money] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KH_id] [int] NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[note] [nvarchar](1000) NULL,
	[order_date] [datetime] NULL,
	[status] [int] NULL,
	[total_money] [int] NULL,
 CONSTRAINT [PK__DonHang__3213E83F7C4CA59C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](30) NULL,
	[phone_number] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[note] [varchar](1000) NULL,
 CONSTRAINT [PK__FeedBack__3213E83FEC633A26] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[password] [varchar](200) NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK__KhachHan__3213E83FBEDBC4F7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [int] NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[password] [varchar](50) NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK__NhanVien__3213E83FB7623737] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[id] [int] NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 02/04/2023 9:00:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DM_id] [int] NULL,
	[title] [nvarchar](250) NULL,
	[price] [int] NULL,
	[thumbnail] [nvarchar](500) NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [PK__SanPham__3213E83F96F94E9E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (21, 15, 2, 238000, 2, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (22, 16, 2, 238000, 2, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (23, 17, 2, 238000, 2, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (24, 17, 1, 112000, 1, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (25, 18, 2, 238000, 2, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (26, 19, 3, 782000, 4, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (27, 19, 2, 119000, 1, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (28, 20, 2, 238000, 2, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (29, 22, 2, 119000, 1, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (30, 23, 2, 119000, 1, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (31, 24, 2, 119000, 1, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (32, 25, 2, 119000, 1, NULL)
INSERT [dbo].[ChiTietDonHang] ([id], [order_id], [product_id], [price], [num], [total_money]) VALUES (33, 26, 2, 119000, 1, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
GO
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (1, N'Gạo dinh dưỡng  ')
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (2, N'Gạo đóng túi')
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (3, N'Gạo phổ thông')
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (4, N'Gạo nếp')
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (15, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-03-30T15:47:03.103' AS DateTime), 0, 238000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (16, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-03-31T22:47:53.920' AS DateTime), 0, 238000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (17, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-03-31T22:51:06.987' AS DateTime), 0, 350000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (18, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-03-31T23:21:22.770' AS DateTime), 0, 238000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (19, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-01T11:29:55.863' AS DateTime), 0, 901000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (20, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-01T22:38:41.487' AS DateTime), 0, 238000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (21, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-01T22:38:48.710' AS DateTime), 0, 0)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (22, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-02T09:00:23.833' AS DateTime), 0, 119000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (23, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-02T09:29:03.683' AS DateTime), 0, 119000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (24, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-02T09:38:23.740' AS DateTime), 0, 119000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (25, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-02T09:46:17.877' AS DateTime), 0, 119000)
INSERT [dbo].[DonHang] ([id], [KH_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (26, 1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, NULL, CAST(N'2023-04-02T10:16:24.793' AS DateTime), 0, 119000)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (1, N'Trần Luu Đông Triều', N'tranluudongtrieu@gmail.com', N'0345349184', NULL, N'123', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (11, N'trieu', N'dt1@gmail.com', N'123', NULL, N'123', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (12, N'Triều Đông123', N'dt27@gmail.com', N'0345349184', N'Phường Long Thạnh Mỹ, Quận 9, TP Thủ Đức', N'688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 2)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[NhanVien] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (1, N'DT', N'dt1@gmail.com', N'0123456789', NULL, N'123', 1)
INSERT [dbo].[NhanVien] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (2, N'dt', N'dt2@gmail.com', NULL, NULL, N'123', 3)
GO
INSERT [dbo].[PhanQuyen] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([id], [name]) VALUES (2, N'KH')
INSERT [dbo].[PhanQuyen] ([id], [name]) VALUES (3, N'NhanVien')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (1, 1, N'Hạt Ngọc Trời Bạch Dương', 112000, N'/Content/images/Gao/gao1.jpg', 99, N'Gạo khi nấu cho cơm trắng dẻo, thơm dịu và ngọt nhẹ. Gạo Hạt Ngọc Trời Bạch Dương túi 5kg của  gạo Hạt Ngọc Trời với hạt gạo dẻo vừa và thơm lài, được nuôi trồng canh tác theo quy trình kĩ thuật hiện đại, đảm bảo an toàn và chất lượng cho người sử dụng. Mang đến bữa cơm ngon cho gia đình bạn.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (2, 2, N'Vua Gạo Đậm Đà', 119000, N'/Content/images/Gao/gao2.jpg', 84, N'Gạo từ thương hiệu gạo Vua Gạo đậm đà sử dụng giống gạo từ Campuchia, cho hạt gạo dài, đều, đẹp mắt. Gạo hạt dài, dẻo vừa, thơm lừng, trắng đều. Gạo thơm Vua Gạo Đậm Đà túi 5kg được canh tác trên vùng đất phù sa màu mỡ, mỗi năm chỉ có thu hoạch 1 vụ lúa nên đảm bảo chất lượng gạo sạch.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (3, 2, N'Hạt Ngọc Trời Thiên Vương', 195500, N'/Content/images/Gao/gao3.jpg', 96, N'Gạo khi nấu vị dẻo, vị thơm đặc trưng sẽ kích thích vị giác giúp thưởng thức các món ăn khác tuyệt vời hơn..Gạo thơm Hạt Ngọc Trời Thiên Vương túi 5kg với hạt dài, thơm đặc trưng và nở ít tạo giác ăn ngon miệng,  đảm bảo an toàn, không tẩy trắng, không chứa chất bảo quản.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (4, 1, N'Vua Gạo Hương Việt', 105000, N'/Content/images/Gao/gao4.jpg', 100, N'Gạo Vua Gạo hương việt sử dụng giống lúa OM được Viện lúa Đồng Bằng Sông Cửu Long nghiên cứu và lai tạo. Gạo thơm Vua Gạo Hương Việt túi 5kg được canh tác trên các cánh đồng riêng biệt, màu mỡ và an toàn.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (5, 2, N'Thiên Nhật', 77000, N'/Content/images/Gao/gao5.jpg', 100, N'Gạo Thiên Nhật chất lượng, không chứa chất bảo quản, tạo mùi hay tẩy trắng. Gạo thơm Thiên Nhật túi 5kg cho ra cơm mềm, thơm và dẻo, giúp ăm ngon miệng hơn. Gạo túi 5kg tiện lợi và tiết kiệm cho cả gia đình cùng sử dụng.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (6, 2, N'Trạng Nguyên Vinh Hiển ST25', 79000, N'/Content/images/Gao/gao6.jpg', 100, N'Gạo Thiên Nhật chất lượng, không chứa chất bảo quản, tạo mùi hay tẩy trắng. Gạo thơm Thiên Nhật túi 5kg cho ra cơm mềm, thơm và dẻo, giúp ăm ngon miệng hơn. Gạo túi 5kg tiện lợi và tiết kiệm cho cả gia đình cùng sử dụng.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (7, 2, N'Home Rice Bảo Bình', 119000, N'/Content/images/Gao/gao7.jpg', 100, N'Hạt gạo thon dài, trắng đẹp giúp cho từng hạt cơm trở nên đẹp mắt và lôi cuốn người dùng. Khi nấu cho cơm dẻo nhiều, dai cơm, ít nở cùng với hương thơm nhẹ mùi lá dứa đặc trưng của giống gạo, lôi cuốn người ăn trong từng món ăn, để nguội, hạt cơm lại càng mềm dẻo thơm ngon, không bị cứng.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (8, 3, N'Vua Gạo Làng Ta', 46000, N'/Content/images/Gao/gao8.jpg', 100, N'Với hạt gạo cho ra cơm mềm dẻo, thơm ngon. Gạo thơm Vua Gạo Làng Ta túi 2kg là một trong những sản phẩm được nhiều người tin dùng đến từ thương hiệu Vua Gạo quen thuộc. Sử dụng giống lúa thuần do Việt Nam lai tạo ra, có khả năng tăng trưởng và kháng sâu bệnh tốt.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (9, 3, N'Ngọc Sa Cỏ May', 157000, N'/Content/images/Gao/gao9.jpg', 100, N'Gạo Cỏ May ngọt cơm, hạt cơm dẻo mềm và chất lượng. Gạo ngọc sa Cỏ May túi 5kg được hút chân không, rất chất lượng và tiện lợi. Gạo được trồng theo quy trình canh tác tiên tiến, không sử dụng chất kích thích và tăng trưởng, an tâm cho bạn sử dụng')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (10, 4, N'Angel Hero', 135000, N'/Content/images/Gao/gao10.jpg', 100, N'Gạo thơm Angel được sản xuất trên dây chuyền hiện đại, cam kết không đấu trộn, không chất tạo mùi, gạo chất lượng, an toàn cho sức khoẻ người dùng. Gạo thơm Angel Hero túi 5kg hạt gạo trắng, thơm ngon dẻo mềm phù hợp với chế độ ăn chay cũng như không chứa các chất bảo quản.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (11, 4, N'Meizan Nàng Thơm', 110500, N'/Content/images/Gao/gao11.jpg', 100, N'Gạo khi nấu có độ mềm dẻo vừa phải cùng hương thơm nhẹ nhàng, kích thích cho bữa ăn thêm phần hấp dẫn. Gạo Meizan Nàng Thơm túi 5kg của hãng gạo Meizan với hạt gạo thon dài, màu trắng ngà tự nhiên, được nuôi trồng canh tác theo tiêu chuẩn nghiêm ngặt đảm bảo an toàn và chất lượng.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (12, 4, N'Lạc Việt Hảo Hạng ST24', 144000, N'/Content/images/Gao/gao12.jpg', 100, N'Gạo ST24 được ưa chuộng bởi độ mềm dẻo, hương thơm đậm đà, gạo Lạc Việt hảo hạng ST24 túi 5kg với 100% hạt gạo tự nhiên được chăm sóc đúng kĩ thuật đảm bảo chất lượng đồng đều trên từng hạt gạo. Gạo Lạc Việt là thương hiệu được tin dùng bởi giá cả hợp lí và an toàn khi sử dụng.')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([order_id])
REFERENCES [dbo].[DonHang] ([id])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([product_id])
REFERENCES [dbo].[SanPham] ([id])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([KH_id])
REFERENCES [dbo].[KhachHang] ([id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_PhanQuyen] FOREIGN KEY([role_id])
REFERENCES [dbo].[PhanQuyen] ([id])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_PhanQuyen]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhanQuyen] FOREIGN KEY([role_id])
REFERENCES [dbo].[PhanQuyen] ([id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhanQuyen]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([DM_id])
REFERENCES [dbo].[DanhMuc] ([id])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
USE [master]
GO
ALTER DATABASE [RiceStore] SET  READ_WRITE 
GO
