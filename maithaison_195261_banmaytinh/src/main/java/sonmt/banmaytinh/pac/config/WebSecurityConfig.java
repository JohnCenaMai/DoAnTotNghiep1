package sonmt.banmaytinh.pac.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import sonmt.banmaytinh.pac.service.KhachHangService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	KhachHangService khachHangService;
	
	@Autowired
	private JwtRequestFilter jwtRequestFilter;
	
	@Autowired
	private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;
	
	@Bean("mahoamatkhau")
    public PasswordEncoder passwordEncoder() {
        // Password encoder, để Spring Security sử dụng mã hóa mật khẩu người dùng
        return new BCryptPasswordEncoder();
    }
	
	@Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        // Get AuthenticationManager bean
        return super.authenticationManagerBean();
    }
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		//auth.inMemoryAuthentication().withUser("sonmai").password("{noop}123456").roles("USER");
		auth.userDetailsService(khachHangService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http.csrf().disable()
			.authorizeRequests()
			.antMatchers("/trangdangnhap").permitAll()
			.antMatchers("/authenticate").permitAll()
			.antMatchers("/dangnhap").permitAll()
			.antMatchers("/trangchu").permitAll()
			.antMatchers("/fontawesome-free-5.14.0-web/css/all.css").permitAll()
			.antMatchers("/AnhNen/*").permitAll()
			.antMatchers("/DienThoai/*").permitAll()
			.antMatchers("/login-google").permitAll()
			.antMatchers("/login-facebook").permitAll()
			.antMatchers("/trangdangky").permitAll()
			.antMatchers("/trangdangky/dangky").permitAll()
			.antMatchers("/dangxuat").permitAll()
			.antMatchers("/trangchitietsanpham/*").permitAll()
			.antMatchers("/trangtimkiemsanpham").permitAll()
			.antMatchers("/Máy tính/**").permitAll()
			.antMatchers("/trangtimkiemsanpham1").permitAll()
			.antMatchers("/hoidaptuvanvien").permitAll()
			.antMatchers("/tranglaptop").permitAll()
			.antMatchers("/locsanpham").permitAll()
			.antMatchers("/trangkhachhang/tranggiohang/**").hasRole("USER")	
			.antMatchers("/trangkhachhang/xulythemvaogiohang/**").hasRole("USER")
			.antMatchers("/trangkhachhang/capnhatsoluong/**").hasRole("USER")
			.antMatchers("/trangkhachhang/xulyxoakhoigiohang/**").hasRole("USER")
			.antMatchers("/trangkhachhang/xuathoadon/**").hasRole("USER")
			.antMatchers("/trangkhachhang/chonthanhtoanpaypal/**").hasRole("USER")
			.antMatchers("/trangkhachhang/review_payment").hasRole("USER")
			.antMatchers("/trangkhachhang/tienhanhthanhtoanpaypal").hasRole("USER")
			.antMatchers("/trangkhachhang/trangthongtinkhachhang/**").hasRole("USER")
			.antMatchers("/trangkhachhang/luubinhluan/**").hasAnyRole("USER","ADMIN")
			.antMatchers("/trangkhachhang/luuphanhoi/**").hasAnyRole("USER","ADMIN")
			.antMatchers("/trangkhachhang/tranghoadon/**").hasAnyRole("USER","ADMIN")
			.antMatchers("/trangkhachhang/trangchitiethoadon/**").hasAnyRole("USER","ADMIN")
			.antMatchers("/trangkhachhang/xoataikhoan/**").hasAnyRole("USER","ADMIN")
			.antMatchers("/trangquantri/**").hasRole("ADMIN")
			.anyRequest().authenticated()
		//.and()
			/*.formLogin()
			//.loginProcessingUrl("/j_spring_security_login")
			//.loginPage("/login")
			.defaultSuccessUrl("/trangchu")
			.failureUrl("/login?error")
			.usernameParameter("email")
			.passwordParameter("matkhau")
			.permitAll()*/
		.and()
			.logout().permitAll();
		
		http.sessionManagement()
    		.sessionCreationPolicy(SessionCreationPolicy.ALWAYS);
		
		http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
	}
	
}
