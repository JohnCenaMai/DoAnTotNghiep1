package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "hedieuhanh")
@Data
public class Hedieuhanh {

	/*phienbanhedieuhanh varchar(15) primary key,
	ten varchar(25) not null,
	kieu varchar(2) not null*/
	
	@Id
	@Column(name = "phienbanhedieuhanh",length = 15)
	private String phienbanhedieuhanh;
	
	@Column(name = "ten",length = 25,nullable = true)
	private String ten;
	
	@Column(name = "kieu",length = 2,nullable = true)
	private String kieu;
	
}
