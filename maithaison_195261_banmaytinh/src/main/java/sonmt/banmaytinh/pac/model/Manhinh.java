package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "manhinh")
@Data
public class Manhinh {

	/*mamanhinh varchar(15) primary key,
	loaicamung nvarchar(20) null,
	manhinhcamung nvarchar(20) null,
	dotuongphan nvarchar(15) null,
	tylemanhinh nvarchar(15) null,
	dophumau nvarchar(15) null,
	congnghe varchar(15) null,
	dosang nvarchar(15) null,
	dophangiai varchar(25) null,
	tansoquet tinyint,
	loaimanhinh varchar(20) null,
	kichthuocmanhinh varchar(5) not null*/
	
	@Id
	@Column(name = "mamanhinh",length = 15)
	private String mamanhinh;
	
	@Column(name = "loaicamung",length = 20,nullable = true)
	private String loaicamung;
	
	@Column(name = "manhinhcamung",length = 20,nullable = true)
	private String manhinhcamung;
	
	@Column(name = "dotuongphan",length = 15,nullable = true)
	private String dotuongphan;
	
	@Column(name = "tylemanhinh",length = 15,nullable = true)
	private String tylemanhinh;
	
	@Column(name = "dophumau",length = 15,nullable = true)
	private String dophumau;
	
	@Column(name = "congnghe",length = 15,nullable = true)
	private String congnghe;
	
	@Column(name = "dosang",length = 15,nullable = true)
	private String dosang;
	
	@Column(name = "dophangiai",length = 25,nullable = true)
	private String dophangiai;
	
	@Column(name = "tansoquet")
	private byte tansoquet;
	
	@Column(name = "loaimanhinh",length = 20,nullable = true)
	private String loaimanhinh;
	
	@Column(name = "kichthuocmanhinh",length = 5,nullable = false)
	private String kichthuocmanhinh;
	
}
