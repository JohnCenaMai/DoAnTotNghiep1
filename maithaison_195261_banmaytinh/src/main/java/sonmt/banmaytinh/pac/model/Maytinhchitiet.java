package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "maytinhchitiet")
@Data
public class Maytinhchitiet {

	/*mamaytinh varchar(25) primary key,
	macpu varchar(25) not null,
	maram varchar(25) not null,
	madohoa varchar(25) not null,
	mamanhinh varchar(25) not null,
	maloa varchar(25) not null,
	mapin varchar(25) not null,
	phienbanhedieuhanh varchar(25) not null,
	machatlieu varchar(25) not null,
	mabanphim varchar(25) not null,
	mabonho varchar(25) not null */
	
	@Id
	@Column(name = "mamaytinh",length = 25)
	private String mamaytinh;
	
	@Column(name = "macpu",length = 25,nullable = false)
	private String macpu;
	
	@Column(name = "maram",length = 25,nullable = false)
	private String maram;
	
	@Column(name = "madohoa",length = 25,nullable = false)
	private String madohoa;
	
	@Column(name = "mamanhinh",length = 25,nullable = false)
	private String mamanhinh;
	
	@Column(name = "maloa",length = 25,nullable = false)
	private String maloa;
	
	@Column(name = "mapin",length = 25,nullable = false)
	private String mapin;
	
	@Column(name = "phienbanhedieuhanh",length = 25,nullable = false)
	private String phienbanhedieuhanh;
	
	@Column(name = "machatlieu",length = 25,nullable = false)
	private String machatlieu;
	
	@Column(name = "mabanphim",length = 25,nullable = false)
	private String mabanphim;
	
	@Column(name = "mabonho",length = 25,nullable = false)
	private String mabonho;
	
}
