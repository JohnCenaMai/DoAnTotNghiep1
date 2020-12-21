package sonmt.banmaytinh.pac.model;

import javax.persistence.Table;

import lombok.Data;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Table(name = "phanhoi")
@Data
public class Phanhoi {

	/*maphanhoi int identity(1,1),
	mabinhluan int,
	ngayphanhoi date,
	noidung nvarchar(100) null*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "maphanhoi")
	private int maphanhoi;
	
	@Column(name = "mabinhluan")
	private int mabinhluan;
	
	@Column(name = "makhachhang")
	private int makhachhang;
	
	@Column(name = "ngayphanhoi")
	private Date ngayphanhoi;
	
	@Column(name = "noidung",length = 100,nullable = true)
	private String noidung;
	
}
