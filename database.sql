
CREATE DATABASE [RiceStore]
 GO
USE [RiceStore]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 05/04/2023 10:38:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[num] [int] NULL,
	[total_money] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 05/04/2023 10:38:42 am ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 05/04/2023 10:38:42 am ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 05/04/2023 10:38:42 am ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 05/04/2023 10:38:42 am ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 05/04/2023 10:38:42 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[password] [varchar](200) NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK__NhanVien__3213E83FB7623737] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 05/04/2023 10:38:42 am ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 05/04/2023 10:38:42 am ******/
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
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (1, N'Gạo dinh dưỡng  ')
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (2, N'Gạo đóng túi')
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (3, N'Gạo phổ thông')
INSERT [dbo].[DanhMuc] ([id], [name]) VALUES (4, N'Gạo nếp')
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (27, N'Lưu Khả Ái', N'ailuu@gmail.com', N'0975345120', N'520 Điện Biên Phủ, Bình Thạnh', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (28, N'Trần Hoàng Khải', N'Khaith@gmail.com', N'0124446789', N'233 Lê Hồng Phong, Quận 10', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (29, N'Nguyễn Quốc Trung', N'Trungnq@gmail.com', N'0986572124', N'517 Kha Vạn Cân, Thành Phố Thủ Đức', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (30, N'Dương Minh Chiến', N'Chiendm@gmail.com', N'0978266412', N'123 Lê Văn Việt, Quận 9', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (31, N'Trần Văn Sơn', N'Sontv@gmail.com', N'0897124733', N'12 Lò Lu, Quận 9', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (32, N'Trần Nguyễn Phúc Hậu', N'Hautnp@gmail.com', N'0988477577', N'125 Man Thiện, Quận 9', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (33, N'Bùi Bá Quảng', N'Quangbb@gmail.com', N'0456789213', N'786 Mai Chí Thọ', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (34, N'Nguyễn Ngọc Huy', N'Huynn@gmail.com', N'0789234567', N'17 Linh Trung, Thành Phố Thủ Đức', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
INSERT [dbo].[KhachHang] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (35, N'Lâm Tố Như', N'Nhutl@gmail.com', N'0678924453', N'580 Kinh Dương Vương', N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 2)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (1, N'Triều', N'admin1@gmail.com', N'0123412386', NULL, N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 1)
INSERT [dbo].[NhanVien] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (2, N'Thạch', N'admin2@gmail.com', N'0984672813', NULL, N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 3)
INSERT [dbo].[NhanVien] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (3, N'Trung', N'admin3@gmail.com', N'0763432477', NULL, N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 3)
INSERT [dbo].[NhanVien] ([id], [fullname], [email], [phone_number], [address], [password], [role_id]) VALUES (4, N'Quân', N'admin4@gmail.com', N'0543798112', NULL, N'58ac9be60d1d45b253786e347d5a54bfce11c1f5f7a2fdf8cea84260ee0b0613', 3)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
INSERT [dbo].[PhanQuyen] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([id], [name]) VALUES (2, N'KH')
INSERT [dbo].[PhanQuyen] ([id], [name]) VALUES (3, N'NhanVien')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (1, 1, N'Hạt Ngọc Trời Bạch Dương', 112000, N'/Content/images/Gao/gao1.jpg', 99, N'Gạo khi nấu cho cơm trắng dẻo, thơm dịu và ngọt nhẹ. Gạo Hạt Ngọc Trời Bạch Dương túi 5kg của  gạo Hạt Ngọc Trời với hạt gạo dẻo vừa và thơm lài, được nuôi trồng canh tác theo quy trình kĩ thuật hiện đại, đảm bảo an toàn và chất lượng cho người sử dụng. Mang đến bữa cơm ngon cho gia đình bạn.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (2, 2, N'Vua Gạo Đậm Đà', 119000, N'/Content/images/Gao/gao2.jpg', 65, N'Gạo từ thương hiệu gạo Vua Gạo đậm đà sử dụng giống gạo từ Campuchia, cho hạt gạo dài, đều, đẹp mắt. Gạo hạt dài, dẻo vừa, thơm lừng, trắng đều. Gạo thơm Vua Gạo Đậm Đà túi 5kg được canh tác trên vùng đất phù sa màu mỡ, mỗi năm chỉ có thu hoạch 1 vụ lúa nên đảm bảo chất lượng gạo sạch.')
INSERT [dbo].[SanPham] ([id], [DM_id], [title], [price], [thumbnail], [quantity], [description]) VALUES (3, 2, N'Hạt Ngọc Trời Thiên Vương', 195500, N'/Content/images/Gao/gao3.jpg', 93, N'Gạo khi nấu vị dẻo, vị thơm đặc trưng sẽ kích thích vị giác giúp thưởng thức các món ăn khác tuyệt vời hơn..Gạo thơm Hạt Ngọc Trời Thiên Vương túi 5kg với hạt dài, thơm đặc trưng và nở ít tạo giác ăn ngon miệng,  đảm bảo an toàn, không tẩy trắng, không chứa chất bảo quản.')
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
