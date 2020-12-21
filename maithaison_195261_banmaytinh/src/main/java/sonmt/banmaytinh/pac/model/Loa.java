package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "loa")
@Data
public class Loa {

	/*maloa varchar(15) primary key,
	soloa tinyint,
	congngheamthanh varchar(20)*/
	
	@Id
	@Column(name = "maloa",length = 15)
	private String maloa;
	
	@Column(name = "soloa")
	private byte soloa;
	
	@Column(name = "congngheamthanh",length = 20)
	private String congngheamthanh;
	
}
