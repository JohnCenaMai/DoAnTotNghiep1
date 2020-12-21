package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "giohang")
public class Giohang {

	/*
	 	masanpham varchar(25) not null primary key,
		tensanpham varchar(60) not null,
		gia int, 
		soluong int
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idgio")
	private int idgio;
	
	@Column(name = "masanpham",length = 25,nullable = false)
	private String masanpham;
	
	@Column(name = "tensanpham",length = 60,nullable = false)
	private String tensanpham;
	
	@Column(name = "makh")
	private int makh;
	
	@Column(name = "gia")
	private int gia;
	
	@Column(name = "soluong")
	private int soluong;
	
}
