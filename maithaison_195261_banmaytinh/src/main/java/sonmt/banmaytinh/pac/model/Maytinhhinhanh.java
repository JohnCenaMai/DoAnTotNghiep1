package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "maytinhhinhanh")
@Data
public class Maytinhhinhanh {
	
	/*stt int identity(1,1) primary key,
	mamaytinh varchar(25) not null,
	hinhanh nvarchar(255) null*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "stt")
	private int stt;
	
	@Column(name = "mamaytinh",length = 25,nullable = false)
	private String mamaytinh;
	
	@Column(name = "hinhanh",length = 255,nullable = true)
	private String hinhanh;
	
}
