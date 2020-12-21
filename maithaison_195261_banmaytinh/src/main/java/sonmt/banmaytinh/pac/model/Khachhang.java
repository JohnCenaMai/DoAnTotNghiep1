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
@Table(name = "khachhang")
@Data
public class Khachhang {

	/*email varchar(35) primary key,
	tenkhachhang nvarchar(30) not null,
	matkhau varchar(15) not null,
	diachi nvarchar(50) not null,
	sodienthoai varchar(10) unique not null*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "makh")
	private int makh;
	
	@Column(name = "email",length = 35,unique = true)
	private String email;
	
	@Column(name = "tenkhachhang",length = 30,nullable = false)
	private String tenkhachhang;
	
	@Column(name = "matkhau",length = 100,nullable = false)
	private String matkhau;
	
	@Column(name = "diachi",length = 50,nullable = false)
	private String diachi;
	
	@Column(name = "sodienthoai",length = 10,unique = true)
	private String sodienthoai;
	
	@Column(name = "ngaysinh")
	private Date ngaysinh;
	
	@Column(name = "isaccountnonexpired")
	private boolean isaccountnonexpired;
	
	@Column(name = "isaccountnonlocked")
	private boolean isaccountnonlocked;
	
	@Column(name = "iscredentialsnonexpired")
	private boolean iscredentialsnonexpired;
	
	@Column(name = "isenabled")
	private boolean isenabled;
	
}
