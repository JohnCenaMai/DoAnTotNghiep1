package sonmt.banmaytinh.pac.jwtclass;

import java.io.Serializable;

import lombok.Data;

@Data
public class JwtResponse implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private final String jwttoken;
	
	public JwtResponse(String jwttoken)
	{
		this.jwttoken = jwttoken;
	}
	
}
