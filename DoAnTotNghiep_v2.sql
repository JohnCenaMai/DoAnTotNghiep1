create database maithaison_195261_banmaytinh_2
go

use maithaison_195261_banmaytinh_2

create table maytinh
(
	mamaytinh varchar(25) primary key,
	tensanpham varchar(60) not null,
	xuatxu varchar(20) not null,
	thoigianbaohanh tinyint,
	chieurong float,
	chieucao float,
	chieusau float,
	namramat varchar(4) not null,
	trongluong float,
	soluong int,
	gia int,
	hinhanh nvarchar(255) null
)

create procedure check_maytinh
	@mamaytinh varchar(25),
	@tensanpham varchar(60),
	@xuatxu varchar(20),
	@thoigianbaohanh tinyint,
	@chieurong float,
	@chieucao float,
	@chieusau float,
	@namramat varchar(4),
	@trongluong float,
	@soluong int,
	@gia int,
	@hinhanh nvarchar(255) null
as
	if exists (select * from maytinh
				where tensanpham = @tensanpham
				and xuatxu = @xuatxu
				and thoigianbaohanh = @thoigianbaohanh
				and chieurong = @chieurong
				and chieucao = @chieucao
				and chieusau = @chieusau
				and namramat = @namramat
				and trongluong = @trongluong
				and soluong = @soluong
				and gia = @gia
				)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into maytinh(mamaytinh,tensanpham,xuatxu,thoigianbaohanh,chieurong,chieucao,chieusau,namramat,trongluong,soluong,gia,hinhanh)
		values(@mamaytinh,@tensanpham,@xuatxu,@thoigianbaohanh,@chieurong,@chieucao,@chieusau,@namramat,@trongluong,@soluong,@gia,@hinhanh)
	end
go

create table maytinhhinhanh
(
	stt int identity(1,1) primary key,
	mamaytinh varchar(25) not null,
	hinhanh nvarchar(255) null
)

create table maytinhchitiet
(
	mamaytinh varchar(25) primary key,
	macpu varchar(25) not null,
	maram varchar(25) not null,
	madohoa varchar(25) not null,
	mamanhinh varchar(25) not null,
	maloa varchar(25) not null,
	mapin varchar(25) not null,
	phienbanhedieuhanh varchar(25) not null,
	machatlieu varchar(25) not null,
	mabanphim varchar(25) not null,
	mabonho varchar(25) not null 
)

create table boxuly
(
	macpu varchar(15) primary key,
	congnghecpu varchar(12) null,
	loaicpu varchar(10) not null,
	hangcpu varchar(10) null,
	tocdo float null,
	tocdotoida float null,
	bonhodem int null,
	tocdobus float null,
	soluong int,
	soloi int,
)

select top 1 maram from ram order by maram desc

create procedure check_boxuly
	@macpu varchar(15),
	@congnghecpu varchar(12),
	@loaicpu varchar(10),
	@hangcpu varchar(10),
	@tocdo float,
	@tocdotoida float,
	@bonhodem int,
	@tocdobus float,
	@soluong int,
	@soloi int
as
	if exists (select * from boxuly
				where congnghecpu = @congnghecpu
				and loaicpu = @loaicpu
				and hangcpu = @hangcpu
				and tocdo = @tocdo
				and tocdotoida = @tocdotoida
				and bonhodem = @bonhodem
				and tocdobus = @tocdobus
				and soluong = @soluong
				and soloi = @soloi)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
		values(@macpu,@congnghecpu,@loaicpu,@hangcpu,@tocdo,@tocdotoida,@bonhodem,@tocdobus,@soluong,@soloi)
	end
go

create table ram
(
	maram varchar(15) primary key,
	dungluong tinyint,
	loairam varchar(15) not null,
	tocdoram float null,
	sokhecamroi tinyint,
	sokheramconlai tinyint,
	soramonboard tinyint,
	soramtoida tinyint
)

create procedure check_ram
	@maram varchar(15),
	@dungluong tinyint,
	@loairam varchar(15),
	@tocdoram float,
	@sokhecamroi tinyint,
	@sokheramconlai tinyint,
	@soramonboard tinyint,
	@soramtoida tinyint
as
	if exists (select * from ram
				where dungluong = @dungluong
				and loairam = @loairam
				and tocdoram = @tocdoram
				and sokhecamroi = @sokhecamroi
				and sokheramconlai = @sokheramconlai
				and soramonboard = @soramonboard
				and soramtoida = @soramtoida)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into ram(maram,dungluong,loairam,tocdoram,sokhecamroi,sokheramconlai,soramonboard,soramtoida)
		values(@maram,@dungluong,@loairam,@tocdoram,@sokhecamroi,@sokheramconlai,@soramonboard,@soramtoida)
	end
go

create table manhinh
(
	mamanhinh varchar(15) primary key,
	loaicamung nvarchar(20) null,
	manhinhcamung nvarchar(20) null,
	dotuongphan nvarchar(15) null,
	tylemanhinh nvarchar(15) null,
	dophumau nvarchar(15) null,
	congnghe varchar(15) null,
	dosang nvarchar(15) null,
	dophangiai varchar(25) null,
	tansoquet tinyint,
	loaimanhinh varchar(20) null,
	kichthuocmanhinh varchar(5) not null
)

create procedure check_manhinh
	@mamanhinh varchar(15),
	@loaicamung nvarchar(20),
	@manhinhcamung nvarchar(20),
	@dotuongphan nvarchar(15),
	@tylemanhinh nvarchar(15),
	@dophumau nvarchar(15),
	@congnghe varchar(15),
	@dosang nvarchar(15),
	@dophangiai varchar(25),
	@tansoquet tinyint,
	@loaimanhinh varchar(20),
	@kichthuocmanhinh varchar(5)
as
	if exists (select * from manhinh
				where loaicamung = @loaicamung
				and manhinhcamung = @manhinhcamung
				and dotuongphan = @dotuongphan
				and tylemanhinh = @tylemanhinh
				and dophumau = @dophumau
				and congnghe = @congnghe
				and dosang = @dosang
				and dophangiai = @dophangiai
				and tansoquet = @tansoquet
				and loaimanhinh = @loaimanhinh
				and kichthuocmanhinh = @kichthuocmanhinh)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into manhinh(mamanhinh,loaicamung,manhinhcamung,dotuongphan,tylemanhinh,dophumau,congnghe,dosang,dophangiai,tansoquet,loaimanhinh,kichthuocmanhinh)
		values(@mamanhinh,@loaicamung,@manhinhcamung,@dotuongphan,@tylemanhinh,@dophumau,@congnghe,@dosang,@dophangiai,@tansoquet,@loaimanhinh,@kichthuocmanhinh)
	end
go

create table loa
(
	maloa varchar(15) primary key,
	soloa tinyint,
	congngheamthanh varchar(20)
)

create procedure check_loa
	@maloa varchar(15),
	@soloa tinyint,
	@congngheamthanh varchar(20)
as
	if exists (select * from loa
				where soloa = @soloa
				and congngheamthanh = @congngheamthanh)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into loa(maloa,soloa,congngheamthanh)
		values(@maloa,@soloa,@congngheamthanh)
	end
go

create table pin
(
	mapin varchar(15) primary key,
	loaipin nvarchar(25) null,
	cell varchar(2) null,
	thaoroi bit,
	powersupply varchar(3) null
)

create procedure check_pin
	@mapin varchar(20),
	@loaipin nvarchar(25),
	@cell varchar(2),
	@thaoroi bit,
	@powersupply varchar(3)
as
	if exists (select * from pin
				where loaipin = @loaipin
				and cell = @cell
				and thaoroi = @thaoroi
				and powersupply = @powersupply)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into pin(mapin,loaipin,cell,thaoroi,powersupply)
		values(@mapin,@loaipin,@cell,@thaoroi,@powersupply)
	end
go

create table hedieuhanh
(
	phienbanhedieuhanh varchar(15) primary key,
	ten varchar(25) not null,
	kieu varchar(2) not null
)

create procedure check_hedieuhanh
	@phienbanhedieuhanh varchar(15),
	@ten nvarchar(25),
	@kieu varchar(2)
as
	if exists (select * from hedieuhanh
				where ten = @ten
				and kieu = @kieu)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into hedieuhanh(phienbanhedieuhanh,ten,kieu)
		values(@phienbanhedieuhanh,@ten,@kieu)
	end
go

create table dohoa
(
	madohoa varchar(15) primary key,
	hang varchar(10) null,
	xungnhip float,
	xungnhiptoida float,
	model varchar(10) null,
	cardonboard varchar(20) null
)

create procedure check_dohoa
	@madohoa varchar(15),
	@hang varchar(10),
	@xungnhip float,
	@xungnhiptoida float,
	@model varchar(10),
	@cardonboard varchar(20)
as
	if exists (select * from dohoa
				where hang = @hang
				and xungnhip = @xungnhip
				and xungnhiptoida = @xungnhiptoida
				and model = @model
				and cardonboard = @cardonboard)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into dohoa(madohoa,hang,xungnhip,xungnhiptoida,model,cardonboard)
		values(@madohoa,@hang,@xungnhip,@xungnhiptoida,@model,@cardonboard)
	end
go

create table chatlieu
(
	machatlieu varchar(25) primary key,
	chatlieumatbenngoaicung nvarchar(20) null,
	chatlieukhungmanhinh nvarchar(20) null,
	chatlieumatbanphim nvarchar(20) null,
	chatlieumatlung nvarchar(20) null	
)

create procedure check_chatlieu
	@machatlieu varchar(25),
	@chatlieumatbenngoaicung nvarchar(20),
	@chatlieukhungmanhinh nvarchar(20),
	@chatlieumatbanphim nvarchar(20),
	@chatlieumatlung nvarchar(20)
as
	if exists (select * from chatlieu
				where chatlieumatbenngoaicung = @chatlieumatbenngoaicung
				and chatlieukhungmanhinh = @chatlieukhungmanhinh
				and chatlieumatbanphim = @chatlieumatbanphim
				and chatlieumatlung = @chatlieumatlung)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into chatlieu(machatlieu,chatlieumatbenngoaicung,chatlieukhungmanhinh,chatlieumatbanphim,chatlieumatlung)
		values(@machatlieu,@chatlieumatbenngoaicung,@chatlieukhungmanhinh,@chatlieumatbanphim,@chatlieumatlung)
	end
go

create table banphim
(
	mabanphim varchar(25) primary key,
	kieubanphim nvarchar(25) null,
	banphimso nvarchar(15),
	loaidenbanphim nvarchar(15),
	maudenled nvarchar(15),
	congnghedenbanphim nvarchar(25),
	touchpad nvarchar(50)
)

create procedure check_banphim
	@mabanphim varchar(25),
	@kieubanphim nvarchar(25),
	@banphimso nvarchar(15),
	@loaidenbanphim nvarchar(15),
	@maudenled nvarchar(15),
	@congnghedenbanphim nvarchar(25),
	@touchpad nvarchar(50)
as
	if exists (select * from banphim
				where kieubanphim = @kieubanphim
				and banphimso = @banphimso
				and loaidenbanphim = @loaidenbanphim
				and maudenled = @maudenled
				and congnghedenbanphim = @congnghedenbanphim
				and touchpad = @touchpad)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin	
		insert into banphim(mabanphim,kieubanphim,banphimso,loaidenbanphim,maudenled,congnghedenbanphim,touchpad)
		values(@mabanphim,@kieubanphim,@banphimso,@loaidenbanphim,@maudenled,@congnghedenbanphim,@touchpad)
	end
go

create table bonho
(
	mabonho varchar(25) primary key,
	kieu nvarchar(25) null,
	dungluong nvarchar(15) null,
	tocdodocghi nvarchar(15) null,
	sokhecam nvarchar(20) null
)

create procedure check_bonho
	@mabonho varchar(25),
	@kieu nvarchar(25),
	@dungluong nvarchar(15),
	@tocdodocghi nvarchar(15),
	@sokhecam nvarchar(20)
as
	if exists (select * from bonho
				where kieu = @kieu
				and dungluong = @dungluong
				and tocdodocghi = @tocdodocghi
				and sokhecam = @sokhecam)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into bonho(mabonho,kieu,dungluong,tocdodocghi,sokhecam)
		values(@mabonho,@kieu,@dungluong,@tocdodocghi,@sokhecam)
	end
go

create table khachhang
(
	makh int identity(1,1) primary key,
	email varchar(35) unique,
	tenkhachhang nvarchar(30) not null,
	matkhau varchar(100) not null,
	diachi nvarchar(50) not null,
	sodienthoai varchar(10) unique not null,
	ngaysinh date not null,
	isaccountnonexpired bit,
	isaccountnonlocked bit,
	iscredentialsnonexpired bit,
	isenabled bit
)

create table vaitro
(
	id_vaitro int identity(1,1) primary key,
	tenvaitro varchar(15) not null
)

create table khachhang_vaitro
(
	id int identity(1,1) primary key,
	makh int,
	id_vaitro int not null
)

create table giohang
(
	idgio int identity(1,1) primary key,
	masanpham varchar(25) not null,
	tensanpham varchar(60) not null,
	makh int,
	gia int, 
	soluong int
)

create table hoadon
(
	mahoadon int identity(1,1) primary key,
	makh int,
	ngaydathang date not null,
	trangthai bit,
	hinhthucthanhtoan int
)

select * from hoadon where year(ngaydathang) = 2019

create table chitiethoadon
(
	machitiethoadon int identity(1,1) primary key,
	mahoadon int,
	masanpham varchar(25) not null,
	soluongmua int
)

!-- 1: thanh toan tien mat
!-- 2: thanh toan bang paypal

create table binhluan
(
	mabinhluan int identity(1,1),	
	makhachhang int,
	masanpham varchar(25) not null,
	ngaybinhluan date,
	noidung nvarchar(100) null,
	chophepan bit
)

!-- cần mã sản phẩm, số bình luận, số phản hồi, xem chi tiết

create table phanhoi
(
	maphanhoi int identity(1,1),
	mabinhluan int,
	makhachhang int,
	ngayphanhoi date,
	noidung nvarchar(100) null
)

create table hopthu
(
	idhopthu int identity(1,1) primary key,
	email varchar(35),
	chude nvarchar(30),
	noidunggui nvarchar(100),
	ngaygui datetime,
	trangthai bit --0: chua phan hoi,1: da phan hoi
)

-- vaitro
insert into vaitro(tenvaitro)
values('ROLE_USER')

insert into vaitro(tenvaitro)
values('ROLE_ADMIN')

insert into vaitro(tenvaitro)
values('ROLE_SELLER')

-- khach hang
insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh,isaccountnonexpired,isaccountnonlocked,iscredentialsnonexpired,isenabled)
values('maithaison1998@gmail.com',N'Mai Thái Sơn',
'$2a$10$WfGYK2oP3NKF.uUGPn3FKe.PJy5qfzWmQvogEt0WbAKYzTOc2pKGq',
N'196 Trần Duy Hưng, Thanh Xuân, Hà Nội',
'0398851616',
'1998-10-10',
1,
1,
1,
1)

insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh,isaccountnonexpired,isaccountnonlocked,iscredentialsnonexpired,isenabled)
values('trinhdinhnam1998@gmail.com',N'Trịnh Đình Nam','$2a$10$WfGYK2oP3NKF.uUGPn3FKe.PJy5qfzWmQvogEt0WbAKYzTOc2pKGq',N'70 Bui Ngoc Duong, Ha Noi','0398851617','1998-8-19',1,1,1,1)

insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh,isaccountnonexpired,isaccountnonlocked,iscredentialsnonexpired,isenabled)
values('hoangphihung1998@gmail.com',N'Hoàng Phi Hùng','$2a$10$WfGYK2oP3NKF.uUGPn3FKe.PJy5qfzWmQvogEt0WbAKYzTOc2pKGq',N'45 Lê Thanh Nghị, Hà Nội','0394851616','1998-1-15',1,1,1,1)

insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh,isaccountnonexpired,isaccountnonlocked,iscredentialsnonexpired,isenabled)
values('dotrungkien1998@gmail.com',N'Đỗ Trung Kiên','$2a$10$WfGYK2oP3NKF.uUGPn3FKe.PJy5qfzWmQvogEt0WbAKYzTOc2pKGq',N'45 Lê Thanh Nghị, Hà Nội','0384851616','1998-3-4',1,1,1,1)

insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh,isaccountnonexpired,isaccountnonlocked,iscredentialsnonexpired,isenabled)
values('luuvanhoang1998@gmail.com',N'Lưu Văn Hoàng','$2a$10$WfGYK2oP3NKF.uUGPn3FKe.PJy5qfzWmQvogEt0WbAKYzTOc2pKGq',N'45 Lê Thanh Nghị, Hà Nội','0384851626','1998-11-21',1,1,1,1)

insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh,isaccountnonexpired,isaccountnonlocked,iscredentialsnonexpired,isenabled)
values('hoangthanhphuong1998@gmail.com',N'Hoàng Thanh Phương','$2a$10$WfGYK2oP3NKF.uUGPn3FKe.PJy5qfzWmQvogEt0WbAKYzTOc2pKGq',N'45 Lê Thanh Nghị, Hà Nội','0374851626','1998-12-01',1,1,1,1)

insert into khachhang(email,tenkhachhang,matkhau,diachi,sodienthoai,ngaysinh,isaccountnonexpired,isaccountnonlocked,iscredentialsnonexpired,isenabled)
values('phamminhsang1998@gmail.com',N'Phạm Minh Sang','$2a$10$WfGYK2oP3NKF.uUGPn3FKe.PJy5qfzWmQvogEt0WbAKYzTOc2pKGq',N'455/60 Lạc Long Quân, Hồ Tây','0374851625','1998-4-6',1,1,1,1)

-- khach hang - vaitro
insert into khachhang_vaitro(makh,id_vaitro)
values(1,2)

insert into khachhang_vaitro(makh,id_vaitro)
values(2,1)

insert into khachhang_vaitro(makh,id_vaitro)
values(3,1)

insert into khachhang_vaitro(makh,id_vaitro)
values(4,1)

insert into khachhang_vaitro(makh,id_vaitro)
values(5,1)

insert into khachhang_vaitro(makh,id_vaitro)
values(6,1)

insert into khachhang_vaitro(makh,id_vaitro)
values(7,1)

-- bo vi xu ly
insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_01','Core i5','1035G1','Intel',1.00,3.60,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_02','Ryzen 5','3500U','AMD',2.1,3.7,4,0,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_03','Core i3','1005G1','Intel',1.2,3.4,4,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_04','Pentium','N5000','Intel',1.1,2.7,4,4,4,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_05','Ryzen 7','3750H','AMD',2.3,4.0,4,8,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_06','Ryzen 7','3750H','AMD',2.3,4.0,4,8,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_07','Core i5','9300H','Intel',2.4,4.1,8,8,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_08','Core i5','1035G1','Intel',1.0,3.6,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_09','Core i5','8265U','Intel',1.6,3.9,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_10','Core i7','8550U','Intel',1.8,4.0,8,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_11','Pentium','N5000','Intel',1.1,2.7,4,4,4,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_12','Ryzen 5','3500U','AMD',2.1,3.7,4,2.4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_13','Ryzen 3','3200U','AMD',2.6,3.5,4,2.4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_14','Ryzen 5','3500U','AMD',2.1,3.7,4,0,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_15','Ryzen 3','3200U','AMD',2.6,3.5,4,0,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_16','Core i3','8145U','Intel',2.1,3.9,4,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_17','Core i3','7020U','Intel',2.3,0,3,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_18','Core i3','8145U','Intel',2.1,3.9,4,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_19','Core i5','1035G1','Intel',1.0,3.6,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_20','Pentium','N5000','Intel',1.1,2.7,4,4,4,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_21','Core i3','7020U','Intel',2.3,0,3,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_22','Core i3','7020U','Intel',2.3,0,3,4,4,2)

-- dell
insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_23','Core i5','10210U','Intel',1.6,4.2,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_24','Core i7','9750U','Intel',2.6,4.5,12,8,12,6)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_25','Core i3','7020U','Intel',2.3,0,3,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_26','Core i5','1035G1','Intel',1.0,3.6,6,4,8,4)

--dell 08,11
insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_27','Core i5','8265U','Intel',1.6,3.9,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_28','Core i5','1035G1','Intel',1.0,3.6,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_29','Core i7','1065G7','Intel',1.3,3.9,8,2.666,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_30','Core i3','1005G1','Intel',1.2,3.4,4,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_31','Core i3','7020U','Intel',2.3,0,3,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_32','Core i3','10110U','Intel',2.1,4.1,4,4,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_33','Core i5','10210U','Intel',1.6,4.2,6,4,8,4)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_34','Ryzen 3','3200U','AMD',2.6,3.5,4,0,4,2)

insert into boxuly(macpu,congnghecpu,loaicpu,hangcpu,tocdo,tocdotoida,bonhodem,tocdobus,soluong,soloi)
values('cpu_35','Core i3','7020U','Intel',2.3,0,3,4,4,2)

exec check_boxuly @macpu = 'cpu_36',
				@congnghecpu = 'Core i7',
				@loaicpu = '10510U',
				@hangcpu = 'Intel',
				@tocdo = 1.8,
				@tocdotoida = 4.9,
				@bonhodem = 8,
				@tocdobus = 4,
				@soluong = 8,
				@soloi = 4

exec check_boxuly @macpu = 'cpu_37',
				@congnghecpu = 'Core i3',
				@loaicpu = '8145U',
				@hangcpu = 'Intel',
				@tocdo = 2.1,
				@tocdotoida = 3.9,
				@bonhodem = 4,
				@tocdobus = 0,
				@soluong = 4,
				@soloi = 2

exec check_boxuly @macpu = 'cpu_38',
				@congnghecpu = 'Ryzen 7',
				@loaicpu = '3700U',
				@hangcpu = 'AMD',
				@tocdo = 2.3,
				@tocdotoida = 4.0,
				@bonhodem = 4,
				@tocdobus = 4,
				@soluong = 8,
				@soloi = 4

exec check_boxuly @macpu = 'cpu_39',
				@congnghecpu = 'RyzenTM5',
				@loaicpu = '4500U',
				@hangcpu = 'AMD',
				@tocdo = 2.3,
				@tocdotoida = 4.0,
				@bonhodem = 8,
				@tocdobus = 0,
				@soluong = 6,
				@soloi = 6

exec check_boxuly @macpu = 'cpu_40',
				@congnghecpu = 'Core i7',
				@loaicpu = '9750HF',
				@hangcpu = 'Intel',
				@tocdo = 2.6,
				@tocdotoida = 4.5,
				@bonhodem = 12,
				@tocdobus = 8,
				@soluong = 12,
				@soloi = 6

exec check_boxuly @macpu = 'cpu_41',
				@congnghecpu = 'Core i3',
				@loaicpu = '8130U',
				@hangcpu = 'Intel',
				@tocdo = 2.2,
				@tocdotoida = 3.4,
				@bonhodem = 4,
				@tocdobus = 0,
				@soluong = 4,
				@soloi = 2

exec check_boxuly @macpu = 'cpu_42',
				@congnghecpu = 'Ryzen 5',
				@loaicpu = '4600H',
				@hangcpu = 'AMD',
				@tocdo = 3.0,
				@tocdotoida = 4.0,
				@bonhodem = 8,
				@tocdobus = 8,
				@soluong = 12,
				@soloi = 6

exec check_boxuly @macpu = 'cpu_43',
				@congnghecpu = 'Ryzen 7',
				@loaicpu = '4800H',
				@hangcpu = 'AMD',
				@tocdo = 2.9,
				@tocdotoida = 4.2,
				@bonhodem = 8,
				@tocdobus = 8,
				@soluong = 16,
				@soloi = 8

-- ram
exec check_ram @maram = 'ram_01',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 12

exec check_ram @maram = 'ram_02',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 12

exec check_ram @maram = 'ram_03',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 1,
				@soramtoida = 8

exec check_ram @maram = 'ram_04',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 8

exec check_ram @maram = 'ram_05',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_06',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 2,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_07',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_08',
				@dungluong = 8,
				@loairam = 'LPDDR4',
				@tocdoram = 2666,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 8

exec check_ram @maram = 'ram_09',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_10',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2133,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 0

exec check_ram @maram = 'ram_11',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 12

exec check_ram @maram = 'ram_12',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 1,
				@soramonboard = 1,
				@soramtoida = 12

exec check_ram @maram = 'ram_13',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_14',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 20

exec check_ram @maram = 'ram_15',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 1,
				@soramonboard = 1,
				@soramtoida = 8

exec check_ram @maram = 'ram_16',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 8

exec check_ram @maram = 'ram_17',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 12

exec check_ram @maram = 'ram_18',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 12

exec check_ram @maram = 'ram_19',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 20

exec check_ram @maram = 'ram_20',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_21',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_22',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_23',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_24',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_25',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 1,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_26',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_27',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2133,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 8

exec check_ram @maram = 'ram_28',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 8

exec check_ram @maram = 'ram_29',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 8

exec check_ram @maram = 'ram_30',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 1,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_31',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 1,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 32

exec check_ram @maram = 'ram_32',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 32

exec check_ram @maram = 'ram_33',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 3200,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 8

exec check_ram @maram = 'ram_34',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_35',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 12

exec check_ram @maram = 'ram_36',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 12

exec check_ram @maram = 'ram_37',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2133,
				@sokhecamroi = 1,
				@sokheramconlai = 0,
				@soramonboard = 1,
				@soramtoida = 12

exec check_ram @maram = 'ram_38',
				@dungluong = 4,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 12

exec check_ram @maram = 'ram_39',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2400,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 8
				
exec check_ram @maram = 'ram_40',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 3200,
				@sokhecamroi = 2,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_41',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 3200,
				@sokhecamroi = 2,
				@sokheramconlai = 1,
				@soramonboard = 0,
				@soramtoida = 16

exec check_ram @maram = 'ram_42',
				@dungluong = 8,
				@loairam = 'DDR4',
				@tocdoram = 2666,
				@sokhecamroi = 0,
				@sokheramconlai = 0,
				@soramonboard = 0,
				@soramtoida = 16

-- man hinh
exec check_manhinh @mamanhinh = 'manhinh_01',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_02',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = '45% NTSC',
				@congnghe = 'Acer CómfyView LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_03',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_04',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1280x720',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_05',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_09',
				@loaicamung = N'Đang cập nhật',
				@manhinhcamung = N'Có',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_10',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_11',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_12',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = '200 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_13',
				@loaicamung = N'Đang cập nhật',
				@manhinhcamung = N'Có',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = '250 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_14',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1366x768',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_15',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = '200 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_16',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1366x768',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_17',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1366x768',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_18',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_19',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_20',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1366x768',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_21',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = '600:1',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_22',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_23',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_24',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'Anti - Glare',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_25',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1366x768',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_26',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = '300 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_27',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_28',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1366x768',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_29',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'BrightView WLED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1366x768',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_30',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'Anti-glare Micro-edge WLED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1366x768',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_31',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'Micro-edge WLED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1366x768',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_32',
				@loaicamung = 'da diem',
				@manhinhcamung = N'Có',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = '300 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '13.3'

exec check_manhinh @mamanhinh = 'manhinh_33',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'Anti-glare Micro-edge WLED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_34',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = N'Đang cập nhật',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'Anti-glare LED-backlit',
				@dosang = N'Đang cập nhật',
				@dophangiai = '1920x1080',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_35',
				@loaicamung = N'Đang cập nhật',
				@manhinhcamung = N'Có',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_36',
				@loaicamung = N'Không',
				@manhinhcamung = N'Có',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'FHD Touch',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_37',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = '250 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_38',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 60,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_39',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = '250 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_40',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = N'Đang cập nhật',
				@congnghe = 'LED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

exec check_manhinh @mamanhinh = 'manhinh_41',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '72% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = '300 nits',
				@dophangiai = '2560x1600',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '13.3'

exec check_manhinh @mamanhinh = 'manhinh_42',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = '220 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 0,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '14.0'

exec check_manhinh @mamanhinh = 'manhinh_43',
				@loaicamung = N'Không',
				@manhinhcamung = N'Không',
				@dotuongphan = N'Đang cập nhật',
				@tylemanhinh = '16:09',
				@dophumau = '45% NTSC',
				@congnghe = 'LED-backlit',
				@dosang = '250 nits',
				@dophangiai = '1920x1080',
				@tansoquet = 120,
				@loaimanhinh = 'LED',
				@kichthuocmanhinh = '15.6'

-- may tinh
exec check_maytinh @mamaytinh = 'mt_01',
	@tensanpham = 'Acer Aspire 3 A315 56 59XY i5 1035G14GB256GB15.6FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.7,
	@soluong = 15,
	@gia = 570,
	@hinhanh = N'/Máy tính/ACER/Acer Aspire 3 A315 56 59XY i5 1035G14GB256GB15.6FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_02',
	@tensanpham = 'Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 363.4,
	@chieucao = 19.9,
	@chieusau = 250.2,
	@namramat = '2018',
	@trongluong = 1.7,
	@soluong = 12,
	@gia = 560,
	@hinhanh = N'/Máy tính/ACER/Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_03',
	@tensanpham = 'Acer Aspire 5 A514 53 3821 i3 1005G14GB256GB14FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.5,
	@soluong = 12,
	@gia = 524,
	@hinhanh = N'/Máy tính/ACER/Acer Aspire 5 A514 53 3821 i3 1005G14GB256GB14FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_04',
	@tensanpham = 'Acer Aspire A315-34-P3LCPentium N5000NX.HE3SV.004',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.7,
	@soluong = 12,
	@gia = 350,
	@hinhanh = N'/Máy tính/ACER/Acer Aspire A315-34-P3LCPentium N5000NX.HE3SV.004/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_05',
	@tensanpham = 'Acer Aspire Gaming 7 A715-41G-R1AZ R7 3750H8GB512GB SSD15.6FHDGTX1650-4GBW10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 363.4,
	@chieucao = 254.5,
	@chieusau = 23.25,
	@namramat = '2020',
	@trongluong = 2.1,
	@soluong = 12,
	@gia = 650,
	@hinhanh = N'/Máy tính/ACER/Acer Aspire Gaming 7 A715-41G-R1AZ R7 3750H8GB512GB SSD15.6FHDGTX1650-4GBW10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_06',
	@tensanpham = 'Acer Nitro 5 AN515 43 R65L R7 3750H8GB256GB15.6FHDRX560X 4GBWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 363.96,
	@chieucao = 225.5,
	@chieusau = 25.8,
	@namramat = '2019',
	@trongluong = 2.2,
	@soluong = 12,
	@gia = 857,
	@hinhanh = N'/Máy tính/ACER/Acer Nitro 5 AN515 43 R65L R7 3750H8GB256GB15.6FHDRX560X 4GBWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_07',
	@tensanpham = 'Acer Nitro AN515 54 595D i5-9300H8Gb512GbGTX 1650 4Gb15.6FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 2.3,
	@soluong = 27,
	@gia = 954,
	@hinhanh = N'/Máy tính/ACER/Acer Nitro AN515 54 595D i5-9300H8Gb512GbGTX 1650 4Gb15.6FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_08',
	@tensanpham = 'Acer Swift 3S SF314 57 52GB i5 1035G18Gb512Gb14FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.19,
	@soluong = 27,
	@gia = 756,
	@hinhanh = N'/Máy tính/ACER/Acer Swift 3S SF314 57 52GB i5 1035G18Gb512Gb14FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_09',
	@tensanpham = 'Acer Swift 5 SF514-53T-58PNCore i5-8265UNX.H7HSV.001',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 0.97,
	@soluong = 21,
	@gia = 812,
	@hinhanh = N'/Máy tính/ACER/Acer Swift 5 SF514-53T-58PNCore i5-8265UNX.H7HSV.001/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_10',
	@tensanpham = 'Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 0.97,
	@soluong = 21,
	@gia = 990,
	@hinhanh = N'/Máy tính/ACER/Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_11',
	@tensanpham = 'Acer Swift SF114-32-P2SG N50004Gb64Gb EMMC14FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.3,
	@soluong = 21,
	@gia = 353,
	@hinhanh = N'/Máy tính/ACER/Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_12',
	@tensanpham = 'Asus Vivobook A412DA-EK160TR5-3500U8GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.5,
	@soluong = 23,
	@gia = 571,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook A412DA-EK160TR5-3500U8GB512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_13',
	@tensanpham = 'Asus Vivobook A412DA-EK347T R3 3200U4GB512GBWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.5,
	@soluong = 23,
	@gia = 495,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook A412DA-EK347T R3 3200U4GB512GBWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_14',
	@tensanpham = 'Asus Vivobook D409DA-EK109T R5-3500U4GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 360,
	@chieucao = 216,
	@chieusau = 23.1,
	@namramat = '2020',
	@trongluong = 1.9,
	@soluong = 23,
	@gia = 523,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook D409DA-EK109T R5-3500U4GB512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_15',
	@tensanpham = 'Asus Vivobook D409DA-EK110T R3 3200U4GB256GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 325,
	@chieucao = 216,
	@chieusau = 23.1,
	@namramat = '2020',
	@trongluong = 1.9,
	@soluong = 30,
	@gia = 356,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook D409DA-EK110T R3 3200U4GB256GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_16',
	@tensanpham = 'Asus Vivobook TP412FA-EC268T I3 8145U4GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 327,
	@chieucao = 225,
	@chieusau = 17.5,
	@namramat = '2020',
	@trongluong = 1.5,
	@soluong = 30,
	@gia = 500,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook TP412FA-EC268T I3 8145U4GB512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_17',
	@tensanpham = 'Asus Vivobook X407UA-BV537TCore i3-7020U4GB1TBWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.5,
	@soluong = 30,
	@gia = 348,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook X407UA-BV537TCore i3-7020U4GB1TBWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_18',
	@tensanpham = 'Asus Vivobook X409FA-EK470T i3-8145U4G512GB SSD14FHDWin10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.6,
	@soluong = 37,
	@gia = 487,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook X409FA-EK470T i3-8145U4G512GB SSD14FHDWin10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_19',
	@tensanpham = 'Asus Vivobook X509JA-EJ171T i5 1035G14GB512GB SSD15.6FHDWin10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 360,
	@chieucao = 235,
	@chieusau = 22.9,
	@namramat = '2020',
	@trongluong = 1.9,
	@soluong = 37,
	@gia = 600,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook X509JA-EJ171T i5 1035G14GB512GB SSD15.6FHDWin10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_20',
	@tensanpham = 'Asus Vivobook X509MA-BR063T N50004G256GB SSDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.7,
	@soluong = 37,
	@gia = 299,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook X509MA-BR063T N50004G256GB SSDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_21',
	@tensanpham = 'Asus Vivobook X509UA-BR011TCore i3-7020U4GB1TBWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 360,
	@chieucao = 234,
	@chieusau = 23.4,
	@namramat = '2019',
	@trongluong = 1.9,
	@soluong = 14,
	@gia = 331,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook X509UA-BR011TCore i3-7020U4GB1TBWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_22',
	@tensanpham = 'Asus Vivobook X509UA-BR236TCore i3-7020U4G512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.9,
	@soluong = 14,
	@gia = 331,
	@hinhanh = N'/Máy tính/ASUS/Asus Vivobook X509UA-BR236TCore i3-7020U4G512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_23',
	@tensanpham = 'Dell Inspiron 14 N5490 i5 10210U8Gb512Gb14.0FHD2Gb_MX230Win 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.442,
	@soluong = 18,
	@gia = 934,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron 14 N5490 i5 10210U8Gb512Gb14.0FHD2Gb_MX230Win 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_24',
	@tensanpham = 'Dell Inspiron G7 N7591Core i7-9750HKJ2G41',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.8,
	@soluong = 18,
	@gia = 1098,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron G7 N7591Core i7-9750HKJ2G41/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_25',
	@tensanpham = 'Dell Inspiron N3481Core i3-7020U4Gb1Tb14HD3cellWin 10030CX2',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.711,
	@soluong = 21,
	@gia = 489,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron N3481Core i3-7020U4Gb1Tb14HD3cellWin 10030CX2/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_26',
	@tensanpham = 'Dell Inspiron N3493 i5 1035G18Gb256Gb14FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 339,
	@chieucao = 241.9,
	@chieusau = 19.9,
	@namramat = '2020',
	@trongluong = 1.79,
	@soluong = 20,
	@gia = 597,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron N3493 i5 1035G18Gb256Gb14FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_27',
	@tensanpham = 'Dell Inspiron N3580Core i5-8265U70184569',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 2.28,
	@soluong = 26,
	@gia = 711,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron N3580Core i5-8265U70184569/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_28',
	@tensanpham = 'Dell Inspiron N3593 i5 1035G14Gb256GbNvidia MX230 2Gb15.6FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 2,
	@soluong = 26,
	@gia = 674,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron N3593 i5 1035G14Gb256GbNvidia MX230 2Gb15.6FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_29',
	@tensanpham = 'Dell Inspiron N3593 i7 1065G78GB512GB15.6FHDNVIDIA MX230 2GBWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 380,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 2.2,
	@soluong = 43,
	@gia = 884,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron N3593 i7 1065G78GB512GB15.6FHDNVIDIA MX230 2GBWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_30',
	@tensanpham = 'Dell Inspiron N5584Core i5-8265U4GBN5I5384W',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.95,
	@soluong = 3,
	@gia = 793,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron N5584Core i5-8265U4GBN5I5384W/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_31',
	@tensanpham = 'Dell Inspiron N5593 i3 1005G14Gb128Gb15.6FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 2.05,
	@soluong = 9,
	@gia = 526,
	@hinhanh = N'/Máy tính/DELL/Dell Inspiron N5593 i3 1005G14Gb128Gb15.6FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_32',
	@tensanpham = 'Dell Vostro V3481Core i3-7020U4Gb1Tb14.0HDWin 10Đen70187645',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.79,
	@soluong = 19,
	@gia = 501,
	@hinhanh = N'/Máy tính/DELL/Dell Vostro V3481Core i3-7020U4Gb1Tb14.0HDWin 10Đen70187645/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_33',
	@tensanpham = 'Dell Vostro V3580ICore i5-8265UP75F010V80I',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 380,
	@chieucao = 258,
	@chieusau = 22.6,
	@namramat = '2019',
	@trongluong = 2.28,
	@soluong = 14,
	@gia = 775,
	@hinhanh = N'/Máy tính/DELL/Dell Vostro V3580ICore i5-8265UP75F010V80I/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_34',
	@tensanpham = 'Dell Vostro V3590 i3-10110U4GB256GB15.6FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 380,
	@chieucao = 258,
	@chieusau = 20,
	@namramat = '2020',
	@trongluong = 1.99,
	@soluong = 18,
	@gia = 500,
	@hinhanh = N'/Máy tính/DELL/Dell Vostro V3590 i3-10110U4GB256GB15.6FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_35',
	@tensanpham = 'Dell Vostro V5590 i5 10210U8Gb256Gb15.6FHDWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.66,
	@soluong = 5,
	@gia = 873,
	@hinhanh = N'/Máy tính/DELL/Dell Vostro V5590 i5 10210U8Gb256Gb15.6FHDWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_36',
	@tensanpham = 'HP 14s-dk0117AU R3 3200U4GB256GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 324,
	@chieucao = 225,
	@chieusau = 19.9,
	@namramat = '2020',
	@trongluong = 1.47,
	@soluong = 15,
	@gia = 350,
	@hinhanh = N'/Máy tính/HP/HP 14s-dk0117AU R3 3200U4GB256GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_37',
	@tensanpham = 'HP 15-da0037TXi3 7020U',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 376,
	@chieucao = 246,
	@chieusau = 22.5,
	@namramat = '2020',
	@trongluong = 1.77,
	@soluong = 16,
	@gia = 345,
	@hinhanh = N'/Máy tính/HP/HP 15-da0037TXi3 7020U/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_38',
	@tensanpham = 'HP 15s-du1040TX i7-10510U8GB512GB SSD2GB MX130WIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 358.5,
	@chieucao = 242,
	@chieusau = 19.9,
	@namramat = '2020',
	@trongluong = 1.78,
	@soluong = 26,
	@gia = 874,
	@hinhanh = N'/Máy tính/HP/HP 15s-du1040TX i7-10510U8GB512GB SSD2GB MX130WIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_39',
	@tensanpham = 'HP 15s-du2049TX i3 1005G14GB256GB SSDMX130 2GBWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 358.5,
	@chieucao = 242,
	@chieusau = 19.9,
	@namramat = '2020',
	@trongluong = 1.75,
	@soluong = 36,
	@gia = 512,
	@hinhanh = N'/Máy tính/HP/HP 15s-du2049TX i3 1005G14GB256GB SSDMX130 2GBWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_40',
	@tensanpham = 'HP ENVY X360-AR0071AUR5-3500U8GB256G SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 306,
	@chieucao = 212,
	@chieusau = 147,
	@namramat = '2019',
	@trongluong = 1.31,
	@soluong = 31,
	@gia = 1035,
	@hinhanh = N'/Máy tính/HP/HP ENVY X360-AR0071AUR5-3500U8GB256G SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_41',
	@tensanpham = 'HP Pavilion 14-ce2041TUCore i5-8265U4GB1TBWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 326.8,
	@chieucao = 225.5,
	@chieusau = 17.9,
	@namramat = '2019',
	@trongluong = 1.59,
	@soluong = 42,
	@gia = 599,
	@hinhanh = N'/Máy tính/HP/HP Pavilion 14-ce2041TUCore i5-8265U4GB1TBWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_42',
	@tensanpham = 'HP Pavilion 15-cs2056TXi5-8265U4GB1TBMX130 2GBWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 361.6,
	@chieucao = 245.6,
	@chieusau = 17.9,
	@namramat = '2019',
	@trongluong = 1.825,
	@soluong = 42,
	@gia = 612,
	@hinhanh = N'/Máy tính/HP/HP Pavilion 15-cs2056TXi5-8265U4GB1TBMX130 2GBWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_43',
	@tensanpham = 'HP Pavilion 15-cs3060TXi5-1035G18GB512GSSD2GB MX250WIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 361.6,
	@chieucao = 245.6,
	@chieusau = 17.9,
	@namramat = '2019',
	@trongluong = 1.761,
	@soluong = 22,
	@gia = 801,
	@hinhanh = N'/Máy tính/HP/HP Pavilion 15-cs3060TXi5-1035G18GB512GSSD2GB MX250WIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_44',
	@tensanpham = 'Lenovo Ideadpad S340-15IWLCore I3 8145U4GB256G SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 358,
	@chieucao = 245,
	@chieusau = 17.9,
	@namramat = '2019',
	@trongluong = 1.8,
	@soluong = 24,
	@gia = 465,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Ideadpad S340-15IWLCore I3 8145U4GB256G SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_45',
	@tensanpham = 'Lenovo Ideapad C340-14API R7 3700U8GB512GB SSD14.0FHD TouchWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.604,
	@soluong = 27,
	@gia = 780,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Ideapad C340-14API R7 3700U8GB512GB SSD14.0FHD TouchWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_46',
	@tensanpham = 'Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 320.2,
	@chieucao = 210.5,
	@chieusau = 17.9,
	@namramat = '2020',
	@trongluong = 1.556,
	@soluong = 27,
	@gia = 589,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_47',
	@tensanpham = 'Lenovo Ideapad L340-15IRH i7 9750HF8GB512GB SSD3GB GTX1050WIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 2.19,
	@soluong = 22,
	@gia = 874,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Ideapad L340-15IRH i7 9750HF8GB512GB SSD3GB GTX1050WIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_48',
	@tensanpham = 'Lenovo Ideapad S145-15API R5 3500U4GB256GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.85,
	@soluong = 25,
	@gia = 350,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Ideapad S145-15API R5 3500U4GB256GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_49',
	@tensanpham = 'Lenovo IdeaPad S145-15IIL i5 1035G18GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.85,
	@soluong = 25,
	@gia = 545,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo IdeaPad S145-15IIL i5 1035G18GB512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_50',
	@tensanpham = 'Lenovo Ideapad S145-15IKB i3 8130U4GB256GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 327.1,
	@chieucao = 241,
	@chieusau = 19.93,
	@namramat = '2020',
	@trongluong = 1.85,
	@soluong = 35,
	@gia = 390,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Ideapad S145-15IKB i3 8130U4GB256GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_51',
	@tensanpham = 'Lenovo Ideapad S340-15IWLi5-8265U4G256GBMX230 2GBWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.8,
	@soluong = 32,
	@gia = 525,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Ideapad S340-15IWLi5-8265U4G256GBMX230 2GBWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_52',
	@tensanpham = 'Lenovo Ideapad S340R5-3500U4GB256GSSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2019',
	@trongluong = 1.8,
	@soluong = 2,
	@gia = 515,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Ideapad S340R5-3500U4GB256GSSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_53',
	@tensanpham = 'Lenovo IdeaPad S540-13API R5 3550H8GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.25,
	@soluong = 11,
	@gia = 743,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo IdeaPad S540-13API R5 3550H8GB512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_54',
	@tensanpham = 'Lenovo ideapad Slim 3-14IIL05 i3-1005G18GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.6,
	@soluong = 12,
	@gia = 529,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo ideapad Slim 3-14IIL05 i3-1005G18GB512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_55',
	@tensanpham = 'Lenovo Legion 5-15ARH05 R5 4600H8GB512GB4GB GTX1650WIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 2.3,
	@soluong = 12,
	@gia = 901,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R5 4600H8GB512GB4GB GTX1650WIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_56',
	@tensanpham = 'Lenovo Legion 5-15ARH05 R7 4800H8GB512GB SSD4GB GTX1650WIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 24,
	@chieurong = 363,
	@chieucao = 260,
	@chieusau = 25.4,
	@namramat = '2020',
	@trongluong = 2.3,
	@soluong = 15,
	@gia = 1019,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R7 4800H8GB512GB SSD4GB GTX1650WIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_57',
	@tensanpham = 'Lenovo ThinkBook 14 i5 10210U8GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.5,
	@soluong = 15,
	@gia = 600,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo ThinkBook 14 i5 10210U8GB512GB SSDWIN10/anh1.PNG'

exec check_maytinh @mamaytinh = 'mt_58',
	@tensanpham = 'Lenovo ThinkPad E14 i5 10210U8GB512GB SSDWIN10',
	@xuatxu = 'china',
	@thoigianbaohanh = 12,
	@chieurong = 0,
	@chieucao = 0,
	@chieusau = 0,
	@namramat = '2020',
	@trongluong = 1.77,
	@soluong = 19,
	@gia = 790,
	@hinhanh = N'/Máy tính/LENOVO/Lenovo ThinkPad E14 i5 10210U8GB512GB SSDWIN10/anh1.PNG'

--loa
exec check_loa @maloa = 'loa_01',
	@soloa = 2,
	@congngheamthanh = 'Acer TrueHarmony'

exec check_loa @maloa = 'loa_02',
	@soloa = 2,
	@congngheamthanh = 'Dang cap nhat'

exec check_loa @maloa = 'loa_03',
	@soloa = 1,
	@congngheamthanh = 'ASUS SonicMaster stereo'

exec check_loa @maloa = 'loa_04',
	@soloa = 2,
	@congngheamthanh = 'Realtek High Definition Audio'

exec check_loa @maloa = 'loa_05',
	@soloa = 2,
	@congngheamthanh = 'Realtek ALC3246'

exec check_loa @maloa = 'loa_06',
	@soloa = 2,
	@congngheamthanh = 'Realtek ALC3204'

exec check_loa @maloa = 'loa_07',
	@soloa = 2,
	@congngheamthanh = 'HP audio boost'

exec check_loa @maloa = 'loa_08',
	@soloa = 2,
	@congngheamthanh = 'Audio by B&O'

exec check_loa @maloa = 'loa_09',
	@soloa = 2,
	@congngheamthanh = 'Dolby Audio'

exec check_loa @maloa = 'loa_10',
	@soloa = 2,
	@congngheamthanh = 'Harman Kardon speakers'

-- pin
exec check_pin @mapin = 'pin_01',
	@loaipin = 'Lithium-ion',
	@cell = '2',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_02',
	@loaipin = 'Lithium-ion, liền',
	@cell = '2',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_03',
	@loaipin = 'Lithium-ion',
	@cell = '3',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_04',
	@loaipin = 'Lithium-ion',
	@cell = '4',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_05',
	@loaipin = 'Lithium-Polymer',
	@cell = '4',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_10',
	@loaipin = 'Lithium-Polymer',
	@cell = '3',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_07',
	@loaipin = 'Lithium-Polymer',
	@cell = '2',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_08',
	@loaipin = 'Lithium-Polymer',
	@cell = '',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_09',
	@loaipin = 'Lithium-ion',
	@cell = '3',
	@thaoroi = 1,
	@powersupply = ''

exec check_pin @mapin = 'pin_10',
	@loaipin = 'Lithium-ion, liền',
	@cell = '3',
	@thaoroi = 0,
	@powersupply = ''

exec check_pin @mapin = 'pin_11',
	@loaipin = 'Lithium-ion',
	@cell = '3',
	@thaoroi = 0,
	@powersupply = '65'

exec check_pin @mapin = 'pin_12',
	@loaipin = 'Lithium-Polymer',
	@cell = '3',
	@thaoroi = 0,
	@powersupply = '65'

exec check_pin @mapin = 'pin_13',
	@loaipin = 'Lithium-Polymer',
	@cell = '4',
	@thaoroi = 0,
	@powersupply = '65'

exec check_pin @mapin = 'pin_14',
	@loaipin = 'Lithium-ion, liền',
	@cell = '3',
	@thaoroi = 0,
	@powersupply = '65'

exec check_pin @mapin = 'pin_15',
	@loaipin = 'Lithium-ion',
	@cell = '',
	@thaoroi = 0,
	@powersupply = ''

-- he dieu hanh
exec check_hedieuhanh
	@phienbanhedieuhanh = 'Home',
	@ten = 'Windows 10',
	@kieu = '64'

exec check_hedieuhanh
	@phienbanhedieuhanh = 'Home Single Language',
	@ten = 'Windows 10 Home',
	@kieu = '64'

-- do hoa
exec check_dohoa
	@madohoa = 'dohoa_01',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 1050,
	@model = 'UHD',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_02',
	@hang = 'AMD',
	@xungnhip = 0,
	@xungnhiptoida = 0,
	@model = 'Vega 8',
	@cardonboard = 'Radeon Graphics'

exec check_dohoa
	@madohoa = 'dohoa_03',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 900,
	@model = 'UHD',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_04',
	@hang = 'Intel',
	@xungnhip = 200,
	@xungnhiptoida = 750,
	@model = '605',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_05',
	@hang = 'AMD',
	@xungnhip = 0,
	@xungnhiptoida = 0,
	@model = 'Vega 10',
	@cardonboard = 'Radeon RX Graphics'

exec check_dohoa
	@madohoa = 'dohoa_07',
	@hang = 'Intel',
	@xungnhip = 0,
	@xungnhiptoida = 0,
	@model = '630',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_08',
	@hang = 'UHD',
	@xungnhip = 300,
	@xungnhiptoida = 1050,
	@model = 'UHD',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_09',
	@hang = 'UHD',
	@xungnhip = 300,
	@xungnhiptoida = 1100,
	@model = 'UHD',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_10',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 1100,
	@model = '620',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_11',
	@hang = 'AMD',
	@xungnhip = 300,
	@xungnhiptoida = 1100,
	@model = 'Vega 8',
	@cardonboard = 'Radeon Graphics'

exec check_dohoa
	@madohoa = 'dohoa_12',
	@hang = 'AMD',
	@xungnhip = 192,
	@xungnhiptoida = 1200,
	@model = 'Vega 3',
	@cardonboard = 'Radeon Graphics'

exec check_dohoa
	@madohoa = 'dohoa_13',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 1000,
	@model = '620',
	@cardonboard = 'HD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_14',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 1050,
	@model = '620',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_15',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 1100,
	@model = 'UHD',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_16',
	@hang = 'Intel',
	@xungnhip = 350,
	@xungnhiptoida = 1150,
	@model = '630',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_17',
	@hang = 'Intel',
	@xungnhip = 0,
	@xungnhiptoida = 0,
	@model = 'Iris Plus',
	@cardonboard = ''

exec check_dohoa
	@madohoa = 'dohoa_18',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 1150,
	@model = 'UHD',
	@cardonboard = 'UHD Graphics'

exec check_dohoa
	@madohoa = 'dohoa_19',
	@hang = 'AMD',
	@xungnhip = 300,
	@xungnhiptoida = 1300,
	@model = 'Vega 10',
	@cardonboard = 'Radeon RX Graphics'

exec check_dohoa
	@madohoa = 'dohoa_20',
	@hang = 'AMD',
	@xungnhip = 0,
	@xungnhiptoida = 1500,
	@model = 'Vega 6',
	@cardonboard = 'Radeon Graphics'

exec check_dohoa
	@madohoa = 'dohoa_21',
	@hang = 'Intel',
	@xungnhip = 350,
	@xungnhiptoida = 0,
	@model = '',
	@cardonboard = ''

exec check_dohoa
	@madohoa = 'dohoa_22',
	@hang = 'Intel',
	@xungnhip = 300,
	@xungnhiptoida = 1500,
	@model = 'Radeon',
	@cardonboard = 'Radeon Graphics'

exec check_dohoa
	@madohoa = 'dohoa_23',
	@hang = 'AMD',
	@xungnhip = 300,
	@xungnhiptoida = 1600,
	@model = 'Radeon',
	@cardonboard = 'Radeon Graphics'

-- chat lieu
exec check_chatlieu
	@machatlieu = 'chatlieu_01',
	@chatlieumatbenngoaicung = N'Nhựa',
	@chatlieukhungmanhinh = N'Nhựa',
	@chatlieumatbanphim = N'Nhựa',
	@chatlieumatlung = N'Nhựa'

exec check_chatlieu
	@machatlieu = 'chatlieu_02',
	@chatlieumatbenngoaicung = N'Nhôm',
	@chatlieukhungmanhinh = N'Nhựa',
	@chatlieumatbanphim = N'Nhựa',
	@chatlieumatlung = N'Nhựa'

exec check_chatlieu
	@machatlieu = 'chatlieu_03',
	@chatlieumatbenngoaicung = N'Hợp kim Magie và nhôm',
	@chatlieukhungmanhinh = N'Nhựa',
	@chatlieumatbanphim = N'Hợp kim Magie và nhôm',
	@chatlieumatlung = N'Nhựa'

exec check_chatlieu
	@machatlieu = 'chatlieu_04',
	@chatlieumatbenngoaicung = N'Hợp kim Magie và nhôm',
	@chatlieukhungmanhinh = N'Nhựa',
	@chatlieumatbanphim = N'Hợp kim Magie và nhôm',
	@chatlieumatlung = N'Nhựa'

exec check_chatlieu
	@machatlieu = 'chatlieu_05',
	@chatlieumatbenngoaicung = N'Nhôm',
	@chatlieukhungmanhinh = N'Nhôm',
	@chatlieumatbanphim = N'Nhôm',
	@chatlieumatlung = N'Nhôm'

exec check_chatlieu
	@machatlieu = 'chatlieu_06',
	@chatlieumatbenngoaicung = N'Kim loại',
	@chatlieukhungmanhinh = N'Nhựa',
	@chatlieumatbanphim = N'Kim loại',
	@chatlieumatlung = N'Nhựa'

exec check_chatlieu
	@machatlieu = 'chatlieu_07',
	@chatlieumatbenngoaicung = N'Nhựa',
	@chatlieukhungmanhinh = N'Nhựa',
	@chatlieumatbanphim = N'ABS plastic',
	@chatlieumatlung = N'ABS plastic'

exec check_chatlieu
	@machatlieu = 'chatlieu_08',
	@chatlieumatbenngoaicung = N'ABS plastic',
	@chatlieukhungmanhinh = N'ABS plastic',
	@chatlieumatbanphim = N'ABS plastic',
	@chatlieumatlung = N'ABS plastic'

exec check_chatlieu
	@machatlieu = 'chatlieu_09',
	@chatlieumatbenngoaicung = N'Nhôm',
	@chatlieukhungmanhinh = N'ABS plastic',
	@chatlieumatbanphim = N'ABS plastic',
	@chatlieumatlung = N'ABS plastic'

exec check_chatlieu
	@machatlieu = 'chatlieu_10',
	@chatlieumatbenngoaicung = N'Nhôm',
	@chatlieukhungmanhinh = N'Kính',
	@chatlieumatbanphim = N'Nhôm',
	@chatlieumatlung = N'Nhôm'

-- ban phim
exec check_banphim
	@mabanphim = 'banphim_01',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Có',
	@loaidenbanphim = N'Không',
	@maudenled = N'Không',
	@congnghedenbanphim = N'Không',
	@touchpad = N'Đang cập nhật' 

exec check_banphim
	@mabanphim = 'banphim_02',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Không',
	@loaidenbanphim = 'LED',
	@maudenled = 'White',
	@congnghedenbanphim = N'Đơn sắc',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_03',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Có',
	@loaidenbanphim = N'Không',
	@maudenled = N'Không',
	@congnghedenbanphim = N'Không',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_04',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Có',
	@loaidenbanphim = 'LED',
	@maudenled = 'Red',
	@congnghedenbanphim = N'Đơn sắc',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_05',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Có',
	@loaidenbanphim = 'LED',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_06',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Không',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_07',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Có',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_08',
	@kieubanphim = 'Chiclet Keyboard',
	@banphimso = N'Không',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Không',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_09',
	@kieubanphim = 'Chiclet Keyboard',
	@banphimso = N'Không',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_10',
	@kieubanphim = 'Chiclet Keyboard',
	@banphimso = N'Không',
	@loaidenbanphim = N'Không',
	@maudenled = N'Không',
	@congnghedenbanphim = N'Không',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_11',
	@kieubanphim = 'Chiclet Keyboard',
	@banphimso = N'Có',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_12',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Có',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = N'bật/tắt, hỗ trợ đa cảm ứng'

exec check_banphim
	@mabanphim = 'banphim_13',
	@kieubanphim = N'Đang cập nhật',
	@banphimso = N'Có',
	@loaidenbanphim = N'Không',
	@maudenled = N'Không',
	@congnghedenbanphim = N'Không',
	@touchpad = 'Multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_14',
	@kieubanphim = 'English International Non-backlit Keyboard',
	@banphimso = N'Có',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = 'Multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_15',
	@kieubanphim = 'English International Non-backlit Keyboard',
	@banphimso = N'Có',
	@loaidenbanphim = N'Không',
	@maudenled = N'Không',
	@congnghedenbanphim = N'Không',
	@touchpad = 'Multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_16',
	@kieubanphim = 'QWERTY',
	@banphimso = N'Không',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Không',
	@congnghedenbanphim = N'Không',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_17',
	@kieubanphim = 'Full-size',
	@banphimso = N'Có',
	@loaidenbanphim = N'Không',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = N'Đang cập nhật'

exec check_banphim
	@mabanphim = 'banphim_18',
	@kieubanphim = 'Full-size',
	@banphimso = N'Không',
	@loaidenbanphim = 'LED',
	@maudenled = 'White',
	@congnghedenbanphim = N'Đơn sắc',
	@touchpad = 'Multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_19',
	@kieubanphim = '6-row, multimedia Fn keys',
	@banphimso = N'Không',
	@loaidenbanphim = N'Không',
	@maudenled = 'Blue',
	@congnghedenbanphim = N'Không',
	@touchpad = 'Multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_20',
	@kieubanphim = '6-row, multimedia Fn keys, numeric keypad',
	@banphimso = N'Có',
	@loaidenbanphim = 'LED',
	@maudenled = 'Blue',
	@congnghedenbanphim = N'Đơn sắc',
	@touchpad = 'Buttonless Mylar surface multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_21',
	@kieubanphim = 'Multimedia Fn keys, numeric keypad',
	@banphimso = N'Có',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = 'Buttonless Mylar surface multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_22',
	@kieubanphim = '6-row, multimedia Fn keys, numeric keypad',
	@banphimso = N'Có',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = 'Buttonless Mylar surface multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_23',
	@kieubanphim = '6-row, multimedia Fn keys',
	@banphimso = N'Không',
	@loaidenbanphim = 'LED',
	@maudenled = 'White',
	@congnghedenbanphim = N'Đơn sắc',
	@touchpad = 'Buttonless Mylar surface multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_24',
	@kieubanphim = '6-row, multimedia Fn keys',
	@banphimso = N'Không',
	@loaidenbanphim = N'Đang cập nhật',
	@maudenled = N'Đang cập nhật',
	@congnghedenbanphim = N'Đang cập nhật',
	@touchpad = 'Buttonless Mylar surface multi-touch touchpad'

exec check_banphim
	@mabanphim = 'banphim_25',
	@kieubanphim = '6-row, multimedia Fn keys, numeric keypad',
	@banphimso = N'Có',
	@loaidenbanphim = 'LED',
	@maudenled = 'White',
	@congnghedenbanphim = N'Đơn sắc',
	@touchpad = 'Buttonless Mylar surface multi-touch touchpad'

-- bo nho
exec check_bonho
	@mabonho = 'bonho_01',
	@kieu = 'M2.PCIe',
	@dungluong = '256',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = '2'

exec check_bonho
	@mabonho = 'bonho_02',
	@kieu = 'M2.PCIe',
	@dungluong = '512',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = '2'

exec check_bonho
	@mabonho = 'bonho_03',
	@kieu = 'M2.PCIe',
	@dungluong = '512',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = '3'

exec check_bonho
	@mabonho = 'bonho_04',
	@kieu = 'M2.PCIe',
	@dungluong = '512',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = '1'

exec check_bonho
	@mabonho = 'bonho_05',
	@kieu = 'M2.PCIe',
	@dungluong = '256',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = '1'

exec check_bonho
	@mabonho = 'bonho_06',
	@kieu = 'SATA 3',
	@dungluong = '1000',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = N'Đang cập nhật'

exec check_bonho
	@mabonho = 'bonho_07',
	@kieu = 'M2. PCIe',
	@dungluong = '128',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = N'Đang cập nhật'

exec check_bonho
	@mabonho = 'bonho_08',
	@kieu = 'M2. PCIe',
	@dungluong = '256',
	@tocdodocghi = '3000',
	@sokhecam = '2'

exec check_bonho
	@mabonho = 'bonho_09',
	@kieu = 'SATA 3',
	@dungluong = '500',
	@tocdodocghi = N'Đang cập nhật',
	@sokhecam = '2'

exec check_bonho
	@mabonho = 'bonho_10',
	@kieu = 'M2. PCIe',
	@dungluong = '256',
	@tocdodocghi = '3000',
	@sokhecam = '1'

exec check_bonho
	@mabonho = 'bonho_11',
	@kieu = 'M2. PCIe',
	@dungluong = '256',
	@tocdodocghi = '16384',
	@sokhecam = N'Đang cập nhật'

-- may tinh hinh anh
insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_01',N'/Máy tính/ACER/Acer Aspire 3 A315 56 59XY i5 1035G14GB256GB15.6FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_01',N'/Máy tính/ACER/Acer Aspire 3 A315 56 59XY i5 1035G14GB256GB15.6FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_01',N'/Máy tính/ACER/Acer Aspire 3 A315 56 59XY i5 1035G14GB256GB15.6FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_01',N'/Máy tính/ACER/Acer Aspire 3 A315 56 59XY i5 1035G14GB256GB15.6FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_01',N'/Máy tính/ACER/Acer Aspire 3 A315 56 59XY i5 1035G14GB256GB15.6FHDWin 10/anh5.PNG')

	-- acer 2
insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_02',N'/Máy tính/ACER/Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_02',N'/Máy tính/ACER/Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_02',N'/Máy tính/ACER/Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_02',N'/Máy tính/ACER/Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_02',N'/Máy tính/ACER/Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_02',N'/Máy tính/ACER/Acer Aspire 3 A315-23G-R33Y R5 3500U8G512G SSD15.6 FHDRadeon625-2GBWin10/anh6.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_03',N'/Máy tính/ACER/Acer Aspire 5 A514 53 3821 i3 1005G14GB256GB14FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_03',N'/Máy tính/ACER/Acer Aspire 5 A514 53 3821 i3 1005G14GB256GB14FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_03',N'/Máy tính/ACER/Acer Aspire 5 A514 53 3821 i3 1005G14GB256GB14FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_03',N'/Máy tính/ACER/Acer Aspire 5 A514 53 3821 i3 1005G14GB256GB14FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_03',N'/Máy tính/ACER/Acer Aspire 5 A514 53 3821 i3 1005G14GB256GB14FHDWin 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_04',N'/Máy tính/ACER/Acer Aspire A315-34-P3LCPentium N5000NX.HE3SV.004/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_04',N'/Máy tính/ACER/Acer Aspire A315-34-P3LCPentium N5000NX.HE3SV.004/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_04',N'/Máy tính/ACER/Acer Aspire A315-34-P3LCPentium N5000NX.HE3SV.004/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_04',N'/Máy tính/ACER/Acer Aspire A315-34-P3LCPentium N5000NX.HE3SV.004/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_04',N'/Máy tính/ACER/Acer Aspire A315-34-P3LCPentium N5000NX.HE3SV.004/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_05',N'/Máy tính/ACER/Acer Aspire Gaming 7 A715-41G-R1AZ R7 3750H8GB512GB SSD15.6FHDGTX1650-4GBW10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_05',N'/Máy tính/ACER/Acer Aspire Gaming 7 A715-41G-R1AZ R7 3750H8GB512GB SSD15.6FHDGTX1650-4GBW10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_05',N'/Máy tính/ACER/Acer Aspire Gaming 7 A715-41G-R1AZ R7 3750H8GB512GB SSD15.6FHDGTX1650-4GBW10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_05',N'/Máy tính/ACER/Acer Aspire Gaming 7 A715-41G-R1AZ R7 3750H8GB512GB SSD15.6FHDGTX1650-4GBW10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_05',N'/Máy tính/ACER/Acer Aspire Gaming 7 A715-41G-R1AZ R7 3750H8GB512GB SSD15.6FHDGTX1650-4GBW10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_06',N'/Máy tính/ACER/Acer Nitro 5 AN515 43 R65L R7 3750H8GB256GB15.6FHDRX560X 4GBWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_06',N'/Máy tính/ACER/Acer Nitro 5 AN515 43 R65L R7 3750H8GB256GB15.6FHDRX560X 4GBWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_06',N'/Máy tính/ACER/Acer Nitro 5 AN515 43 R65L R7 3750H8GB256GB15.6FHDRX560X 4GBWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_06',N'/Máy tính/ACER/Acer Nitro 5 AN515 43 R65L R7 3750H8GB256GB15.6FHDRX560X 4GBWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_06',N'/Máy tính/ACER/Acer Nitro 5 AN515 43 R65L R7 3750H8GB256GB15.6FHDRX560X 4GBWin 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_07',N'/Máy tính/ACER/Acer Nitro AN515 54 595D i5-9300H8Gb512GbGTX 1650 4Gb15.6FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_07',N'/Máy tính/ACER/Acer Nitro AN515 54 595D i5-9300H8Gb512GbGTX 1650 4Gb15.6FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_07',N'/Máy tính/ACER/Acer Nitro AN515 54 595D i5-9300H8Gb512GbGTX 1650 4Gb15.6FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_07',N'/Máy tính/ACER/Acer Nitro AN515 54 595D i5-9300H8Gb512GbGTX 1650 4Gb15.6FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_07',N'/Máy tính/ACER/Acer Nitro AN515 54 595D i5-9300H8Gb512GbGTX 1650 4Gb15.6FHDWin 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_08',N'/Máy tính/ACER/Acer Swift 3S SF314 57 52GB i5 1035G18Gb512Gb14FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_08',N'/Máy tính/ACER/Acer Swift 3S SF314 57 52GB i5 1035G18Gb512Gb14FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_08',N'/Máy tính/ACER/Acer Swift 3S SF314 57 52GB i5 1035G18Gb512Gb14FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_09',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-58PNCore i5-8265UNX.H7HSV.001/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_09',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-58PNCore i5-8265UNX.H7HSV.001/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_09',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-58PNCore i5-8265UNX.H7HSV.001/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_09',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-58PNCore i5-8265UNX.H7HSV.001/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_09',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-58PNCore i5-8265UNX.H7HSV.001/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_10',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_10',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_10',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_10',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_10',N'/Máy tính/ACER/Acer Swift 5 SF514-53T-720RCore i7-8565UNX.H7HSV.002/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_11',N'/Máy tính/ACER/Acer Swift SF114-32-P2SG N50004Gb64Gb EMMC14FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_11',N'/Máy tính/ACER/Acer Swift SF114-32-P2SG N50004Gb64Gb EMMC14FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_11',N'/Máy tính/ACER/Acer Swift SF114-32-P2SG N50004Gb64Gb EMMC14FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_11',N'/Máy tính/ACER/Acer Swift SF114-32-P2SG N50004Gb64Gb EMMC14FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_12',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK160TR5-3500U8GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_12',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK160TR5-3500U8GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_12',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK160TR5-3500U8GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_12',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK160TR5-3500U8GB512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_12',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK160TR5-3500U8GB512GB SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_13',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK347T R3 3200U4GB512GBWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_13',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK347T R3 3200U4GB512GBWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_13',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK347T R3 3200U4GB512GBWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_13',N'/Máy tính/ASUS/Asus Vivobook A412DA-EK347T R3 3200U4GB512GBWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_14',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK109T R5-3500U4GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_14',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK109T R5-3500U4GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_14',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK109T R5-3500U4GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_14',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK109T R5-3500U4GB512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_15',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK110T R3 3200U4GB256GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_15',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK110T R3 3200U4GB256GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_15',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK110T R3 3200U4GB256GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_15',N'/Máy tính/ASUS/Asus Vivobook D409DA-EK110T R3 3200U4GB256GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_16',N'/Máy tính/ASUS/Asus Vivobook TP412FA-EC268T I3 8145U4GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_16',N'/Máy tính/ASUS/Asus Vivobook TP412FA-EC268T I3 8145U4GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_16',N'/Máy tính/ASUS/Asus Vivobook TP412FA-EC268T I3 8145U4GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_16',N'/Máy tính/ASUS/Asus Vivobook TP412FA-EC268T I3 8145U4GB512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_16',N'/Máy tính/ASUS/Asus Vivobook TP412FA-EC268T I3 8145U4GB512GB SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_17',N'/Máy tính/ASUS/Asus Vivobook X407UA-BV537TCore i3-7020U4GB1TBWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_17',N'/Máy tính/ASUS/Asus Vivobook X407UA-BV537TCore i3-7020U4GB1TBWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_17',N'/Máy tính/ASUS/Asus Vivobook X407UA-BV537TCore i3-7020U4GB1TBWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_17',N'/Máy tính/ASUS/Asus Vivobook X407UA-BV537TCore i3-7020U4GB1TBWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_17',N'/Máy tính/ASUS/Asus Vivobook X407UA-BV537TCore i3-7020U4GB1TBWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_18',N'/Máy tính/ASUS/Asus Vivobook X409FA-EK470T i3-8145U4G512GB SSD14FHDWin10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_18',N'/Máy tính/ASUS/Asus Vivobook X409FA-EK470T i3-8145U4G512GB SSD14FHDWin10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_18',N'/Máy tính/ASUS/Asus Vivobook X409FA-EK470T i3-8145U4G512GB SSD14FHDWin10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_18',N'/Máy tính/ASUS/Asus Vivobook X409FA-EK470T i3-8145U4G512GB SSD14FHDWin10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_18',N'/Máy tính/ASUS/Asus Vivobook X409FA-EK470T i3-8145U4G512GB SSD14FHDWin10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_19',N'/Máy tính/ASUS/Asus Vivobook X509JA-EJ171T i5 1035G14GB512GB SSD15.6FHDWin10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_19',N'/Máy tính/ASUS/Asus Vivobook X509JA-EJ171T i5 1035G14GB512GB SSD15.6FHDWin10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_19',N'/Máy tính/ASUS/Asus Vivobook X509JA-EJ171T i5 1035G14GB512GB SSD15.6FHDWin10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_19',N'/Máy tính/ASUS/Asus Vivobook X509JA-EJ171T i5 1035G14GB512GB SSD15.6FHDWin10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_19',N'/Máy tính/ASUS/Asus Vivobook X509JA-EJ171T i5 1035G14GB512GB SSD15.6FHDWin10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_20',N'/Máy tính/ASUS/Asus Vivobook X509MA-BR063T N50004G256GB SSDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_20',N'/Máy tính/ASUS/Asus Vivobook X509MA-BR063T N50004G256GB SSDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_20',N'/Máy tính/ASUS/Asus Vivobook X509MA-BR063T N50004G256GB SSDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_20',N'/Máy tính/ASUS/Asus Vivobook X509MA-BR063T N50004G256GB SSDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_20',N'/Máy tính/ASUS/Asus Vivobook X509MA-BR063T N50004G256GB SSDWin 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_21',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR011TCore i3-7020U4GB1TBWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_21',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR011TCore i3-7020U4GB1TBWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_21',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR011TCore i3-7020U4GB1TBWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_21',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR011TCore i3-7020U4GB1TBWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_21',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR011TCore i3-7020U4GB1TBWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_22',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR236TCore i3-7020U4G512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_22',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR236TCore i3-7020U4G512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_22',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR236TCore i3-7020U4G512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_22',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR236TCore i3-7020U4G512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_22',N'/Máy tính/ASUS/Asus Vivobook X509UA-BR236TCore i3-7020U4G512GB SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_23',N'/Máy tính/DELL/Dell Inspiron 14 N5490 i5 10210U8Gb512Gb14.0FHD2Gb_MX230Win 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_23',N'/Máy tính/DELL/Dell Inspiron 14 N5490 i5 10210U8Gb512Gb14.0FHD2Gb_MX230Win 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_23',N'/Máy tính/DELL/Dell Inspiron 14 N5490 i5 10210U8Gb512Gb14.0FHD2Gb_MX230Win 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_23',N'/Máy tính/DELL/Dell Inspiron 14 N5490 i5 10210U8Gb512Gb14.0FHD2Gb_MX230Win 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_23',N'/Máy tính/DELL/Dell Inspiron 14 N5490 i5 10210U8Gb512Gb14.0FHD2Gb_MX230Win 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_24',N'/Máy tính/DELL/Dell Inspiron G7 N7591Core i7-9750HKJ2G41/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_24',N'/Máy tính/DELL/Dell Inspiron G7 N7591Core i7-9750HKJ2G41/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_24',N'/Máy tính/DELL/Dell Inspiron G7 N7591Core i7-9750HKJ2G41/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_24',N'/Máy tính/DELL/Dell Inspiron G7 N7591Core i7-9750HKJ2G41/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_25',N'/Máy tính/DELL/Dell Inspiron N3481Core i3-7020U4Gb1Tb14HD3cellWin 10030CX2/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_25',N'/Máy tính/DELL/Dell Inspiron N3481Core i3-7020U4Gb1Tb14HD3cellWin 10030CX2/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_25',N'/Máy tính/DELL/Dell Inspiron N3481Core i3-7020U4Gb1Tb14HD3cellWin 10030CX2/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_25',N'/Máy tính/DELL/Dell Inspiron N3481Core i3-7020U4Gb1Tb14HD3cellWin 10030CX2/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_25',N'/Máy tính/DELL/Dell Inspiron N3481Core i3-7020U4Gb1Tb14HD3cellWin 10030CX2/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_26',N'/Máy tính/DELL/Dell Inspiron N3493 i5 1035G18Gb256Gb14FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_26',N'/Máy tính/DELL/Dell Inspiron N3493 i5 1035G18Gb256Gb14FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_26',N'/Máy tính/DELL/Dell Inspiron N3493 i5 1035G18Gb256Gb14FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_27',N'/Máy tính/DELL/Dell Inspiron N3580Core i5-8265U70184569/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_27',N'/Máy tính/DELL/Dell Inspiron N3580Core i5-8265U70184569/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_27',N'/Máy tính/DELL/Dell Inspiron N3580Core i5-8265U70184569/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_27',N'/Máy tính/DELL/Dell Inspiron N3580Core i5-8265U70184569/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_28',N'/Máy tính/DELL/Dell Inspiron N3593 i5 1035G14Gb256GbNvidia MX230 2Gb15.6FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_28',N'/Máy tính/DELL/Dell Inspiron N3593 i5 1035G14Gb256GbNvidia MX230 2Gb15.6FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_28',N'/Máy tính/DELL/Dell Inspiron N3593 i5 1035G14Gb256GbNvidia MX230 2Gb15.6FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_28',N'/Máy tính/DELL/Dell Inspiron N3593 i5 1035G14Gb256GbNvidia MX230 2Gb15.6FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_29',N'/Máy tính/DELL/Dell Inspiron N3593 i7 1065G78GB512GB15.6FHDNVIDIA MX230 2GBWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_29',N'/Máy tính/DELL/Dell Inspiron N3593 i7 1065G78GB512GB15.6FHDNVIDIA MX230 2GBWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_29',N'/Máy tính/DELL/Dell Inspiron N3593 i7 1065G78GB512GB15.6FHDNVIDIA MX230 2GBWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_29',N'/Máy tính/DELL/Dell Inspiron N3593 i7 1065G78GB512GB15.6FHDNVIDIA MX230 2GBWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_30',N'/Máy tính/DELL/Dell Inspiron N5584Core i5-8265U4GBN5I5384W/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_30',N'/Máy tính/DELL/Dell Inspiron N5584Core i5-8265U4GBN5I5384W/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_30',N'/Máy tính/DELL/Dell Inspiron N5584Core i5-8265U4GBN5I5384W/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_30',N'/Máy tính/DELL/Dell Inspiron N5584Core i5-8265U4GBN5I5384W/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_31',N'/Máy tính/DELL/Dell Inspiron N5593 i3 1005G14Gb128Gb15.6FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_31',N'/Máy tính/DELL/Dell Inspiron N5593 i3 1005G14Gb128Gb15.6FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_31',N'/Máy tính/DELL/Dell Inspiron N5593 i3 1005G14Gb128Gb15.6FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_31',N'/Máy tính/DELL/Dell Inspiron N5593 i3 1005G14Gb128Gb15.6FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_31',N'/Máy tính/DELL/Dell Inspiron N5593 i3 1005G14Gb128Gb15.6FHDWin 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_32',N'/Máy tính/DELL/Dell Vostro V3481Core i3-7020U4Gb1Tb14.0HDWin 10Đen70187645/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_32',N'/Máy tính/DELL/Dell Vostro V3481Core i3-7020U4Gb1Tb14.0HDWin 10Đen70187645/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_32',N'/Máy tính/DELL/Dell Vostro V3481Core i3-7020U4Gb1Tb14.0HDWin 10Đen70187645/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_32',N'/Máy tính/DELL/Dell Vostro V3481Core i3-7020U4Gb1Tb14.0HDWin 10Đen70187645/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_32',N'/Máy tính/DELL/Dell Vostro V3481Core i3-7020U4Gb1Tb14.0HDWin 10Đen70187645/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_33',N'/Máy tính/DELL/Dell Vostro V3580ICore i5-8265UP75F010V80I/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_33',N'/Máy tính/DELL/Dell Vostro V3580ICore i5-8265UP75F010V80I/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_33',N'/Máy tính/DELL/Dell Vostro V3580ICore i5-8265UP75F010V80I/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_33',N'/Máy tính/DELL/Dell Vostro V3580ICore i5-8265UP75F010V80I/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_34',N'/Máy tính/DELL/Dell Vostro V3590 i3-10110U4GB256GB15.6FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_34',N'/Máy tính/DELL/Dell Vostro V3590 i3-10110U4GB256GB15.6FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_34',N'/Máy tính/DELL/Dell Vostro V3590 i3-10110U4GB256GB15.6FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_34',N'/Máy tính/DELL/Dell Vostro V3590 i3-10110U4GB256GB15.6FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_35',N'/Máy tính/DELL/Dell Vostro V5590 i5 10210U8Gb256Gb15.6FHDWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_35',N'/Máy tính/DELL/Dell Vostro V5590 i5 10210U8Gb256Gb15.6FHDWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_35',N'/Máy tính/DELL/Dell Vostro V5590 i5 10210U8Gb256Gb15.6FHDWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_35',N'/Máy tính/DELL/Dell Vostro V5590 i5 10210U8Gb256Gb15.6FHDWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_35',N'/Máy tính/DELL/Dell Vostro V5590 i5 10210U8Gb256Gb15.6FHDWin 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_36',N'/Máy tính/HP/HP 14s-dk0117AU R3 3200U4GB256GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_36',N'/Máy tính/HP/HP 14s-dk0117AU R3 3200U4GB256GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_36',N'/Máy tính/HP/HP 14s-dk0117AU R3 3200U4GB256GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_36',N'/Máy tính/HP/HP 14s-dk0117AU R3 3200U4GB256GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_37',N'/Máy tính/HP/HP 15-da0037TXi3 7020U/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_37',N'/Máy tính/HP/HP 15-da0037TXi3 7020U/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_37',N'/Máy tính/HP/HP 15-da0037TXi3 7020U/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_37',N'/Máy tính/HP/HP 15-da0037TXi3 7020U/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_38',N'/Máy tính/HP/HP 15s-du1040TX i7-10510U8GB512GB SSD2GB MX130WIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_38',N'/Máy tính/HP/HP 15s-du1040TX i7-10510U8GB512GB SSD2GB MX130WIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_38',N'/Máy tính/HP/HP 15s-du1040TX i7-10510U8GB512GB SSD2GB MX130WIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_38',N'/Máy tính/HP/HP 15s-du1040TX i7-10510U8GB512GB SSD2GB MX130WIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_39',N'/Máy tính/HP/HP 15s-du2049TX i3 1005G14GB256GB SSDMX130 2GBWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_39',N'/Máy tính/HP/HP 15s-du2049TX i3 1005G14GB256GB SSDMX130 2GBWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_39',N'/Máy tính/HP/HP 15s-du2049TX i3 1005G14GB256GB SSDMX130 2GBWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_39',N'/Máy tính/HP/HP 15s-du2049TX i3 1005G14GB256GB SSDMX130 2GBWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_39',N'/Máy tính/HP/HP 15s-du2049TX i3 1005G14GB256GB SSDMX130 2GBWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_40',N'/Máy tính/HP/HP ENVY X360-AR0071AUR5-3500U8GB256G SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_40',N'/Máy tính/HP/HP ENVY X360-AR0071AUR5-3500U8GB256G SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_40',N'/Máy tính/HP/HP ENVY X360-AR0071AUR5-3500U8GB256G SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_40',N'/Máy tính/HP/HP ENVY X360-AR0071AUR5-3500U8GB256G SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_40',N'/Máy tính/HP/HP ENVY X360-AR0071AUR5-3500U8GB256G SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_41',N'/Máy tính/HP/HP Pavilion 14-ce2041TUCore i5-8265U4GB1TBWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_41',N'/Máy tính/HP/HP Pavilion 14-ce2041TUCore i5-8265U4GB1TBWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_41',N'/Máy tính/HP/HP Pavilion 14-ce2041TUCore i5-8265U4GB1TBWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_41',N'/Máy tính/HP/HP Pavilion 14-ce2041TUCore i5-8265U4GB1TBWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_42',N'/Máy tính/HP/HP Pavilion 15-cs2056TXi5-8265U4GB1TBMX130 2GBWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_42',N'/Máy tính/HP/HP Pavilion 15-cs2056TXi5-8265U4GB1TBMX130 2GBWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_42',N'/Máy tính/HP/HP Pavilion 15-cs2056TXi5-8265U4GB1TBMX130 2GBWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_42',N'/Máy tính/HP/HP Pavilion 15-cs2056TXi5-8265U4GB1TBMX130 2GBWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_42',N'/Máy tính/HP/HP Pavilion 15-cs2056TXi5-8265U4GB1TBMX130 2GBWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_43',N'/Máy tính/HP/HP Pavilion 15-cs3060TXi5-1035G18GB512GSSD2GB MX250WIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_43',N'/Máy tính/HP/HP Pavilion 15-cs3060TXi5-1035G18GB512GSSD2GB MX250WIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_43',N'/Máy tính/HP/HP Pavilion 15-cs3060TXi5-1035G18GB512GSSD2GB MX250WIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_43',N'/Máy tính/HP/HP Pavilion 15-cs3060TXi5-1035G18GB512GSSD2GB MX250WIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_43',N'/Máy tính/HP/HP Pavilion 15-cs3060TXi5-1035G18GB512GSSD2GB MX250WIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_44',N'/Máy tính/LENOVO/Lenovo Ideadpad S340-15IWLCore I3 8145U4GB256G SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_44',N'/Máy tính/LENOVO/Lenovo Ideadpad S340-15IWLCore I3 8145U4GB256G SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_44',N'/Máy tính/LENOVO/Lenovo Ideadpad S340-15IWLCore I3 8145U4GB256G SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_44',N'/Máy tính/LENOVO/Lenovo Ideadpad S340-15IWLCore I3 8145U4GB256G SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_44',N'/Máy tính/LENOVO/Lenovo Ideadpad S340-15IWLCore I3 8145U4GB256G SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_45',N'/Máy tính/LENOVO/Lenovo Ideapad C340-14API R7 3700U8GB512GB SSD14.0FHD TouchWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_45',N'/Máy tính/LENOVO/Lenovo Ideapad C340-14API R7 3700U8GB512GB SSD14.0FHD TouchWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_45',N'/Máy tính/LENOVO/Lenovo Ideapad C340-14API R7 3700U8GB512GB SSD14.0FHD TouchWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_45',N'/Máy tính/LENOVO/Lenovo Ideapad C340-14API R7 3700U8GB512GB SSD14.0FHD TouchWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_46',N'/Máy tính/LENOVO/Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_46',N'/Máy tính/LENOVO/Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_46',N'/Máy tính/LENOVO/Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_46',N'/Máy tính/LENOVO/Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_46',N'/Máy tính/LENOVO/Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_46',N'/Máy tính/LENOVO/Lenovo IdeaPad Flex 5 14ARE05 R5 4500U8GB512GB14.0FHD TouchPenWin 10/anh6.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_47',N'/Máy tính/LENOVO/Lenovo Ideapad L340-15IRH i7 9750HF8GB512GB SSD3GB GTX1050WIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_47',N'/Máy tính/LENOVO/Lenovo Ideapad L340-15IRH i7 9750HF8GB512GB SSD3GB GTX1050WIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_47',N'/Máy tính/LENOVO/Lenovo Ideapad L340-15IRH i7 9750HF8GB512GB SSD3GB GTX1050WIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_47',N'/Máy tính/LENOVO/Lenovo Ideapad L340-15IRH i7 9750HF8GB512GB SSD3GB GTX1050WIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_48',N'/Máy tính/LENOVO/Lenovo Ideapad S145-15API R5 3500U4GB256GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_48',N'/Máy tính/LENOVO/Lenovo Ideapad S145-15API R5 3500U4GB256GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_48',N'/Máy tính/LENOVO/Lenovo Ideapad S145-15API R5 3500U4GB256GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_49',N'/Máy tính/LENOVO/Lenovo IdeaPad S145-15IIL i5 1035G18GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_49',N'/Máy tính/LENOVO/Lenovo IdeaPad S145-15IIL i5 1035G18GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_49',N'/Máy tính/LENOVO/Lenovo IdeaPad S145-15IIL i5 1035G18GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_50',N'/Máy tính/LENOVO/Lenovo Ideapad S145-15IKB i3 8130U4GB256GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_50',N'/Máy tính/LENOVO/Lenovo Ideapad S145-15IKB i3 8130U4GB256GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_50',N'/Máy tính/LENOVO/Lenovo Ideapad S145-15IKB i3 8130U4GB256GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_51',N'/Máy tính/LENOVO/Lenovo Ideapad S340-15IWLi5-8265U4G256GBMX230 2GBWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_51',N'/Máy tính/LENOVO/Lenovo Ideapad S340-15IWLi5-8265U4G256GBMX230 2GBWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_51',N'/Máy tính/LENOVO/Lenovo Ideapad S340-15IWLi5-8265U4G256GBMX230 2GBWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_51',N'/Máy tính/LENOVO/Lenovo Ideapad S340-15IWLi5-8265U4G256GBMX230 2GBWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_52',N'/Máy tính/LENOVO/Lenovo Ideapad S340R5-3500U4GB256GSSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_52',N'/Máy tính/LENOVO/Lenovo Ideapad S340R5-3500U4GB256GSSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_52',N'/Máy tính/LENOVO/Lenovo Ideapad S340R5-3500U4GB256GSSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_52',N'/Máy tính/LENOVO/Lenovo Ideapad S340R5-3500U4GB256GSSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_52',N'/Máy tính/LENOVO/Lenovo Ideapad S340R5-3500U4GB256GSSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_53',N'/Máy tính/LENOVO/Lenovo IdeaPad S540-13API R5 3550H8GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_53',N'/Máy tính/LENOVO/Lenovo IdeaPad S540-13API R5 3550H8GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_53',N'/Máy tính/LENOVO/Lenovo IdeaPad S540-13API R5 3550H8GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_53',N'/Máy tính/LENOVO/Lenovo IdeaPad S540-13API R5 3550H8GB512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_53',N'/Máy tính/LENOVO/Lenovo IdeaPad S540-13API R5 3550H8GB512GB SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_54',N'/Máy tính/LENOVO/Lenovo ideapad Slim 3-14IIL05 i3-1005G18GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_54',N'/Máy tính/LENOVO/Lenovo ideapad Slim 3-14IIL05 i3-1005G18GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_54',N'/Máy tính/LENOVO/Lenovo ideapad Slim 3-14IIL05 i3-1005G18GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_54',N'/Máy tính/LENOVO/Lenovo ideapad Slim 3-14IIL05 i3-1005G18GB512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_54',N'/Máy tính/LENOVO/Lenovo ideapad Slim 3-14IIL05 i3-1005G18GB512GB SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_55',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R5 4600H8GB512GB4GB GTX1650WIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_55',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R5 4600H8GB512GB4GB GTX1650WIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_55',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R5 4600H8GB512GB4GB GTX1650WIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_55',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R5 4600H8GB512GB4GB GTX1650WIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_55',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R5 4600H8GB512GB4GB GTX1650WIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_56',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R7 4800H8GB512GB SSD4GB GTX1650WIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_56',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R7 4800H8GB512GB SSD4GB GTX1650WIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_56',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R7 4800H8GB512GB SSD4GB GTX1650WIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_56',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R7 4800H8GB512GB SSD4GB GTX1650WIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_56',N'/Máy tính/LENOVO/Lenovo Legion 5-15ARH05 R7 4800H8GB512GB SSD4GB GTX1650WIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_57',N'/Máy tính/LENOVO/Lenovo ThinkBook 14 i5 10210U8GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_57',N'/Máy tính/LENOVO/Lenovo ThinkBook 14 i5 10210U8GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_57',N'/Máy tính/LENOVO/Lenovo ThinkBook 14 i5 10210U8GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_57',N'/Máy tính/LENOVO/Lenovo ThinkBook 14 i5 10210U8GB512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_57',N'/Máy tính/LENOVO/Lenovo ThinkBook 14 i5 10210U8GB512GB SSDWIN10/anh5.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_58',N'/Máy tính/LENOVO/Lenovo ThinkPad E14 i5 10210U8GB512GB SSDWIN10/anh1.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_58',N'/Máy tính/LENOVO/Lenovo ThinkPad E14 i5 10210U8GB512GB SSDWIN10/anh2.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_58',N'/Máy tính/LENOVO/Lenovo ThinkPad E14 i5 10210U8GB512GB SSDWIN10/anh3.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_58',N'/Máy tính/LENOVO/Lenovo ThinkPad E14 i5 10210U8GB512GB SSDWIN10/anh4.PNG')

insert into maytinhhinhanh(mamaytinh,hinhanh)
values('mt_58',N'/Máy tính/LENOVO/Lenovo ThinkPad E14 i5 10210U8GB512GB SSDWIN10/anh5.PNG')

-- may tinh chi tiet danh dau
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_01','cpu_01','ram_01','dohoa_01','manhinh_01','loa_01','pin_01','Home','chatlieu_01','banphim_02','bonho_01')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_02','cpu_02','ram_02','dohoa_02','manhinh_02','loa_02','pin_02','Home','chatlieu_02','banphim_02','bonho_01')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_03','cpu_03','ram_03','dohoa_03','manhinh_03','loa_02','pin_02','Home','chatlieu_01','banphim_02','bonho_01')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_04','cpu_04','ram_04','dohoa_04','manhinh_04','loa_01','pin_03','Home','chatlieu_02','banphim_03','bonho_02')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_05','cpu_01','ram_01','dohoa_01','manhinh_01','loa_01','pin_01','Home Single Lan','chatlieu_01','banphim_02','bonho_01')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_06','cpu_02','ram_02','dohoa_02','manhinh_02','loa_02','pin_02','Home','chatlieu_02','banphim_02','bonho_05')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_07','cpu_03','ram_03','dohoa_03','manhinh_03','loa_02','pin_02','Home','chatlieu_01','banphim_02','bonho_03')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_08','cpu_04','ram_04','dohoa_04','manhinh_04','loa_01','pin_03','Home Single Lan','chatlieu_02','banphim_03','bonho_02')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_09','cpu_09','ram_09','dohoa_08','manhinh_09','loa_02','pin_02','Home','chatlieu_02','banphim_02','bonho_05')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_10','cpu_10','ram_10','dohoa_09','manhinh_10','loa_02','pin_02','Home Single Lan','chatlieu_01','banphim_02','bonho_03')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_11','cpu_11','ram_10','dohoa_10','manhinh_09','loa_01','pin_03','Home Single Lan','chatlieu_02','banphim_03','bonho_01')

--asus
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_12','cpu_12','ram_11','dohoa_11','manhinh_11','loa_03','pin_07','Home','chatlieu_03','banphim_08','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_13','cpu_13','ram_12','dohoa_11','manhinh_12','loa_03','pin_07','Home','chatlieu_03','banphim_09','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_14','cpu_14','ram_12','dohoa_12','manhinh_13','loa_03','pin_07','Home','chatlieu_03','banphim_10','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_15','cpu_15','ram_13','dohoa_12','manhinh_17','loa_03','pin_07','Home Single Lan','chatlieu_03','banphim_11','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_16','cpu_12','ram_11','dohoa_11','manhinh_11','loa_03','pin_07','Home','chatlieu_03','banphim_08','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_17','cpu_13','ram_12','dohoa_11','manhinh_12','loa_03','pin_07','Home','chatlieu_03','banphim_09','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_18','cpu_14','ram_12','dohoa_12','manhinh_13','loa_03','pin_07','Home','chatlieu_03','banphim_10','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_19','cpu_15','ram_13','dohoa_12','manhinh_17','loa_03','pin_07','Home Single Lan','chatlieu_03','banphim_11','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_20','cpu_13','ram_12','dohoa_11','manhinh_12','loa_03','pin_07','Home','chatlieu_03','banphim_09','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_21','cpu_14','ram_12','dohoa_12','manhinh_13','loa_03','pin_07','Home','chatlieu_03','banphim_10','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_22','cpu_15','ram_13','dohoa_12','manhinh_17','loa_03','pin_07','Home Single Lan','chatlieu_03','banphim_11','bonho_06')

-- dell
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_23','cpu_23','ram_19','dohoa_15','manhinh_18','loa_04','pin_08','Home','chatlieu_02','banphim_12','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_24','cpu_24','ram_20','dohoa_15','manhinh_18','loa_04','pin_09','Home','chatlieu_02','banphim_13','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_25','cpu_25','ram_21','dohoa_15','manhinh_18','loa_05','pin_09','Home Single Lan','chatlieu_02','banphim_14','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_26','cpu_26','ram_22','dohoa_15','manhinh_18','loa_05','pin_10','Home','chatlieu_02','banphim_12','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_27','cpu_27','ram_23','dohoa_15','manhinh_18','loa_04','pin_08','Home Single Lan','chatlieu_02','banphim_15','bonho_07')

--
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_28','cpu_23','ram_06','dohoa_15','manhinh_19','loa_04','pin_08','Home','chatlieu_01','banphim_12','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_29','cpu_24','ram_07','dohoa_15','manhinh_19','loa_04','pin_09','Home','chatlieu_02','banphim_13','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_30','cpu_25','ram_09','dohoa_15','manhinh_24','loa_05','pin_09','Home Single Lan','chatlieu_02','banphim_14','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_31','cpu_26','ram_09','dohoa_15','manhinh_18','loa_05','pin_10','Home','chatlieu_03','banphim_12','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_32','cpu_27','ram_09','dohoa_15','manhinh_24','loa_04','pin_08','Home Single Lan','chatlieu_02','banphim_15','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_33','cpu_25','ram_09','dohoa_15','manhinh_24','loa_05','pin_09','Home Single Lan','chatlieu_02','banphim_14','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_34','cpu_26','ram_09','dohoa_15','manhinh_18','loa_05','pin_10','Home','chatlieu_03','banphim_12','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_35','cpu_27','ram_09','dohoa_15','manhinh_24','loa_04','pin_08','Home Single Lan','chatlieu_02','banphim_15','bonho_07')

-- hp
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_36','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')
	
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_37','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')
	
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_38','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_39','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_40','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_41','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_42','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_43','cpu_34','ram_26','dohoa_18','manhinh_28','loa_07','pin_12','Home','chatlieu_02','banphim_16','bonho_08')
 
-- 
insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_44','cpu_37','ram_32','dohoa_19','manhinh_35','loa_09','pin_14','Home','chatlieu_07','banphim_18','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_45','cpu_38','ram_32','dohoa_19','manhinh_35','loa_10','pin_14','Home','chatlieu_08','banphim_18','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_46','cpu_39','ram_33','dohoa_20','manhinh_36','loa_10','pin_15','Home','chatlieu_07','banphim_18','bonho_11')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_47','cpu_40','ram_34','dohoa_21','manhinh_37','loa_07','pin_10','Home','chatlieu_08','banphim_21','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_48','cpu_41','ram_35','dohoa_21','manhinh_37','loa_09','pin_14','Home','chatlieu_07','banphim_18','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_49','cpu_37','ram_32','dohoa_19','manhinh_35','loa_09','pin_14','Home','chatlieu_07','banphim_18','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_50','cpu_38','ram_32','dohoa_19','manhinh_35','loa_10','pin_14','Home','chatlieu_08','banphim_18','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_51','cpu_39','ram_33','dohoa_20','manhinh_36','loa_10','pin_15','Home','chatlieu_07','banphim_18','bonho_11')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_52','cpu_40','ram_34','dohoa_21','manhinh_37','loa_07','pin_10','Home','chatlieu_08','banphim_21','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_53','cpu_41','ram_35','dohoa_21','manhinh_37','loa_09','pin_14','Home','chatlieu_07','banphim_18','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_54','cpu_37','ram_32','dohoa_19','manhinh_35','loa_09','pin_14','Home','chatlieu_07','banphim_18','bonho_08')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_55','cpu_38','ram_32','dohoa_19','manhinh_35','loa_10','pin_14','Home','chatlieu_08','banphim_18','bonho_06')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_56','cpu_39','ram_33','dohoa_20','manhinh_36','loa_10','pin_15','Home','chatlieu_07','banphim_18','bonho_11')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_57','cpu_40','ram_34','dohoa_21','manhinh_37','loa_07','pin_10','Home','chatlieu_08','banphim_21','bonho_07')

insert into maytinhchitiet(mamaytinh,macpu,maram,madohoa,mamanhinh,maloa,mapin,phienbanhedieuhanh,machatlieu,mabanphim,mabonho)
values('mt_58','cpu_41','ram_35','dohoa_21','manhinh_37','loa_09','pin_14','Home','chatlieu_07','banphim_18','bonho_08')

Select mt.mamaytinh,mt.tensanpham,mt.gia, 
       bxl.loaicpu,dh.hang,mh.kichthuocmanhinh, 
       bn.dungluong as dungluongbonho,ra.dungluong as dungluongram,mt.trongluong,mt.hinhanh 
       from Maytinh mt left join Maytinhchitiet mtct
       on mt.mamaytinh = mtct.mamaytinh full join Boxuly bxl 
       on mtct.macpu = bxl.macpu full join Dohoa dh 
       on mtct.madohoa = dh.madohoa full join Manhinh mh
       on mtct.mamanhinh = mh.mamanhinh full join Bonho bn
       on mtct.mabonho = bn.mabonho full join Ram ra
       on mtct.maram = ra.maram
where mt.tensanpham <> 'NULL'

Select mt.mamaytinh,mt.tensanpham,mt.gia, 
       bxl.loaicpu,dh.cardonboard,mh.kichthuocmanhinh, 
       bn.dungluong,ra.dungluong,mt.trongluong,mt.hinhanh 
       from maytinh mt inner join maytinhchitiet mtct
       on mt.mamaytinh = mtct.mamaytinh inner join boxuly bxl 
       on mtct.macpu = bxl.macpu inner join dohoa dh 
       on mtct.madohoa = dh.madohoa inner join manhinh mh
       on mtct.mamanhinh = mh.mamanhinh inner join bonho bn
       on mtct.mabonho = bn.mabonho inner join ram ra
       on mtct.maram = ra.maram

where mt.tensanpham like '%Acer%' and mt.gia <= 435

