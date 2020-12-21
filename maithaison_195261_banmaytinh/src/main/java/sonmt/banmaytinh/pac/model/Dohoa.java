package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "dohoa")
@Data
public class Dohoa {

	/*madohoa varchar(15) primary key,
	hang varchar(10) null,
	xungnhip float,
	xungnhiptoida float,
	model varchar(10) null,
	cardonboard varchar(20) null*/
	
	@Id
	@Column(name = "madohoa",length = 15)
	private String madohoa;
	
	@Column(name = "hang",length = 10,nullable = true)
	private String hang;
	
	@Column(name = "xungnhip")
	private float xungnhip;
	
	@Column(name = "xungnhiptoida")
	private float xungnhiptoida;
	
	@Column(name = "model",length = 10,nullable = true)
	private String model;
	
	@Column(name = "cardonboard",length = 20,nullable = true)
	private String cardonboard;
	
}
