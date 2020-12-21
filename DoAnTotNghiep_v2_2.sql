create table maytinhbang
(
	mamaytinhbang varchar(25) primary key,
	tensanpham varchar(60) not null,
	xuatxu varchar(20) not null,
	thoigianbaohanh varchar(2),
	chieurong varchar(5),
	chieucao varchar(5),
	chieusau varchar(5),
	namramat varchar(4) not null,
	trongluong varchar(5),
	soluong varchar(5),
	gia varchar(8),
	hinhanh nvarchar(255) null
)

create procedure check_maytinhbang
	@mamaytinhbang varchar(25),
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
	if exists (select * from maytinhbang
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
		insert into maytinhbang(mamaytinhbang,tensanpham,xuatxu,thoigianbaohanh,chieurong,chieucao,chieusau,namramat,trongluong,soluong,gia,hinhanh)
		values(@mamaytinhbang,@tensanpham,@xuatxu,@thoigianbaohanh,@chieurong,@chieucao,@chieusau,@namramat,@trongluong,@soluong,@gia,@hinhanh)
	end
go

create table chatlieumaytinhbang
(
	machatlieu varchar(25) primary key,
	tenchatlieu nvarchar(30) null
)

create procedure check_chatlieumaytinhbang
	@machatlieu varchar(25),
	@tenchatlieu nvarchar(30)
as
	if exists (select * from chatlieumaytinhbang
				where tenchatlieu = @tenchatlieu)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into chatlieumaytinhbang(machatlieu,tenchatlieu)
		values(@machatlieu,@tenchatlieu)
	end
go

create table boxulymaytinhbang
(
	macpu varchar(15) primary key,
	chitietcpu varchar(60) null,
	loai varchar(15) null,
	sonhancpu varchar(5),
	tocdotoida varchar(5),
	phienban varchar(10) null
)

create procedure check_boxulymaytinhbang
	@macpu varchar(15),
	@chitietcpu varchar(60),
	@loai varchar(15),
	@sonhancpu varchar(5),
	@tocdotoida varchar(5),
	@phienban varchar(10)
as
	if exists (select * from boxulymaytinhbang
				where chitietcpu = @chitietcpu
				and loai = @loai
				and sonhancpu = @sonhancpu
				and tocdotoida = @tocdotoida
				and phienban = @phienban)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into boxulymaytinhbang(macpu,chitietcpu,loai,sonhancpu,tocdotoida,phienban)
		values(@macpu,@chitietcpu,@loai,@sonhancpu,@tocdotoida,@phienban)
	end
go

create table manhinhmaytinhbang
(
	mamanhinh varchar(15) primary key,
	congnghemanhinh varchar(20) null,
	kichthuoc varchar(5) null,
	chuanmanhinh varchar(20) null,
	dophangiai varchar(15) null,
	maumanhinh nvarchar(15) null,
	chatlieumatkinh nvarchar(20) null
)

create procedure check_manhinhmaytinhbang
	@mamanhinh varchar(15),
	@congnghemanhinh varchar(20),
	@kichthuoc varchar(5),
	@chuanmanhinh varchar(20),
	@dophangiai varchar(15),
	@maumanhinh nvarchar(15),
	@chatlieumatkinh nvarchar(20)
as
	if exists (select * from manhinhmaytinhbang
				where congnghemanhinh = @congnghemanhinh
				and kichthuoc = @kichthuoc
				and chuanmanhinh = @chuanmanhinh
				and dophangiai = @dophangiai
				and maumanhinh = @maumanhinh
				and chatlieumatkinh = @chatlieumatkinh)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into manhinhmaytinhbang(mamanhinh,congnghemanhinh,kichthuoc,chuanmanhinh,dophangiai,maumanhinh,chatlieumatkinh)
		values(@mamanhinh,@congnghemanhinh,@kichthuoc,@chuanmanhinh,@dophangiai,@maumanhinh,@chatlieumatkinh)
	end
go

create table dohoamaytinhbang
(
	madohoa varchar(15) primary key,
	tengpu varchar(15) null,
	sonhangpu varchar(2)
)

create procedure check_dohoamaytinhbang
	@madohoa varchar(15),
	@tengpu varchar(15),
	@sonhangpu varchar(2)
as
	if exists (select * from dohoamaytinhbang
				where tengpu = @tengpu
				and sonhangpu = @sonhangpu)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into dohoamaytinhbang(madohoa,tengpu,sonhangpu)
		values(@madohoa,@tengpu,@sonhangpu)
	end
go

create table rammaytinhbang
(
	maram varchar(15) primary key,
	dungluongram varchar(5),
	loairam varchar(15) null
)

create procedure check_rammaytinhbang
	@maram varchar(15),
	@dungluongram varchar(5),
	@loairam varchar(15)
as
	if exists (select * from rammaytinhbang
				where dungluongram = @dungluongram
				and loairam = @loairam)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into rammaytinhbang(maram,dungluongram,loairam)
		values(@maram,@dungluongram,@loairam)
	end
go

create table maytinhbanghinhanh
(
	stt int identity(1,1) primary key,
	mamaytinhbang varchar(25) not null,
	hinhanh nvarchar(255) null
)

create table bonhomaytinhbang
(
	mabonho varchar(25) primary key,
	dungluongbonho varchar(5),
	thenhongoai nvarchar(5) null,
	hotrothenhotoida nvarchar(5) null
)

create procedure check_bonhomaytinhbang
	@mabonho varchar(25),
	@dungluongbonho varchar(5),
	@thenhongoai nvarchar(5),
	@hotrothenhotoida nvarchar(5)
as
	if exists (select * from bonhomaytinhbang
				where dungluongbonho = @dungluongbonho
				and thenhongoai = @thenhongoai
				and hotrothenhotoida = @hotrothenhotoida)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into bonhomaytinhbang(mabonho,dungluongbonho,thenhongoai,hotrothenhotoida)
		values(@mabonho,@dungluongbonho,@thenhongoai,@hotrothenhotoida)
	end
go

create table cameramaytinhbang
(
	macamera varchar(25) primary key,
	loaicamera varchar(25) null,
	dophangiai varchar(10) null
)

create procedure check_cameramaytinhbang
	@macamera varchar(25),
	@loaicamera varchar(25),
	@dophangiai varchar(10)
as
	if exists (select * from cameramaytinhbang
				where loaicamera = @loaicamera
				and dophangiai = @dophangiai)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into cameramaytinhbang(macamera,loaicamera,dophangiai)
		values(@macamera,@loaicamera,@dophangiai)
	end
go

create table giaotieketnoimaytinhbang
(
	magiaotiep varchar(25) primary key,
	sokhesim varchar(1),
	loaisim varchar(20) null,
	hotro4g nvarchar(5) null,
	hotro5g nvarchar(5) null,
	wifi varchar(15) null,
	bluetooth varchar(15) null,
	congsac varchar(15) null,
	jack varchar(15) null
)

create procedure check_giaotieketnoimaytinhbang
	@magiaotiep varchar(25),
	@sokhesim varchar(1),
	@loaisim varchar(20),
	@hotro4g nvarchar(5),
	@hotro5g nvarchar(5),
	@wifi varchar(15),
	@bluetooth varchar(15),
	@congsac varchar(15),
	@jack varchar(15)
as
	if exists (select * from giaotieketnoimaytinhbang
				where sokhesim = @sokhesim
				and loaisim = @loaisim
				and hotro4g = @hotro4g
				and hotro5g = @hotro5g
				and wifi = @wifi
				and bluetooth = @bluetooth
				and congsac = @congsac
				and jack = @jack)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into giaotieketnoimaytinhbang(magiaotiep,sokhesim,loaisim,hotro4g,hotro5g,wifi,bluetooth,congsac,jack)
		values(@magiaotiep,@sokhesim,@loaisim,@hotro4g,@hotro5g,@wifi,@bluetooth,@congsac,@jack)
	end
go

create table pinmaytinhbang
(
	mapin varchar(25) primary key,
	dungluongpin varchar(20) null,
	loaipin varchar(20) null,
	congnghepin varchar(20) null
)

create procedure check_pinmaytinhbang
	@mapin varchar(25),
	@dungluongpin varchar(20),
	@loaipin varchar(20),
	@congnghepin varchar(20)
as
	if exists (select * from pinmaytinhbang
				where dungluongpin = @dungluongpin
				and loaipin = @loaipin
				and congnghepin = @congnghepin)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into pinmaytinhbang(mapin,dungluongpin,loaipin,congnghepin)
		values(@mapin,@dungluongpin,@loaipin,@congnghepin)
	end
go

create table hedieuhanhmaytinhbang
(
	phienbanhedieuhanh varchar(15) primary key,
	kieu varchar(2) not null
)

create procedure check_hedieuhanhmaytinhbang
	@phienbanhedieuhanh varchar(15),
	@kieu varchar(2)
as
	if exists (select * from hedieuhanhmaytinhbang
				where phienbanhedieuhanh = @phienbanhedieuhanh
				and kieu = @kieu)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into hedieuhanhmaytinhbang(phienbanhedieuhanh,kieu)
		values(@phienbanhedieuhanh,@kieu)
	end
go

create table dienthoaichitiet
(
	mamaytinhbang varchar(25) primary key,
	machatlieu varchar(25) not null,
	macpu varchar(15) not null,
	mamanhinh varchar(15) not null,
	madohoa varchar(15) not null,
	maram varchar(15) not null,
	mabonho varchar(25) not null,
	macamera varchar(25) not null,
	magiaotiep varchar(25) not null,
	mapin varchar(25),
	phienbanhedieuhanh varchar(15) not null
)
