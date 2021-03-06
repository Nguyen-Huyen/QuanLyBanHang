USE [master]
GO
/****** Object:  Database [DATA_LYN]    Script Date: 2019-11-10 10:02:31 PM ******/
CREATE DATABASE [DATA_LYN]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DATA_LYN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DATA_LYN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DATA_LYN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DATA_LYN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DATA_LYN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DATA_LYN] SET ARITHABORT OFF 
GO
ALTER DATABASE [DATA_LYN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DATA_LYN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DATA_LYN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DATA_LYN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DATA_LYN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DATA_LYN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DATA_LYN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DATA_LYN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DATA_LYN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DATA_LYN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DATA_LYN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DATA_LYN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DATA_LYN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DATA_LYN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DATA_LYN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DATA_LYN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DATA_LYN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DATA_LYN] SET RECOVERY FULL 
GO
ALTER DATABASE [DATA_LYN] SET  MULTI_USER 
GO
ALTER DATABASE [DATA_LYN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DATA_LYN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DATA_LYN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DATA_LYN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DATA_LYN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DATA_LYN', N'ON'
GO
USE [DATA_LYN]
GO
/****** Object:  UserDefinedFunction [fMaHD]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [fMaHD]()
returns char(8)
begin
declare @MaMax char(8), @lenMAX int, @len int, @MaMoi char(8)
set @MaMax = (select max(cast(right(MaHD, 6) as int)) from HOADON) + 1
set @len = len(@MaMax)
set @lenMAX = (select top 1 len(MaHD) from HOADON)
if @len < @lenMAX - 1
begin
set @MaMoi = 'HD'+replicate('0',@lenMAX - @len - 2) + cast(@MaMax as char)
end
else
begin
set @MaMoi = 'HD' + cast(@MaMax as char)
end
return @MaMoi
end
GO
/****** Object:  UserDefinedFunction [fMaKH]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [fMaKH]()
returns char(6)
begin
declare @MaMax char(8), @lenMAX int, @len int, @MaMoi char(8)
set @MaMax = (select max(cast(right(MaKH, 4) as int)) from KHACH) + 1
set @len = len(@MaMax)
set @lenMAX = (select top 1 len(MaKH) from KHACH)
if @len < @lenMAX - 1
begin
set @MaMoi = 'KH'+replicate('0',@lenMAX - @len - 2) + cast(@MaMax as char)
end
else
begin
set @MaMoi = 'KH' + cast(@MaMax as char)
end
return @MaMoi
end
GO
/****** Object:  Table [ACCOUNT]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ACCOUNT](
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[UserRight] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ChitietHOADON]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ChitietHOADON](
	[MaHD] [char](8) NOT NULL,
	[MaH] [char](5) NOT NULL,
	[SLB] [int] NULL,
	[DonGia] [numeric](15, 0) NOT NULL,
	[ChietKhau] [int] NULL,
	[ThanhTien] [numeric](15, 0) NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HANG]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HANG](
	[MaH] [char](5) NOT NULL,
	[TenH] [nvarchar](50) NOT NULL,
	[DonGia] [numeric](10, 0) NOT NULL,
	[SLT] [int] NULL,
	[ChietKhau] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HOADON]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HOADON](
	[MaHD] [char](8) NOT NULL,
	[MaKH] [char](6) NOT NULL,
	[NgayBan] [date] NULL,
	[ThoiGian] [time](7) NULL,
	[TongTT] [numeric](10, 0) NOT NULL,
	[DiemTL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [KHACH]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KHACH](
	[MaKH] [char](6) NOT NULL,
	[TenKH] [nvarchar](30) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[TongTL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [ACCOUNT] ([Username], [Password], [UserRight]) VALUES (N'admin', N'abc123', 1)
INSERT [ACCOUNT] ([Username], [Password], [UserRight]) VALUES (N'user01', N'12345', 0)
INSERT [ACCOUNT] ([Username], [Password], [UserRight]) VALUES (N'user02', N'12345', 0)
INSERT [ACCOUNT] ([Username], [Password], [UserRight]) VALUES (N'user03', N'12345', 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'AK001', N'Áo khoác 220', CAST(220000 AS Numeric(10, 0)), 125, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'AK002', N'Áo khoác 250', CAST(250000 AS Numeric(10, 0)), 75, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'AK003', N'Áo khoác 295', CAST(295000 AS Numeric(10, 0)), 60, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'AT001', N'Áo thun 130', CAST(130000 AS Numeric(10, 0)), 150, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'AT002', N'Áo thun 190', CAST(190000 AS Numeric(10, 0)), 90, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'CV001', N'Chân váy công sở 130', CAST(130000 AS Numeric(10, 0)), 25, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'CV002', N'Chân váy kaki 115', CAST(115000 AS Numeric(10, 0)), 20, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'QJ001', N'Quần Jean lửng 136', CAST(136000 AS Numeric(10, 0)), 40, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'QJ002', N'Quần Jean dài 198', CAST(198000 AS Numeric(10, 0)), 100, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'QJ003', N'Quần Jean đùi 137', CAST(137000 AS Numeric(10, 0)), 80, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'QK001', N'Quần Kaki dài 150', CAST(150000 AS Numeric(10, 0)), 65, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'QK002', N'Quần Kaki ngắn 129', CAST(129000 AS Numeric(10, 0)), 50, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'QT001', N'Quần tây dài 135', CAST(135000 AS Numeric(10, 0)), 75, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'QT002', N'Quần tây ngắn 160', CAST(160000 AS Numeric(10, 0)), 120, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'SM001', N'Áo sơ mi 140', CAST(140000 AS Numeric(10, 0)), 100, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'SM002', N'Áo sơ mi 155', CAST(155000 AS Numeric(10, 0)), 80, 0)
INSERT [HANG] ([MaH], [TenH], [DonGia], [SLT], [ChietKhau]) VALUES (N'SM003', N'Áo sơ mi 183', CAST(183000 AS Numeric(10, 0)), 80, 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000001', N'KH0001', CAST(N'2019-01-15' AS Date), CAST(N'08:00:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000002', N'KH0005', CAST(N'2019-01-15' AS Date), CAST(N'13:00:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000003', N'KH0009', CAST(N'2019-01-20' AS Date), CAST(N'08:30:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000004', N'KH0017', CAST(N'2019-01-25' AS Date), CAST(N'13:30:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000005', N'KH0005', CAST(N'2019-03-01' AS Date), CAST(N'07:00:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000006', N'KH0002', CAST(N'2019-03-10' AS Date), CAST(N'17:00:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000007', N'KH0007', CAST(N'2019-05-17' AS Date), CAST(N'16:00:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000008', N'KH0020', CAST(N'2019-05-22' AS Date), CAST(N'19:00:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000009', N'KH0008', CAST(N'2019-05-29' AS Date), CAST(N'11:30:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000010', N'KH0013', CAST(N'2019-06-15' AS Date), CAST(N'09:30:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000011', N'KH0005', CAST(N'2019-06-17' AS Date), CAST(N'08:45:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000012', N'KH0010', CAST(N'2019-06-28' AS Date), CAST(N'20:15:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000013', N'KH0006', CAST(N'2019-07-05' AS Date), CAST(N'09:15:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000014', N'KH0010', CAST(N'2019-07-17' AS Date), CAST(N'19:15:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000015', N'KH0003', CAST(N'2019-08-25' AS Date), CAST(N'19:45:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000016', N'KH0015', CAST(N'2019-08-27' AS Date), CAST(N'15:25:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000017', N'KH0018', CAST(N'2019-09-02' AS Date), CAST(N'17:15:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000018', N'KH0015', CAST(N'2019-09-10' AS Date), CAST(N'17:25:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000019', N'KH0001', CAST(N'2019-10-20' AS Date), CAST(N'19:35:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [HOADON] ([MaHD], [MaKH], [NgayBan], [ThoiGian], [TongTT], [DiemTL]) VALUES (N'HD000020', N'KH0017', CAST(N'2019-10-25' AS Date), CAST(N'19:50:00' AS Time), CAST(0 AS Numeric(10, 0)), 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0001', N'Nguyễn Thị Mỹ Dung', N'0905939426', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0002', N'Phạm Thị Kiều Trinh', N'0978354865', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0003', N'Nguyễn Lê Hồng Nhung', N'0964318076', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0004', N'Lê Thị Linh Trang', N'0976308098', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0005', N'Nguyễn Nhật Anh', N'0966654330', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0006', N'Trương Nhật Minh', N'0348438000', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0007', N'Lê Nguyễn Hoàng Văn', N'0935700123', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0008', N'Nguyễn Văn Hoàng Long', N'0935604934', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0009', N'Trần Phước Đạt', N'0905939426', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0010', N'Trương Thị Ngọc Ánh', N'0724064353', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0011', N'Lương Minh Hiếu', N'0932517402', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0012', N'Nguyễn Ngọc Thắng', N'0702023287', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0013', N'Phan Thị Hằng', N'0982805825', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0014', N'Hồ Quỳnh Hữu Phát', N'0935777298', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0015', N'Nguyễn Thị Ngọc Hân', N'0905886802', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0016', N'Trương Quang Hòa', N'0708776312', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0017', N'Lê Anh Huy', N'0364217772', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0018', N'Hồ Trần Nhật Khánh', N'0969590517', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0019', N'Đoàn Thị Kim Linh', N'0914660398', 0)
INSERT [KHACH] ([MaKH], [TenKH], [SDT], [TongTL]) VALUES (N'KH0020', N'Phan Công Diễn', N'0914163750', 0)
SET ANSI_PADDING ON
GO
/****** Object:  Index [indexKhach]    Script Date: 2019-11-10 10:02:32 PM ******/
CREATE NONCLUSTERED INDEX [indexKhach] ON [KHACH]
(
	[TenKH] ASC,
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [KHACH] ADD  DEFAULT ((0)) FOR [TongTL]
GO
ALTER TABLE [ChitietHOADON]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [HOADON] ([MaHD])
GO
ALTER TABLE [ChitietHOADON] CHECK CONSTRAINT [FK_HoaDon]
GO
ALTER TABLE [ChitietHOADON]  WITH CHECK ADD  CONSTRAINT [FK_MaH] FOREIGN KEY([MaH])
REFERENCES [HANG] ([MaH])
GO
ALTER TABLE [ChitietHOADON] CHECK CONSTRAINT [FK_MaH]
GO
ALTER TABLE [HOADON]  WITH CHECK ADD  CONSTRAINT [PK_HoaDon] FOREIGN KEY([MaKH])
REFERENCES [KHACH] ([MaKH])
GO
ALTER TABLE [HOADON] CHECK CONSTRAINT [PK_HoaDon]
GO
/****** Object:  Trigger [tgDelHDCT]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [tgDelHDCT] on [ChitietHOADON] for delete
as
begin
	declare @thanhtien numeric(15,0), @slb int, @mahd char(8), @mah char(5),@makh char(6)
	select @thanhtien= ThanhTien, @slb = SLB  from deleted
	select @mahd= MaHD, @mah= MaH from deleted 
	select @makh =MaKH from HOADON where MaHD = @mahd
	update HOADON
	set TongTT = TongTT -@thanhtien
	where  MaHD = @mahd
	update HOADON
	set  DiemTL = DiemTl - (@thanhtien/10000)
	where  MaHD = @mahd
	update  HANG
	set SLT = SLT + @slb 
	where MaH = @mah 
	update KHACH
	set TongTL = TongTL - ((select ThanhTien from deleted join HOADON on deleted.MaHD = HOADON.MaHD)/10000) 
	where MaKH = @makh
end
GO
ALTER TABLE [dbo].[ChitietHOADON] ENABLE TRIGGER [tgDelHDCT]
GO
/****** Object:  Trigger [tgInsBillDetails]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [tgInsBillDetails] 
on [ChitietHOADON] for Insert
as
begin
declare @MaHD char(8), @MaH char(5), @SLB int, @MaKH char(6)
Select @MaHD = MaHD, @MaH = MaH , @SLB = SLB from inserted 
Select @MaKH = MaKH from HOADON where MaHD = @MaHD
--BillDetails
	Update ChitietHOADON
	Set ChietKhau = (Select ChietKhau from HANG where MaH = @MaH),
		DonGia = (Select DonGia from HANG where MaH = @MaH),
ThanhTien = (@SLB * (Select DonGia from HANG where MaH = @MaH)- 
(@SLB * (Select DonGia from HANG where MaH = @MaH)* (Select ChietKhau from HANG where MaH = @MaH)))
	where MaH = @MaH
	--
	Update HOADON 
Set TongTT = (select Sum(ThanhTien) from ChitietHOADON where MaHD = @MaHD), DiemTL = (select Sum(ThanhTien) from ChitietHOADON where MaHD = @MaHD)/10000
where MaHD = @MaHD
--Items
Update HANG
Set SLT = SLT - @SLB from inserted
--Customers
Update KHACH
Set TongTL = (select sum(DiemTL) from HOADON inner join KHACH on HOADON.MaKH = KHACH.MaKH where KHACH.MaKH = @MaKH )
where MaKH = @MaKH
end
GO
ALTER TABLE [dbo].[ChitietHOADON] ENABLE TRIGGER [tgInsBillDetails]
GO
/****** Object:  Trigger [tgDelItems]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [tgDelItems]
	on [HANG] instead of Delete
	as
	begin
	declare @MaH char(5)
	set @MaH = (select MaH from deleted)
	Update HANG
	set SLT =0 where MaH = @MaH
	end
GO
ALTER TABLE [dbo].[HANG] ENABLE TRIGGER [tgDelItems]
GO
/****** Object:  Trigger [tgDelBills]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [tgDelBills]
on [HOADON] for Delete
as
begin
declare @maHD char(8), @maH char(5), @MaKH char(6) 
select @maHD = MaHD, @maKH= MaKH from deleted
set @maH = (select MaH from ChitietHOADON where MaHD = @MaHD )
Delete from ChitietHOADON where MaHD = @maHD
Update KHACH 
set TongTL = TongTL - (select DiemTL from deleted)
where MaKH = @MaKH
Update HANG
set SLT = SLT + (Select SLB from ChitietHOADON where MaH =@MaH)
where MaH = @maH
end
GO
ALTER TABLE [dbo].[HOADON] ENABLE TRIGGER [tgDelBills]
GO
/****** Object:  Trigger [tgInsBills]    Script Date: 2019-11-10 10:02:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [tgInsBills]
on [HOADON] for Insert
as
begin
Update HOADON 
set MaHD = (select dbo.fMaHD())
where MaHD ='00000000'
end
GO
ALTER TABLE [dbo].[HOADON] ENABLE TRIGGER [tgInsBills]
GO
/****** Object:  Trigger [tgDelCustomers]    Script Date: 2019-11-10 10:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [tgDelCustomers] 
	on [KHACH] instead of delete
	as
	begin
	declare @MaKH char (6) 
	select @MaKH=MaKH from deleted
	update KHACH
	set TongTL=0
	where MaKH=@MaKH
	end
GO
ALTER TABLE [dbo].[KHACH] ENABLE TRIGGER [tgDelCustomers]
GO
/****** Object:  Trigger [tgInsCustomers]    Script Date: 2019-11-10 10:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [tgInsCustomers]
on [KHACH] for Insert
as
begin
Update KHACH
set MaKH = (select dbo.fMaKH())
where MaKH ='000000'
end
GO
ALTER TABLE [dbo].[KHACH] ENABLE TRIGGER [tgInsCustomers]
GO
USE [master]
GO
ALTER DATABASE [DATA_LYN] SET  READ_WRITE 
GO
