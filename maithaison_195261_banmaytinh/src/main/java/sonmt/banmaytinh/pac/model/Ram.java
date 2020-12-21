package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "ram")
@Data
public class Ram {

	/*maram varchar(15) primary key,
	dungluong tinyint,
	loairam varchar(15) not null,
	tocdoram float null,
	sokhecamroi tinyint,
	sokheramconlai tinyint,
	soramonboard tinyint,
	soramtoida tinyint*/
	
	@Id
	@Column(name = "maram",length = 15)
	private String maram;
	
	@Column(name = "dungluong")
	private byte dungluong;
	
	@Column(name = "loairam",length = 15,nullable = false)
	private String loairam;
	
	@Column(name = "tocdoram",nullable = true)
	private float tocdoram;
	
	@Column(name = "sokhecamroi")
	private byte sokhecamroi;
	
	@Column(name = "sokheramconlai")
	private byte sokheramconlai;
	
	@Column(name = "soramonboard")
	private byte soramonboard;
	
	@Column(name = "soramtoida")
	private byte soramtoida;
	
}
