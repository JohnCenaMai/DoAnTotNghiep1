package sonmt.banmaytinh.pac.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Data;
import sonmt.banmaytinh.pac.model.Khachhang;
import sonmt.banmaytinh.pac.repository.KhachHang_VaiTroRepository;

public class CustomKhachHangDetails implements UserDetails {
	
	public CustomKhachHangDetails(sonmt.banmaytinh.pac.model.Khachhang khachhang,int mavaitro) {
		super();
		this.khachhang = khachhang;
		this.mavaitro = mavaitro;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Khachhang khachhang;
	private int mavaitro;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
		System.out.println(mavaitro);
		
		if(mavaitro == 1)
		{
			list.add(new SimpleGrantedAuthority("ROLE_USER"));
			//return Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
			return list;
		}
		else if (mavaitro == 2) {
			list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			//return Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
			return list;
		}
		else if (mavaitro == 3) {
			list.add(new SimpleGrantedAuthority("ROLE_SELLER"));
			//return Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
			return list;
		}
		return Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return khachhang.getMatkhau();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return Integer.toString(khachhang.getMakh());
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return khachhang.isIsaccountnonexpired();
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return khachhang.isIsaccountnonlocked();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return khachhang.isIscredentialsnonexpired();
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return khachhang.isIsenabled();
	}
	
}
