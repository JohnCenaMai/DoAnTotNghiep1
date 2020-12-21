package sonmt.banmaytinh.pac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import sonmt.banmaytinh.pac.config.CustomKhachHangDetails;
import sonmt.banmaytinh.pac.model.Khachhang;
import sonmt.banmaytinh.pac.repository.KhachHangRepository;
import sonmt.banmaytinh.pac.repository.KhachHang_VaiTroRepository;

@Service
public class KhachHangService implements UserDetailsService {
	
	@Autowired
	private KhachHangRepository khachHangRepository;

	@Autowired 
	private KhachHang_VaiTroRepository khachHang_VaiTroRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Khachhang khachhang = khachHangRepository.findByUsername(username);
		int mavaitro = khachHang_VaiTroRepository.LayQuyen(khachhang.getMakh());
		if(khachhang==null)
		{
			throw new UsernameNotFoundException(username);
		}
		return new CustomKhachHangDetails(khachhang,mavaitro);
	}
	
}
