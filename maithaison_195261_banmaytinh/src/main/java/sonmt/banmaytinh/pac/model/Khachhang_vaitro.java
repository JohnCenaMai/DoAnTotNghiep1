package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "khachhang_vaitro")
@Data
public class Khachhang_vaitro {

	/*id int identity(1,1) primary key,
	email varchar(35) not null,
	id_vaitro int not null*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "makh")
	private int makh;
	
	@Column(name = "id_vaitro")
	private int id_vaitro;
	
}


