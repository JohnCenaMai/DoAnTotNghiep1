create table dienthoai
(
	madienthoai varchar(25) primary key,
	tensanpham varchar(60) not null,
	xuatxu varchar(20) not null,
	thoigianbaohanh varchar(2),
	chieurong varchar(5),
	chieucao varchar(5),
	chieusau varchar(5),
	namramat varchar(4) not null,
	trongluong varchar(5),
	soluong int,
	gia varchar(8),
	hinhanh nvarchar(255) null
)

create procedure check_dienthoai
	@madienthoai varchar(25),
	@tensanpham varchar(60),
	@xuatxu varchar(20),
	@thoigianbaohanh varchar(2),
	@chieurong varchar(5),
	@chieucao varchar(5),
	@chieusau varchar(5),
	@namramat varchar(4),
	@trongluong varchar(5),
	@soluong int,
	@gia varchar(8),
	@hinhanh nvarchar(255) null
as
	if exists (select * from dienthoai
				where tensanpham = @tensanpham
				and xuatxu = @xuatxu
				and thoigianbaohanh = @thoigianbaohanh
				and chieurong = @chieurong
				and chieucao = @chieucao
				and chieusau = @chieusau
				and namramat = @namramat
				and trongluong = @trongluong)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into dienthoai(madienthoai,tensanpham,xuatxu,thoigianbaohanh,chieurong,chieucao,chieusau,namramat,trongluong,soluong,gia,hinhanh)
		values(@madienthoai,@tensanpham,@xuatxu,@thoigianbaohanh,@chieurong,@chieucao,@chieusau,@namramat,@trongluong,@soluong,@gia,@hinhanh)
	end
go

create table chatlieudienthoai
(
	machatlieu varchar(25) primary key,
	tenchatlieu nvarchar(30) null
)

create procedure check_chatlieudienthoai
	@machatlieu varchar(25),
	@tenchatlieu nvarchar(30)
as
	if exists (select * from chatlieudienthoai
				where tenchatlieu = @tenchatlieu)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into chatlieudienthoai(machatlieu,tenchatlieu)
		values(@machatlieu,@tenchatlieu)
	end
go

create table boxulydienthoai
(
	macpu varchar(15) primary key,
	chitietcpu varchar(60) null,
	loai varchar(15) null,
	sonhancpu varchar(5),
	tocdotoida varchar(5),
	phienban varchar(10) null
)

create procedure check_boxulydienthoai
	@macpu varchar(15),
	@chitietcpu varchar(60),
	@loai varchar(15),
	@sonhancpu varchar(5),
	@tocdotoida varchar(5),
	@phienban varchar(10)
as
	if exists (select * from boxulydienthoai
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
		insert into boxulydienthoai(macpu,chitietcpu,loai,sonhancpu,tocdotoida,phienban)
		values(@macpu,@chitietcpu,@loai,@sonhancpu,@tocdotoida,@phienban)
	end
go

create table manhinhdienthoai
(
	mamanhinh varchar(15) primary key,
	congnghemanhinh varchar(20) null,
	kichthuoc varchar(5) null,
	chuanmanhinh varchar(20) null,
	dophangiai varchar(15) null,
	maumanhinh nvarchar(15) null,
	chatlieumatkinh nvarchar(20) null
)

create procedure check_manhinhdienthoai
	@mamanhinh varchar(15),
	@congnghemanhinh varchar(20),
	@kichthuoc varchar(5),
	@chuanmanhinh varchar(20),
	@dophangiai varchar(15),
	@maumanhinh nvarchar(15),
	@chatlieumatkinh nvarchar(20)
as
	if exists (select * from manhinhdienthoai
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
		insert into manhinhdienthoai(mamanhinh,congnghemanhinh,kichthuoc,chuanmanhinh,dophangiai,maumanhinh,chatlieumatkinh)
		values(@mamanhinh,@congnghemanhinh,@kichthuoc,@chuanmanhinh,@dophangiai,@maumanhinh,@chatlieumatkinh)
	end
go

create table dohoadienthoai
(
	madohoa varchar(15) primary key,
	tengpu varchar(15) null,
	sonhangpu varchar(2)
)

create procedure check_dohoadienthoai
	@madohoa varchar(15),
	@tengpu varchar(15),
	@sonhangpu varchar(2)
as
	if exists (select * from dohoadienthoai
				where tengpu = @tengpu
				and sonhangpu = @sonhangpu)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into dohoadienthoai(madohoa,tengpu,sonhangpu)
		values(@madohoa,@tengpu,@sonhangpu)
	end
go

create table ramdienthoai
(
	maram varchar(15) primary key,
	dungluongram varchar(5),
	loairam varchar(15) null
)

create procedure check_ramdienthoai
	@maram varchar(15),
	@dungluongram varchar(5),
	@loairam varchar(15)
as
	if exists (select * from ramdienthoai
				where dungluongram = @dungluongram
				and loairam = @loairam)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into ramdienthoai(maram,dungluongram,loairam)
		values(@maram,@dungluongram,@loairam)
	end
go

create table dienthoaihinhanh
(
	stt int identity(1,1) primary key,
	madienthoai varchar(25) not null,
	hinhanh nvarchar(255) null
)

create table bonhodienthoai
(
	mabonho varchar(25) primary key,
	dungluongbonho varchar(5),
	thenhongoai nvarchar(5) null,
	hotrothenhotoida nvarchar(5) null
)

create procedure check_bonhodienthoai
	@mabonho varchar(25),
	@dungluongbonho varchar(5),
	@thenhongoai nvarchar(5),
	@hotrothenhotoida nvarchar(5)
as
	if exists (select * from bonhodienthoai
				where dungluongbonho = @dungluongbonho
				and thenhongoai = @thenhongoai
				and hotrothenhotoida = @hotrothenhotoida)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into bonhodienthoai(mabonho,dungluongbonho,thenhongoai,hotrothenhotoida)
		values(@mabonho,@dungluongbonho,@thenhongoai,@hotrothenhotoida)
	end
go

create table cameradienthoai
(
	macamera varchar(25) primary key,
	loaicamera varchar(25) null,
	dophangiai varchar(10) null
)

create procedure check_cameradienthoai
	@macamera varchar(25),
	@loaicamera varchar(25),
	@dophangiai varchar(10)
as
	if exists (select * from cameradienthoai
				where loaicamera = @loaicamera
				and dophangiai = @dophangiai)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into cameradienthoai(macamera,loaicamera,dophangiai)
		values(@macamera,@loaicamera,@dophangiai)
	end
go

create table giaotieketnoidienthoai
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

create procedure check_giaotieketnoidienthoai
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
	if exists (select * from giaotieketnoidienthoai
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
		insert into giaotieketnoidienthoai(magiaotiep,sokhesim,loaisim,hotro4g,hotro5g,wifi,bluetooth,congsac,jack)
		values(@magiaotiep,@sokhesim,@loaisim,@hotro4g,@hotro5g,@wifi,@bluetooth,@congsac,@jack)
	end
go

create table pindienthoai
(
	mapin varchar(25) primary key,
	dungluongpin varchar(20) null,
	loaipin varchar(20) null,
	congnghepin varchar(20) null
)

create procedure check_pindienthoai
	@mapin varchar(25),
	@dungluongpin varchar(20),
	@loaipin varchar(20),
	@congnghepin varchar(20)
as
	if exists (select * from pindienthoai
				where dungluongpin = @dungluongpin
				and loaipin = @loaipin
				and congnghepin = @congnghepin)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into pindienthoai(mapin,dungluongpin,loaipin,congnghepin)
		values(@mapin,@dungluongpin,@loaipin,@congnghepin)
	end
go

create table hedieuhanhdienthoai
(
	phienbanhedieuhanh varchar(15) primary key,
	kieu varchar(2) not null
)

create procedure check_hedieuhanhdienthoai
	@phienbanhedieuhanh varchar(15),
	@kieu varchar(2)
as
	if exists (select * from hedieuhanhdienthoai
				where phienbanhedieuhanh = @phienbanhedieuhanh
				and kieu = @kieu)
	begin
		print 'da co trong co so du lieu'	
	end
	else
	begin
		insert into hedieuhanhdienthoai(phienbanhedieuhanh,kieu)
		values(@phienbanhedieuhanh,@kieu)
	end
go

create table dienthoaichitiet
(
	madienthoai varchar(25) primary key,
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

--insert
exec check_dienthoai @madienthoai = 'dt_01',
	@tensanpham = 'iPhone 11 64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '75.7',
	@chieucao = '150.9',
	@chieusau = '8.3',
	@namramat = '2019',
	@trongluong = '194',
	@soluong = 19,
	@gia = '725',
	@hinhanh = N'\Điện thoại\Apple\iPhone 11 64GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_02',
	@tensanpham = 'iPhone 12 64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '71.5',
	@chieucao = '146.7',
	@chieusau = '7.4',
	@namramat = '2020',
	@trongluong = '164',
	@soluong = 29,
	@gia = '1000',
	@hinhanh = N'\Điện thoại\Apple\iPhone 12 64GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_03',
	@tensanpham = 'iPhone 12 Mini 64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '64.2',
	@chieucao = '131.5',
	@chieusau = '7.4',
	@namramat = '2020',
	@trongluong = '135',
	@soluong = 13,
	@gia = '847',
	@hinhanh = N'\Điện thoại\Apple\iPhone 12 Mini 64GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_04',
	@tensanpham = 'iPhone 12 Pro 128GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '71.5',
	@chieucao = '146.7',
	@chieusau = '7.4',
	@namramat = '2020',
	@trongluong = '135',
	@soluong = 23,
	@gia = '1347',
	@hinhanh = N'\Điện thoại\Apple\iPhone 12 Pro 128GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_05',
	@tensanpham = 'iPhone 12 Pro Max 128GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '78.1',
	@chieucao = '160.8',
	@chieusau = '7.4',
	@namramat = '2020',
	@trongluong = '228',
	@soluong = 27,
	@gia = '1477',
	@hinhanh = N'\Điện thoại\Apple\iPhone 12 Pro Max 128GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_06',
	@tensanpham = 'Nokia 2.4',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '78.1',
	@chieucao = '160.8',
	@chieusau = '7.4',
	@namramat = '2020',
	@trongluong = '189',
	@soluong = 27,
	@gia = '108',
	@hinhanh = N'\Điện thoại\Nokia\Nokia 2.4\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_07',
	@tensanpham = 'Nokia 3.2 3GB-32GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '76.2',
	@chieucao = '159.4',
	@chieusau = '8.6',
	@namramat = '2019',
	@trongluong = '178',
	@soluong = 27,
	@gia = '95',
	@hinhanh = N'\Điện thoại\Nokia\Nokia 3.2 3GB-32GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_08',
	@tensanpham = 'Nokia 3.4 4GB - 64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '76.0',
	@chieucao = '161.3',
	@chieusau = '8.7',
	@namramat = '2019',
	@trongluong = '180',
	@soluong = 37,
	@gia = '147',
	@hinhanh = N'\Điện thoại\Nokia\Nokia 3.4 4GB - 64GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_09',
	@tensanpham = 'Nokia 5.3 3GB - 64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '76.6',
	@chieucao = '164.3',
	@chieusau = '8.5',
	@namramat = '2019',
	@trongluong = '180',
	@soluong = 37,
	@gia = '126',
	@hinhanh = N'\Điện thoại\Nokia\Nokia 5.3 3GB - 64GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_10',
	@tensanpham = 'Nokia 8.3 5G',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '76.6',
	@chieucao = '164.3',
	@chieusau = '8.5',
	@namramat = '2019',
	@trongluong = '220',
	@soluong = 35,
	@gia = '521',
	@hinhanh = N'\Điện thoại\Nokia\Nokia 8.3 5G\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_11',
	@tensanpham = 'Oppo A52 6GB-128GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '75.5',
	@chieucao = '162',
	@chieusau = '8.9',
	@namramat = '2020',
	@trongluong = '192',
	@soluong = 35,
	@gia = '212',
	@hinhanh = N'\Điện thoại\Oppo\Oppo A52 6GB-128GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_12',
	@tensanpham = 'Oppo A53 4GB-128GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '75.1',
	@chieucao = '163.9',
	@chieusau = '8.4',
	@namramat = '2020',
	@trongluong = '186',
	@soluong = 32,
	@gia = '195',
	@hinhanh = N'\Điện thoại\Oppo\Oppo A53 4GB-128GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_13',
	@tensanpham = 'OPPO A93 8GB-128GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '73.8',
	@chieucao = '160.1',
	@chieusau = '7.5',
	@namramat = '2020',
	@trongluong = '164',
	@soluong = 42,
	@gia = '325',
	@hinhanh = N'\Điện thoại\Oppo\OPPO A93 8GB-128GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_14',
	@tensanpham = 'OPPO Reno4',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '73.9',
	@chieucao = '160.3',
	@chieusau = '7.7',
	@namramat = '2020',
	@trongluong = '165',
	@soluong = 12,
	@gia = '335',
	@hinhanh = N'\Điện thoại\Oppo\OPPO Reno4\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_15',
	@tensanpham = 'Oppo Reno4 Pro',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '73.2',
	@chieucao = '160.2',
	@chieusau = '7.7',
	@namramat = '2020',
	@trongluong = '161',
	@soluong = 13,
	@gia = '521',
	@hinhanh = N'\Điện thoại\Oppo\Oppo Reno4 Pro\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_16',
	@tensanpham = 'Samsung Galaxy Note 20',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '75.2',
	@chieucao = '161.6',
	@chieusau = '8.3',
	@namramat = '2020',
	@trongluong = '192',
	@soluong = 43,
	@gia = '912',
	@hinhanh = N'\Điện thoại\Samsung\Samsung Galaxy Note 20\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_17',
	@tensanpham = 'Samsung Galaxy Note 20 Ultra',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '77.2',
	@chieucao = '164.8',
	@chieusau = '8.1',
	@namramat = '2020',
	@trongluong = '208',
	@soluong = 43,
	@gia = '1173',
	@hinhanh = N'\Điện thoại\Samsung\Samsung Galaxy Note 20 Ultra\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_18',
	@tensanpham = 'Samsung Galaxy Note 20 Ultra 5G',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '77.2',
	@chieucao = '164.8',
	@chieusau = '8.2',
	@namramat = '2020',
	@trongluong = '208',
	@soluong = 43,
	@gia = '1300',
	@hinhanh = N'\Điện thoại\Samsung\Samsung Galaxy Note 20 Ultra 5G\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_19',
	@tensanpham = 'Samsung Galaxy S20+',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '73.7',
	@chieucao = '161.9',
	@chieusau = '7.8',
	@namramat = '2020',
	@trongluong = '208',
	@soluong = 30,
	@gia = '782',
	@hinhanh = N'\Điện thoại\Samsung\Samsung Galaxy S20+\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_20',
	@tensanpham = 'Samsung Galaxy Z Fold2 5G',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '128.2',
	@chieucao = '159.2',
	@chieusau = '16.8',
	@namramat = '2020',
	@trongluong = '282',
	@soluong = 50,
	@gia = '2175',
	@hinhanh = N'\Điện thoại\Samsung\Samsung Galaxy Z Fold2 5G\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_21',
	@tensanpham = 'Vsmart Active 3 6GB-64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '75.7',
	@chieucao = '166.2',
	@chieusau = '8.9',
	@namramat = '2020',
	@trongluong = '183',
	@soluong = 50,
	@gia = '175',
	@hinhanh = N'\Điện thoại\Vsmart\Vsmart Active 3 6GB-64GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_22',
	@tensanpham = 'Vsmart Aris 8GB-128GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '18',
	@chieurong = '75.7',
	@chieucao = '166.2',
	@chieusau = '8.9',
	@namramat = '2020',
	@trongluong = '178',
	@soluong = 50,
	@gia = '325',
	@hinhanh = N'\Điện thoại\Vsmart\Vsmart Aris 8GB-128GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_23',
	@tensanpham = 'Vsmart Aris Pro 8GB-128GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '12',
	@chieurong = '73.2',
	@chieucao = '154.2',
	@chieusau = '8.1',
	@namramat = '2020',
	@trongluong = '167',
	@soluong = 50,
	@gia = '435',
	@hinhanh = N'\Điện thoại\Vsmart\Vsmart Aris Pro 8GB-128GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_24',
	@tensanpham = 'Vsmart Joy 4 3GB-64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '18',
	@chieurong = '77.65',
	@chieucao = '163.65',
	@chieusau = '9.1',
	@namramat = '2020',
	@trongluong = '167',
	@soluong = 10,
	@gia = '143',
	@hinhanh = N'\Điện thoại\Vsmart\Vsmart Joy 4 3GB-64GB\anh1.PNG'

exec check_dienthoai @madienthoai = 'dt_25',
	@tensanpham = 'Vsmart Live 4 6GB-64GB',
	@xuatxu = 'china',
	@thoigianbaohanh = '18',
	@chieurong = '76.5',
	@chieucao = '162.4',
	@chieusau = '8.9',
	@namramat = '2020',
	@trongluong = '217',
	@soluong = 16,
	@gia = '199',
	@hinhanh = N'\Điện thoại\Vsmart\Vsmart Live 4 6GB-64GB\anh1.PNG'

--chat lieu dien thoai
--1,2,3
exec check_chatlieudienthoai @machatlieu = 'chatlieu_01',
	@tenchatlieu = N'Viền nhôm, mặt lưng kính'

--4,5,6
exec check_chatlieudienthoai @machatlieu = 'chatlieu_04',
	@tenchatlieu = N'Viền thép, mặt lưng kính mờ'

--7,8,11,16,21,24,25
exec check_chatlieudienthoai @machatlieu = 'chatlieu_07',
	@tenchatlieu = N'Khung và mặt lưng nhựa'
--9
exec check_chatlieudienthoai @machatlieu = 'chatlieu_09',
	@tenchatlieu = N'Nhựa'
--10,19
exec check_chatlieudienthoai @machatlieu = 'chatlieu_10',
	@tenchatlieu = N'Khung kim loại và Mặt lưng kính cường lực'
--12
exec check_chatlieudienthoai @machatlieu = 'chatlieu_12',
	@tenchatlieu = N'Khung hợp kim nhôm và Mặt lưng nhựa'
--13,14,15
exec check_chatlieudienthoai @machatlieu = 'chatlieu_13',
	@tenchatlieu = N'Khung hợp kim phủ nhựa và Mặt lưng thuỷ tinh hữu cơ'
--17,18,20
exec check_chatlieudienthoai @machatlieu = 'chatlieu_17',
	@tenchatlieu = N'Khung nhôm và Mặt lưng kính cường lực'
--22,23
exec check_chatlieudienthoai @machatlieu = 'chatlieu_22',
	@tenchatlieu = N'Khung kim loại và mặt lưng kính'

-- bo xu ly
--1,
exec check_boxulydienthoai @macpu = 'cpu_01',
	@chitietcpu = N'2 x Thunder 2.65 GHz + 4 x Lightning 1.8 GHz',
	@loai = 'Hexa-Core',
	@sonhancpu = '6',
	@tocdotoida = '2.65',
	@phienban = 'A13 Bionic'
--2,3,4,5
exec check_boxulydienthoai @macpu = 'cpu_02',
	@chitietcpu = N'2 x Firestorm 3.1 GHz + 4 x Icestorm 1.8 GHz',
	@loai = 'Hexa-Core',
	@sonhancpu = '6',
	@tocdotoida = '3.1',
	@phienban = 'A14 Bionic'
--6
exec check_boxulydienthoai @macpu = 'cpu_06',
	@chitietcpu = N'2 x Firestorm 3.1 GHz + 4 x Icestorm 1.8 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '6',
	@tocdotoida = '2.0',
	@phienban = 'Helio P22'
--7
exec check_boxulydienthoai @macpu = 'cpu_07',
	@chitietcpu = N'4 x Cortex A53 1.8 GHz',
	@loai = 'Quad-Core',
	@sonhancpu = '4',
	@tocdotoida = '1.8',
	@phienban = 'Helio P22'
--8
exec check_boxulydienthoai @macpu = 'cpu_08',
	@chitietcpu = N'4 x Cortex A53 1.8 GHz + 4 x Cortex A53 1.8 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.0',
	@phienban = 'Snapdragon 460'
--9,11
exec check_boxulydienthoai @macpu = 'cpu_09',
	@chitietcpu = N'4 x Kryo 260 2.20 GHz + 4 x Kryo 260 1.80 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.0',
	@phienban = 'Snapdragon 665'
--10
exec check_boxulydienthoai @macpu = 'cpu_10',
	@chitietcpu = N'4 x Kryo 260 2.20 GHz + 4 x Kryo 260 1.80 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.4',
	@phienban = 'Snapdragon 765G'
--12
exec check_boxulydienthoai @macpu = 'cpu_12',
	@chitietcpu = N'4 x Kryo 240 1.8 GHz + 4 x Kryo 240 1.6 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '1.8',
	@phienban = 'Snapdragon 460'
--13
exec check_boxulydienthoai @macpu = 'cpu_13',
	@chitietcpu = N'2 x Cortex A75 2.2 GHz + 6 x Cortex A55 2.0 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.2',
	@phienban = 'Mediatek Helio P95'
--14,15
exec check_boxulydienthoai @macpu = 'cpu_14',
	@chitietcpu = N'2 x Kryo 465 2.3 GHz + 6 x Kryo 465 1.8 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.3',
	@phienban = 'Snapdragon 720G'
--16,17,18,19
exec check_boxulydienthoai @macpu = 'cpu_16',
	@chitietcpu = N'2 x Exynos M5 2.73 GHz + 2 x Cortex A76 2.5 GHz + 4 x Cortex A55 2.0 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.73',
	@phienban = 'Exynos 990'
--20
exec check_boxulydienthoai @macpu = 'cpu_20',
	@chitietcpu = N'1 x Kryo 585 3.09 GHz + 3 x Kryo 585 2.42 GHz + 4 x Kryo 585 1.8 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.73',
	@phienban = 'Snapdragon 865+'
--21,22,23,24
exec check_boxulydienthoai @macpu = 'cpu_21',
	@chitietcpu = N'4 x Cortex-A73 + 4 x Cortex-A53',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.0',
	@phienban = 'Helio P60'
--25
exec check_boxulydienthoai @macpu = 'cpu_25',
	@chitietcpu = N'2 x Cortex-A76 2.20 GHz + 6 x Cortex-A55 1.70 GHz',
	@loai = 'Octa-Core',
	@sonhancpu = '8',
	@tocdotoida = '2.2',
	@phienban = 'Snapdragon 675'

--man hinh
--1
exec check_manhinhdienthoai @mamanhinh = 'manhinh_01',
	@congnghemanhinh = 'IPS LCD',
	@kichthuoc = '6.1',
	@chuanmanhinh = 'Liquid Retina HD',
	@dophangiai = '828 x 1792',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Kính Cường Lực'
--2,4
exec check_manhinhdienthoai @mamanhinh = 'manhinh_02',
	@congnghemanhinh = 'AMOLED',
	@kichthuoc = '6.1',
	@chuanmanhinh = 'Super Retina XDR',
	@dophangiai = '828 x 1792',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Phủ Ceramic'
--3
exec check_manhinhdienthoai @mamanhinh = 'manhinh_03',
	@congnghemanhinh = 'AMOLED',
	@kichthuoc = '5.4',
	@chuanmanhinh = 'Super Retina XDR',
	@dophangiai = '1080 x 2340',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Phủ Ceramic'
--5
exec check_manhinhdienthoai @mamanhinh = 'manhinh_05',
	@congnghemanhinh = 'AMOLED',
	@kichthuoc = '6.7',
	@chuanmanhinh = 'Super Retina XDR',
	@dophangiai = '1080 x 2340',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Phủ Ceramic'
--6
exec check_manhinhdienthoai @mamanhinh = 'manhinh_06',
	@congnghemanhinh = 'IPS LCD',
	@kichthuoc = '6.5',
	@chuanmanhinh = 'Super Retina XDR',
	@dophangiai = '720 x 1600',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Phủ Ceramic'
--7
exec check_manhinhdienthoai @mamanhinh = 'manhinh_07',
	@congnghemanhinh = 'IPS LCD',
	@kichthuoc = '6.26',
	@chuanmanhinh = 'HD+',
	@dophangiai = '720 x 1520',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Kính cường lực'
--8,9
exec check_manhinhdienthoai @mamanhinh = 'manhinh_08',
	@congnghemanhinh = 'IPS LCD',
	@kichthuoc = '6.39',
	@chuanmanhinh = 'HD+',
	@dophangiai = '720 x 1520',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Kính cường lực'
--10
exec check_manhinhdienthoai @mamanhinh = 'manhinh_10',
	@congnghemanhinh = 'IPS LCD',
	@kichthuoc = '6.8',
	@chuanmanhinh = 'FHD+',
	@dophangiai = '1080 x 2400',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Kính cường lực'
--11
exec check_manhinhdienthoai @mamanhinh = 'manhinh_11',
	@congnghemanhinh = 'TFT LCD',
	@kichthuoc = '6.5',
	@chuanmanhinh = 'FHD+',
	@dophangiai = '1080 x 2400',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 3'
--12
exec check_manhinhdienthoai @mamanhinh = 'manhinh_12',
	@congnghemanhinh = 'IPS LCD',
	@kichthuoc = '6.5',
	@chuanmanhinh = 'HD+',
	@dophangiai = '720 x 1600',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 3'
--13
exec check_manhinhdienthoai @mamanhinh = 'manhinh_13',
	@congnghemanhinh = 'AMOLED',
	@kichthuoc = '6.43',
	@chuanmanhinh = 'FHD+',
	@dophangiai = '1080 x 2400',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 3'
--14
exec check_manhinhdienthoai @mamanhinh = 'manhinh_14',
	@congnghemanhinh = 'AMOLED',
	@kichthuoc = '6.4',
	@chuanmanhinh = 'FHD+',
	@dophangiai = '1080 x 2400',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 3+'
--15
exec check_manhinhdienthoai @mamanhinh = 'manhinh_15',
	@congnghemanhinh = 'AMOLED',
	@kichthuoc = '6.5',
	@chuanmanhinh = 'FHD+',
	@dophangiai = '1080 x 2400',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 5'
--16
exec check_manhinhdienthoai @mamanhinh = 'manhinh_16',
	@congnghemanhinh = 'Super AMOLED Plus',
	@kichthuoc = '6.7',
	@chuanmanhinh = 'FHD+',
	@dophangiai = '1080 x 2400',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 5'
--17,18
exec check_manhinhdienthoai @mamanhinh = 'manhinh_17',
	@congnghemanhinh = 'Dynamic AMOLED 2X',
	@kichthuoc = '6.9',
	@chuanmanhinh = '2K+',
	@dophangiai = '1440 x 3088',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass Victus'
--19
exec check_manhinhdienthoai @mamanhinh = 'manhinh_19',
	@congnghemanhinh = 'Dynamic AMOLED 2X',
	@kichthuoc = '6.7',
	@chuanmanhinh = 'QHD+',
	@dophangiai = '1440 x 3200',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 6'
--20,21,22,23
exec check_manhinhdienthoai @mamanhinh = 'manhinh_20',
	@congnghemanhinh = 'Dynamic AMOLED 2X',
	@kichthuoc = '6.2',
	@chuanmanhinh = 'QHD+',
	@dophangiai = '1768 x 2208',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass Victus'
--24,25
exec check_manhinhdienthoai @mamanhinh = 'manhinh_24',
	@congnghemanhinh = 'TFT LCD',
	@kichthuoc = '6.53',
	@chuanmanhinh = 'FHD+',
	@dophangiai = '1080 x 2340',
	@maumanhinh = N'16 Triệu',
	@chatlieumatkinh = N'Gorilla Glass 3'

--he dieu hanh
exec check_hedieuhanhdienthoai @phienbanhedieuhanh = 'iOS 14',
	@kieu = '64 bit'

exec check_hedieuhanhdienthoai @phienbanhedieuhanh = 'Android 10.0',
	@kieu = '64 bit'

exec check_hedieuhanhdienthoai @phienbanhedieuhanh = 'Android 9.0',
	@kieu = '64 bit'

--do hoa
exec check_dohoadienthoai @madohoa = 'dohoa_01',
	@tengpu = 'Apple GPU',
	@sonhangpu = '4'

exec check_dohoadienthoai @madohoa = 'dohoa_02',
	@tengpu = 'PowerVR',
	@sonhangpu = '8'

exec check_dohoadienthoai @madohoa = 'dohoa_03',
	@tengpu = 'Adreno 504',
	@sonhangpu = '4'

exec check_dohoadienthoai @madohoa = 'dohoa_04',
	@tengpu = 'Adreno 610',
	@sonhangpu = '6'

exec check_dohoadienthoai @madohoa = 'dohoa_05',
	@tengpu = 'Adreno 620',
	@sonhangpu = '6'

--ram
--1,2,3,12
exec check_ramdienthoai @maram = 'ram_01',
	@dungluongram = '4 GB',
	@loairam = 'LPDDR4X'
--4,5,11
exec check_ramdienthoai @maram = 'ram_04',
	@dungluongram = '6 GB',
	@loairam = 'LPDDR4X'
--6
exec check_ramdienthoai @maram = 'ram_06',
	@dungluongram = '2 GB',
	@loairam = 'LPDDR4X'
--7,8
exec check_ramdienthoai @maram = 'ram_07',
	@dungluongram = '3 GB',
	@loairam = 'LPDDR3'
--9
exec check_ramdienthoai @maram = 'ram_09',
	@dungluongram = '3 GB',
	@loairam = 'LPDDR4X'
--10,13,14,15,21,22
exec check_ramdienthoai @maram = 'ram_10',
	@dungluongram = '8 GB',
	@loairam = 'LPDDR4X'
--16,17,19,23
exec check_ramdienthoai @maram = 'ram_16',
	@dungluongram = '8 GB',
	@loairam = 'LPDDR5'
--18,20,24,25
exec check_ramdienthoai @maram = 'ram_18',
	@dungluongram = '12 GB',
	@loairam = 'LPDDR5'

-- hinh anh dien thoai

insert into dienthoaihinhanh(madienthoai,hinhanh)




values('dt_01',N'/Điện thoại/Apple/iPhone 11 64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_02',N'/Điện thoại/Apple/iPhone 12 64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_03',N'/Điện thoại/Apple/iPhone 12 Mini 64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_04',N'/Điện thoại/Apple/iPhone 12 Pro 128GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_05',N'/Điện thoại/Apple/iPhone 12 Pro Max 128GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_06',N'/Điện thoại/Nokia/Nokia 2.4/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_06',N'/Điện thoại/Nokia/Nokia 2.4/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_06',N'/Điện thoại/Nokia/Nokia 2.4/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_07',N'/Điện thoại/Nokia/Nokia 3.2 3GB-32GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_07',N'/Điện thoại/Nokia/Nokia 3.2 3GB-32GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_07',N'/Điện thoại/Nokia/Nokia 3.2 3GB-32GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_08',N'/Điện thoại/Nokia/Nokia 3.4 4GB - 64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_08',N'/Điện thoại/Nokia/Nokia 3.4 4GB - 64GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_08',N'/Điện thoại/Nokia/Nokia 3.4 4GB - 64GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_09',N'/Điện thoại/Nokia/Nokia 5.3 3GB - 64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_09',N'/Điện thoại/Nokia/Nokia 5.3 3GB - 64GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_09',N'/Điện thoại/Nokia/Nokia 5.3 3GB - 64GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_10',N'/Điện thoại/Nokia/Nokia 8.3 5G/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_10',N'/Điện thoại/Nokia/Nokia 8.3 5G/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_10',N'/Điện thoại/Nokia/Nokia 8.3 5G/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_11',N'/Điện thoại/Oppo/Oppo A52 6GB-128GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_11',N'/Điện thoại/Oppo/Oppo A52 6GB-128GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_11',N'/Điện thoại/Oppo/Oppo A52 6GB-128GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_12',N'/Điện thoại/Oppo/Oppo A53 4GB-128GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_12',N'/Điện thoại/Oppo/Oppo A53 4GB-128GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_12',N'/Điện thoại/Oppo/Oppo A53 4GB-128GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_13',N'/Điện thoại/Oppo/OPPO A93 8GB-128GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_13',N'/Điện thoại/Oppo/OPPO A93 8GB-128GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_13',N'/Điện thoại/Oppo/OPPO A93 8GB-128GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_14',N'/Điện thoại/Oppo/OPPO Reno4/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_14',N'/Điện thoại/Oppo/OPPO Reno4/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_14',N'/Điện thoại/Oppo/OPPO Reno4/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_15',N'/Điện thoại/Oppo/Oppo Reno4 Pro/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_15',N'/Điện thoại/Oppo/Oppo Reno4 Pro/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_15',N'/Điện thoại/Oppo/Oppo Reno4 Pro/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_16',N'/Điện thoại/Samsung/Samsung Galaxy Note 20/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_16',N'/Điện thoại/Samsung/Samsung Galaxy Note 20/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_16',N'/Điện thoại/Samsung/Samsung Galaxy Note 20/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_17',N'/Điện thoại/Samsung/Samsung Galaxy Note 20 Ultra/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_17',N'/Điện thoại/Samsung/Samsung Galaxy Note 20 Ultra/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_17',N'/Điện thoại/Samsung/Samsung Galaxy Note 20 Ultra/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_18',N'/Điện thoại/Samsung/Samsung Galaxy Note 20 Ultra 5G/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_18',N'/Điện thoại/Samsung/Samsung Galaxy Note 20 Ultra 5G/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_18',N'/Điện thoại/Samsung/Samsung Galaxy Note 20 Ultra 5G/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_19',N'/Điện thoại/Samsung/Samsung Galaxy S20+/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_19',N'/Điện thoại/Samsung/Samsung Galaxy S20+/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_19',N'/Điện thoại/Samsung/Samsung Galaxy S20+/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_20',N'/Điện thoại/Samsung/Samsung Galaxy Z Fold2 5G/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_20',N'/Điện thoại/Samsung/Samsung Galaxy Z Fold2 5G/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_20',N'/Điện thoại/Samsung/Samsung Galaxy Z Fold2 5G/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_21',N'/Điện thoại/Vsmart/Vsmart Active 3 6GB-64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_21',N'/Điện thoại/Vsmart/Vsmart Active 3 6GB-64GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_21',N'/Điện thoại/Vsmart/Vsmart Active 3 6GB-64GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_22',N'/Điện thoại/Vsmart/Vsmart Aris 8GB-128GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_22',N'/Điện thoại/Vsmart/Vsmart Aris 8GB-128GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_22',N'/Điện thoại/Vsmart/Vsmart Aris 8GB-128GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_23',N'/Điện thoại/Vsmart/Vsmart Aris Pro 8GB-128GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_23',N'/Điện thoại/Vsmart/Vsmart Aris Pro 8GB-128GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_23',N'/Điện thoại/Vsmart/Vsmart Aris Pro 8GB-128GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_24',N'/Điện thoại/Vsmart/Vsmart Joy 4 3GB-64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_24',N'/Điện thoại/Vsmart/Vsmart Joy 4 3GB-64GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_24',N'/Điện thoại/Vsmart/Vsmart Joy 4 3GB-64GB/anh3.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_25',N'/Điện thoại/Vsmart/Vsmart Live 4 6GB-64GB/anh1.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_25',N'/Điện thoại/Vsmart/Vsmart Live 4 6GB-64GB/anh2.PNG')







insert into dienthoaihinhanh(madienthoai,hinhanh)


values('dt_25',N'/Điện thoại/Vsmart/Vsmart Live 4 6GB-64GB/anh3.PNG')



--bo nho dien thoai
--1,2,3,4,5
exec check_bonhodienthoai @mabonho = 'bonho_01',
	@dungluongbonho = '64',
	@thenhongoai = N'Không',
	@hotrothenhotoida = N'Không'
--6
exec check_bonhodienthoai @mabonho = 'bonho_06',
	@dungluongbonho = '32',
	@thenhongoai = N'MicroSD',
	@hotrothenhotoida = N'512'
--7
exec check_bonhodienthoai @mabonho = 'bonho_07',
	@dungluongbonho = '32',
	@thenhongoai = N'MicroSD',
	@hotrothenhotoida = N'400'
--8,9
exec check_bonhodienthoai @mabonho = 'bonho_08',
	@dungluongbonho = '64',
	@thenhongoai = N'MicroSD',
	@hotrothenhotoida = N'512'
--10
exec check_bonhodienthoai @mabonho = 'bonho_10',
	@dungluongbonho = '128',
	@thenhongoai = N'MicroSD',
	@hotrothenhotoida = N'400'
--11,12,13,14
exec check_bonhodienthoai @mabonho = 'bonho_11',
	@dungluongbonho = '128',
	@thenhongoai = N'MicroSD',
	@hotrothenhotoida = N'256'
--15
exec check_bonhodienthoai @mabonho = 'bonho_15',
	@dungluongbonho = '256',
	@thenhongoai = N'MicroSD',
	@hotrothenhotoida = N'256'
--16
exec check_bonhodienthoai @mabonho = 'bonho_11',
	@dungluongbonho = '256',
	@thenhongoai = N'Không',
	@hotrothenhotoida = N'Không'
--21,22,23,24,25
exec check_bonhodienthoai @mabonho = 'bonho_21',
	@dungluongbonho = '64',
	@thenhongoai = N'MicroSD',
	@hotrothenhotoida = N'256'

--camera
exec check_cameradienthoai @macamera = 'camera_01',
	@loaicamera = 'Double rear camera',
	@dophangiai = '12.0 MP'

exec check_cameradienthoai @macamera = 'camera_02',
	@loaicamera = 'Quad rear camera',
	@dophangiai = '12.0 MP'

exec check_cameradienthoai @macamera = 'camera_03',
	@loaicamera = 'Triple rear camera',
	@dophangiai = '13.0 MP'

exec check_cameradienthoai @macamera = 'camera_04',
	@loaicamera = 'Triple rear camera',
	@dophangiai = '108.0 MP'

exec check_cameradienthoai @macamera = 'camera_05',
	@loaicamera = 'Quad rear camera',
	@dophangiai = '16.0 MP'

--giao tiep ket noi
--1,2,3,4,5
exec check_giaotieketnoidienthoai @magiaotiep = 'giaotiep_01',
	@sokhesim = '2',
	@loaisim = '1 eSIM, 1 Nano SIM',
	@hotro4g = N'Hỗ trợ',
	@hotro5g = N'Không hỗ trợ',
	@wifi = '802.11ax',
	@bluetooth = 'v5.0',
	@congsac = 'Lightning',
	@jack = 'Lightning'
--6,7,8,9,10
exec check_giaotieketnoidienthoai @magiaotiep = 'giaotiep_06',
	@sokhesim = '2',
	@loaisim = '1 Nano SIM',
	@hotro4g = N'Hỗ trợ',
	@hotro5g = N'Không hỗ trợ',
	@wifi = '802.11 a/b/g/n, Wi-Fi hotspot',
	@bluetooth = 'v4.2',
	@congsac = 'MicroUSB',
	@jack = 'Jack 3.5 mm'
--11,12,13,14,15
exec check_giaotieketnoidienthoai @magiaotiep = 'giaotiep_10',
	@sokhesim = '2',
	@loaisim = '1 Nano SIM',
	@hotro4g = N'Hỗ trợ',
	@hotro5g = N'Không hỗ trợ',
	@wifi = 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot',
	@bluetooth = 'v5.0',
	@congsac = 'Type-C',
	@jack = 'Jack 3.5 mm'
--16,17,18,19,20
exec check_giaotieketnoidienthoai @magiaotiep = 'giaotiep_16',
	@sokhesim = '2',
	@loaisim = '2 Nano SIM hoặc 1 eSIM, 1 Nano SIM',
	@hotro4g = N'Hỗ trợ',
	@hotro5g = N'Không hỗ trợ',
	@wifi = 'Wi-Fi 802.11 a/b/g/n/ac, Dual-band, Wi-Fi Direct, Wi-Fi hotspot',
	@bluetooth = 'v5.0',
	@congsac = 'Type-C',
	@jack = 'Jack 3.5 mm'
--21,22,23,24,25
exec check_giaotieketnoidienthoai @magiaotiep = 'giaotiep_21',
	@sokhesim = '2',
	@loaisim = '2 Nano SIM hoặc 1 eSIM, 1 Nano SIM',
	@hotro4g = N'Hỗ trợ',
	@hotro5g = N'Không hỗ trợ',
	@wifi = '802.11 b/g/n/ac, Dual-band, Wi-Fi hotspot',
	@bluetooth = 'v4.1',
	@congsac = 'Type-C',
	@jack = 'Jack 3.5 mm'

--pin
--1
exec check_pindienthoai @mapin = 'pin_01',
	@dungluongpin = '3110 mAh',
	@loaipin = 'Lithium-ion',
	@congnghepin = ''
--2
exec check_pindienthoai @mapin = 'pin_02',
	@dungluongpin = '2815 mAh',
	@loaipin = 'Lithium-ion',
	@congnghepin = ''
--3,4
exec check_pindienthoai @mapin = 'pin_03',
	@dungluongpin = '2227 mAh',
	@loaipin = 'Lithium-ion',
	@congnghepin = ''
--5
exec check_pindienthoai @mapin = 'pin_05',
	@dungluongpin = '3687 mAh',
	@loaipin = 'Lithium-ion',
	@congnghepin = ''
--6
exec check_pindienthoai @mapin = 'pin_06',
	@dungluongpin = '4500 mAh',
	@loaipin = 'Lithium polymer',
	@congnghepin = ''
--7
exec check_pindienthoai @mapin = 'pin_07',
	@dungluongpin = '4000 mAh',
	@loaipin = 'Lithium lion',
	@congnghepin = ''
--11,12,13,14,15
exec check_pindienthoai @mapin = 'pin_11',
	@dungluongpin = '5000 mAh',
	@loaipin = 'Lithium polymer',
	@congnghepin = ''
--16,17,18,19,20
exec check_pindienthoai @mapin = 'pin_16',
	@dungluongpin = '4300 mAh',
	@loaipin = 'Lithium-ion',
	@congnghepin = N'Sạc siêu nhanh 25W, chia sẻ pin không dây'
--21,22,23,24,25
exec check_pindienthoai @mapin = 'pin_21',
	@dungluongpin = '4020 mAh',
	@loaipin = 'Lithium Polymer',
	@congnghepin = N'Sạc siêu nhanh 25W, chia sẻ pin không dây'
--chi tiet dien thoai
insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_01','chatlieu_01','cpu_01','manhinh_01','dohoa_01','ram_01','bonho_01','camera_01','giaotiep_01','pin_01','iOS 14')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_02','chatlieu_01','cpu_02','manhinh_02','dohoa_01','ram_01','bonho_01','camera_01','giaotiep_01','pin_02','iOS 14')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_03','chatlieu_01','cpu_02','manhinh_03','dohoa_01','ram_01','bonho_01','camera_01','giaotiep_01','pin_03','iOS 14')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_04','chatlieu_04','cpu_02','manhinh_02','dohoa_01','ram_04','bonho_01','camera_01','giaotiep_01','pin_03','iOS 14')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_05','chatlieu_04','cpu_02','manhinh_05','dohoa_01','ram_04','bonho_01','camera_01','giaotiep_01','pin_05','iOS 14')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_06','chatlieu_04','cpu_06','manhinh_06','dohoa_02','ram_06','bonho_06','camera_02','giaotiep_06','pin_06','iOS 14')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_07','chatlieu_07','cpu_07','manhinh_07','dohoa_02','ram_07','bonho_07','camera_02','giaotiep_06','pin_07','iOS 14')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_08','chatlieu_07','cpu_08','manhinh_08','dohoa_02','ram_07','bonho_08','camera_02','giaotiep_06','pin_07','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_09','chatlieu_09','cpu_08','manhinh_08','dohoa_02','ram_09','bonho_08','camera_02','giaotiep_06','pin_07','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_10','chatlieu_10','cpu_10','manhinh_10','dohoa_02','ram_10','bonho_10','camera_02','giaotiep_06','pin_07','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_11','chatlieu_07','cpu_08','manhinh_11','dohoa_03','ram_04','bonho_11','camera_03','giaotiep_10','pin_11','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_12','chatlieu_12','cpu_12','manhinh_12','dohoa_03','ram_01','bonho_11','camera_03','giaotiep_10','pin_11','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_13','chatlieu_13','cpu_13','manhinh_13','dohoa_03','ram_10','bonho_11','camera_03','giaotiep_10','pin_11','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_14','chatlieu_13','cpu_14','manhinh_14','dohoa_03','ram_10','bonho_11','camera_03','giaotiep_10','pin_11','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_15','chatlieu_13','cpu_14','manhinh_15','dohoa_03','ram_10','bonho_15','camera_03','giaotiep_10','pin_11','Android 10.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_16','chatlieu_07','cpu_16','manhinh_16','dohoa_04','ram_16','bonho_11','camera_04','giaotiep_16','pin_16','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_17','chatlieu_17','cpu_16','manhinh_17','dohoa_04','ram_16','bonho_21','camera_04','giaotiep_16','pin_16','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_18','chatlieu_17','cpu_16','manhinh_17','dohoa_04','ram_18','bonho_21','camera_04','giaotiep_16','pin_16','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_19','chatlieu_10','cpu_16','manhinh_19','dohoa_04','ram_16','bonho_11','camera_04','giaotiep_16','pin_16','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_20','chatlieu_17','cpu_20','manhinh_20','dohoa_04','ram_18','bonho_11','camera_04','giaotiep_16','pin_16','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_21','chatlieu_07','cpu_21','manhinh_20','dohoa_05','ram_10','bonho_21','camera_05','giaotiep_21','pin_21','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_22','chatlieu_22','cpu_21','manhinh_20','dohoa_05','ram_10','bonho_21','camera_05','giaotiep_21','pin_21','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_23','chatlieu_22','cpu_21','manhinh_20','dohoa_05','ram_16','bonho_21','camera_05','giaotiep_21','pin_21','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_24','chatlieu_07','cpu_21','manhinh_24','dohoa_05','ram_18','bonho_21','camera_05','giaotiep_21','pin_21','Android 9.0')

insert into 
dienthoaichitiet(madienthoai,machatlieu,macpu,mamanhinh,madohoa,maram,mabonho,macamera,magiaotiep,mapin,phienbanhedieuhanh)
values('dt_25','chatlieu_07','cpu_25','manhinh_24','dohoa_05','ram_18','bonho_21','camera_05','giaotiep_21','pin_21','Android 9.0')










































