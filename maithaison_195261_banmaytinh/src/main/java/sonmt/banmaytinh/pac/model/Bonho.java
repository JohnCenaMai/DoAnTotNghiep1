package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "bonho")
@Data
public class Bonho {

	/*mabonho varchar(25) primary key,
	kieu nvarchar(25) null,
	dungluong nvarchar(15) null,
	tocdodocghi nvarchar(15) null,
	sokhecam nvarchar(10) null*/
	
	@Id
	@Column(name = "mabonho",length = 25)
	private String mabonho;
	
	@Column(name = "kieu",length = 25,nullable = true)
	private String kieu;
	
	@Column(name = "dungluong",length = 15,nullable = true)
	private String dungluong;
	
	@Column(name = "tocdodocghi",length = 15,nullable = true)
	private String tocdodocghi;
	
	@Column(name = "sokhecam",length = 10,nullable = true)
	private String sokhecam;
	
}







