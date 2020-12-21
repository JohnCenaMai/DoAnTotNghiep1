package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "boxuly")
@Data
public class Boxuly {

	/*macpu varchar(15) primary key,
	congnghecpu varchar(12) null,
	loaicpu varchar(10) not null,
	hangcpu varchar(10) null,
	tocdo float null,
	tocdotoida float null,
	bonhodem int null,
	tocdobus float null,
	soluong int,
	soloi int,*/
	
	@Id
	@Column(name = "macpu",length = 15)
	private String macpu;
	
	@Column(name = "congnghecpu",length = 12,nullable = true)
	private String congnghecpu;
	
	@Column(name = "loaicpu",length = 10,nullable = false)
	private String loaicpu;
	
	@Column(name = "hangcpu",length = 10,nullable = true)
	private String hangcpu;
	
	@Column(name = "tocdo",nullable = true)
	private float tocdo;
	
	@Column(name = "tocdotoida",nullable = true)
	private float tocdotoida;
	
	@Column(name = "bonhodem",nullable = true)
	private int bonhodem;
	
	@Column(name = "tocdobus",nullable = true)
	private float tocdobus;
	
	@Column(name = "soluong")
	private int soluong;
	
	@Column(name = "soloi")
	private int soloi;
	
}
