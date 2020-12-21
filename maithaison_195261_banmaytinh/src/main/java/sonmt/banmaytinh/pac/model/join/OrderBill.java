package sonmt.banmaytinh.pac.model.join;

import lombok.Data;

@Data
public class OrderBill {

	private String tensanpham;
	private int gia;
	private int soluong;
	
	public OrderBill(String tensanpham, int gia, int soluong) {
		super();
		this.tensanpham = tensanpham;
		this.gia = gia;
		this.soluong = soluong;
	}
	
}
