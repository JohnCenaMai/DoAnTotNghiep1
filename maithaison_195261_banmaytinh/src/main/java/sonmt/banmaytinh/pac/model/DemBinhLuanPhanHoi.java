package sonmt.banmaytinh.pac.model;

import lombok.Data;

@Data
public class DemBinhLuanPhanHoi {

	private String masanpham;
	private long sobinhluan;
	private long sophanhoi;
	
	public DemBinhLuanPhanHoi(String masanpham, long sobinhluan, long sophanhoi) {
		super();
		this.masanpham = masanpham;
		this.sobinhluan = sobinhluan;
		this.sophanhoi = sophanhoi;
	}
	
}
