package sonmt.banmaytinh.pac.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "hoadon")
@Data
public class Hoadon {

	/*mahoadon varchar(15) primary key,
	ngaydathang date not null,
	trangthai bit*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mahoadon")
	private int mahoadon;
	
	@Column(name = "makh")
	private int makh;
	
	@Column(name = "ngaydathang",nullable = false)
	private Date ngaydathang;
	
	@Column(name = "trangthai")
	private boolean trangthai;
	
	@Column(name = "hinhthucthanhtoan")
	private int hinhthucthanhtoan;
	
}
