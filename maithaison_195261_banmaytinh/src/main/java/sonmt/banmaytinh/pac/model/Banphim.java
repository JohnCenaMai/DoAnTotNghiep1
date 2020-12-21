package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "banphim")
@Data
public class Banphim {

	/*mabanphim varchar(25) primary key,
	kieubanphim nvarchar(25) null,
	banphimso nvarchar(15),
	loaidenbanphim nvarchar(15),
	maudenled nvarchar(15),
	congnghedenbanphim nvarchar(25),
	touchpad nvarchar(50)*/
	
	@Id
	@Column(name = "mabanphim",length = 25)
	private String mabanphim;
	
	@Column(name = "kieubanphim",length = 25)
	private String kieubanphim;
	
	@Column(name = "banphimso",length = 15)
	private String banphimso;
	
	@Column(name = "loaidenbanphim",length = 15)
	private String loaidenbanphim;
	
	@Column(name = "maudenled",length = 15)
	private String maudenled;
	
	@Column(name = "congnghedenbanphim",length = 25)
	private String congnghedenbanphim;
	
	@Column(name = "touchpad",length = 50)
	private String touchpad;
	
}
