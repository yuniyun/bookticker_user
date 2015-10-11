package org.bs.login.service;

import org.bs.common.mapper.LoginMapper;
import org.bs.login.model.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper mapper;

	@Override
	public LoginVO loginCheck(LoginVO login) throws Exception {
		return mapper.read(login);
	}

	@Override
	public String getPW(LoginVO login) throws Exception {
		return mapper.readPW(login);
	}

	@Override
	public void sessionUpdate(LoginVO login) throws Exception {
		mapper.update(login);
	}

	@Override
	public void regist(LoginVO login) throws Exception {
		mapper.create(login);
	}

}
