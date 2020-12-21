package sonmt.banmaytinh.pac.model;

public class TongChiTheoThang {
	
	private int thang;
	private long tongchi;
	public int getThang() {
		return thang;
	}
	public void setThang(int thang) {
		this.thang = thang;
	}
	public long getTongchi() {
		return tongchi;
	}
	public void setTongchi(int tongchi) {
		this.tongchi = tongchi;
	}
	public TongChiTheoThang(int thang, long tongchi) {
		super();
		this.thang = thang;
		this.tongchi = tongchi;
	}
	
}
