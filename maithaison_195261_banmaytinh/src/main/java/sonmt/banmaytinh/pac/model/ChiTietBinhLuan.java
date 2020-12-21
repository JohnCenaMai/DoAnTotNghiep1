package sonmt.banmaytinh.pac.model;

import java.util.List;

public class ChiTietBinhLuan {

	private Binhluan binhluan;
	private List<Phanhoi> phanhois;
	
	public Binhluan getBinhluan() {
		return binhluan;
	}
	public void setBinhluan(Binhluan binhluan) {
		this.binhluan = binhluan;
	}
	public List<Phanhoi> getPhanhois() {
		return phanhois;
	}
	public void setPhanhois(List<Phanhoi> phanhois) {
		this.phanhois = phanhois;
	}
	
}
