package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "chitiethoadon")
@Data
public class Chitiethoadon {

	/*machitiethoadon int identity(1,1),
	mahoadon varchar(15) not null,
	mamaytinh varchar(25) not null,
	soluongmua int*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "machitiethoadon")
	private int machitiethoadon;
	
	@Column(name = "mahoadon")
	private int mahoadon;
	
	@Column(name = "masanpham",length = 25,nullable = false)
	private String masanpham;
	
	@Column(name = "soluongmua")
	private int soluongmua;
	
}








