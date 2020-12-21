package sonmt.banmaytinh.pac.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "hopthu")
@Data
public class Hopthu {

	/*create table hopthu
	(
		idhopthu int identity(1,1) primary key,
		makh int,
		email varchar(35),
		noidunggui varchar(100),
		ngaygui datetime,
		trangthai bit --0: chua phan hoi,1: da phan hoi
	)*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idhopthu")
	private int idhopthu;
	
	@Column(name = "email",length = 35)
	private String email;
	
	@Column(name = "chude",length = 30)
	private String chude;
	
	@Column(name = "noidunggui",length = 100)
	private String noidunggui;
	
	@Column(name = "ngaygui")
	private Date ngaygui;
	
	@Column(name = "trangthai")
	private boolean trangthai;
	
}
	