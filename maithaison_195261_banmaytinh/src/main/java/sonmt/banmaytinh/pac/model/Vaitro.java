package sonmt.banmaytinh.pac.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "vaitro")
@Data
public class Vaitro {

	/*id_vaitro int identity(1,1) primary key,
	tenvaitro varchar(10) not null*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_vaitro")
	private int id_vaitro;
	
	@Column(name = "tenvaitro",nullable = false)
	private String tenvaitro;
	
}
