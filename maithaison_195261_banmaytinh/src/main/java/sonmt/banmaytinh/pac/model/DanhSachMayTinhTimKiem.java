package sonmt.banmaytinh.pac.model;

public class DanhSachMayTinhTimKiem {
	
	/*  select maytinh.tensanpham,maytinh.gia,
	boxuly.congnghecpu,dohoa.hang,manhinh.kichthuocmanhinh,
	bonho.dungluong,ram.dungluong,maytinh.trongluong
	from maytinh inner join maytinhchitiet 
	on maytinh.mamaytinh = maytinhchitiet.mamaytinh inner join boxuly
	on maytinhchitiet.macpu = boxuly.macpu inner join dohoa
	on maytinhchitiet.madohoa = dohoa.madohoa inner join manhinh
	on maytinhchitiet.mamanhinh = manhinh.mamanhinh inner join bonho
	on maytinhchitiet.mabonho = bonho.mabonho inner join ram
	on maytinhchitiet.maram = ram.maram
	 */
	
	private String masanpham;
	private String tensanpham;
	private int gia;
	private String congnghecpu;
	private String cardonboard;
	private String kichthuocmanhinh;
	private String dungluongbonho;
	private String dungluongram;
	private float trongluong;
	private String hinhanh;
	
	public DanhSachMayTinhTimKiem(String masanpham, String tensanpham, int gia, String congnghecpu, String cardonboard, String kichthuocmanhinh,
			String dungluongbonho, String dungluongram, float trongluong, String hinhanh) {
		super();
		this.masanpham = masanpham;
		this.tensanpham = tensanpham;
		this.gia = gia;
		this.congnghecpu = congnghecpu;
		this.cardonboard = cardonboard;
		this.kichthuocmanhinh = kichthuocmanhinh;
		this.dungluongbonho = dungluongbonho;
		this.dungluongram = dungluongram;
		this.trongluong = trongluong;
		this.hinhanh = hinhanh;
	}
	
	public String getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}

	public String getTensanpham() {
		return tensanpham;
	}
	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getCongnghecpu() {
		return congnghecpu;
	}
	public void setCongnghecpu(String congnghecpu) {
		this.congnghecpu = congnghecpu;
	}
	public String getMasanpham() {
		return masanpham;
	}

	public void setMasanpham(String masanpham) {
		this.masanpham = masanpham;
	}

	public String getCardonboard() {
		return cardonboard;
	}
	public void setCardonboard(String cardonboard) {
		this.cardonboard = cardonboard;
	}
	public String getKichthuocmanhinh() {
		return kichthuocmanhinh;
	}
	public void setKichthuocmanhinh(String kichthuocmanhinh) {
		this.kichthuocmanhinh = kichthuocmanhinh;
	}
	public String getDungluongbonho() {
		return dungluongbonho;
	}
	public void setDungluongbonho(String dungluongbonho) {
		this.dungluongbonho = dungluongbonho;
	}
	public String getDungluongram() {
		return dungluongram;
	}
	public void setDungluongram(String dungluongram) {
		this.dungluongram = dungluongram;
	}
	public float getTrongluong() {
		return trongluong;
	}
	public void setTrongluong(float trongluong) {
		this.trongluong = trongluong;
	}
	
}
