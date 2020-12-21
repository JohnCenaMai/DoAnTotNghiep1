package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "maytinh")
@Data
public class Maytinh {

	/*mamaytinh varchar(25) primary key,
	tensanpham varchar(60) not null,
	xuatxu varchar(20) not null,
	thoigianbaohanh tinyint,
	chieurong float,
	chieucao float,
	chieusau float,
	namramat varchar(4) not null,
	trongluong float,
	soluong int,
	gia int*/
	
	@Id
	@Column(name = "mamaytinh",length = 25)
	private String mamaytinh;
	
	@Column(name = "tensanpham",length = 60,nullable = false)
	private String tensanpham;
	
	@Column(name = "xuatxu",length = 20,nullable = false)
	private String xuatxu;
	
	@Column(name = "thoigianbaohanh")
	private int thoigianbaohanh;
	
	@Column(name = "chieurong")
	private float chieurong;
	
	@Column(name = "chieucao")
	private float chieucao;
	
	@Column(name = "chieusau")
	private float chieusau;
	
	@Column(name = "namramat")
	private String namramat;
	
	@Column(name = "trongluong")
	private float trongluong;
	
	@Column(name = "soluong")
	private int soluong;
	
	@Column(name = "gia")
	private int gia;
	
	@Column(name = "hinhanh",length = 255,nullable = true)
	private String hinhanh;
	
}
