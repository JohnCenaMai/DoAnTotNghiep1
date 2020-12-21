package sonmt.banmaytinh.pac;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class Maithaison195261BanmaytinhApplication {

	public static void main(String[] args) throws ParseException {
		ApplicationContext context = SpringApplication.run(Maithaison195261BanmaytinhApplication.class, args);
		//SpringApplication.run(Maithaison195261BanmaytinhApplication.class, args);
		
		/*String password = "123456"; 
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); 
		String encodedPassword = passwordEncoder.encode(password);
		System.out.print(encodedPassword);*/
		
		/*PasswordEncoder passwordEncoder = (PasswordEncoder) context.getBean("mahoamatkhau");
		int i = 0;
		while (i < 10) {
			String password = "123456";
			//passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);

			System.out.println(hashedPassword);
			i++;
		}*/
		
		/*String ngaysinh = "2020-10-21";
		SimpleDateFormat formatter2=new SimpleDateFormat("yyyy-mm-dd");  
		Date date2=formatter2.parse(ngaysinh);
		System.out.println(formatter2.format(date2));*/
	}

}
