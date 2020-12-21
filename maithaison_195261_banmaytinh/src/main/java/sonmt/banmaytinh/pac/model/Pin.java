package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "pin")
@Data
public class Pin {

	/*mapin varchar(15) primary key,
	loaipin nvarchar(25) null,
	cell varchar(2) null,
	thaoroi bit,
	powersupply varchar(3) null*/
	
	@Id
	@Column(name = "mapin",length = 15)
	private String mapin;
	
	@Column(name = "loaipin",length = 25,nullable = true)
	private String loaipin;
	
	@Column(name = "cell",length = 2,nullable = true)
	private String cell;
	
	@Column(name = "thaoroi")
	private boolean thaoroi;
	
	@Column(name = "powersupply",length = 3,nullable = true)
	private String powersupply;	
	
}
