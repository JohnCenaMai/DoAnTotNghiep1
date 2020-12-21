package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "chatlieu")
@Data
public class Chatlieu {

	/*machatlieu varchar(25) primary key,
	chatlieumatbenngoaicung nvarchar(20) null,
	chatlieukhungmanhinh nvarchar(20) null,
	chatlieumatbanphim nvarchar(20) null,
	chatlieumatlung nvarchar(20) null*/
	
	@Id
	@Column(name = "machatlieu",length = 25)
	private String machatlieu;
	
	@Column(name = "chatlieumatbenngoaicung",length = 20)
	private String chatlieumatbenngoaicung;
	
	@Column(name = "chatlieukhungmanhinh",length = 20)
	private String chatlieukhungmanhinh;
	
	@Column(name = "chatlieumatbanphim",length = 20)
	private String chatlieumatbanphim;
	
	@Column(name = "chatlieumatlung",length = 20)
	private String chatlieumatlung;
	
}
