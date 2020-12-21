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
@Table(name = "binhluan")
@Data
public class Binhluan {

	/*mabinhluan int identity(1,1),
	mamaytinh varchar(25) not null,
	ngaybinhluan date,
	noidung nvarchar(100) null*/

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mabinhluan")
	private int mabinhluan;
	
	@Column(name = "makhachhang")
	private int makhachhang;
	
	@Column(name = "masanpham",length = 25,nullable = false)
	private String masanpham;
	
	@Column(name = "ngaybinhluan")
	private Date ngaybinhluan;
	
	@Column(name = "noidung",length = 100,nullable = true)
	private String noidung;
	
	@Column(name = "chophepan")
	private boolean chophepan;
}
