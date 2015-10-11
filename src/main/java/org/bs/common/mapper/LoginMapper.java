package org.bs.common.mapper;

import org.bs.login.model.LoginVO;

public interface LoginMapper {

	public LoginVO read(LoginVO login) throws Exception;

	public String readPW(LoginVO login) throws Exception;
		
	public void update(LoginVO login) throws Exception;
	
	public void create(LoginVO login) throws Exception;
				
}
