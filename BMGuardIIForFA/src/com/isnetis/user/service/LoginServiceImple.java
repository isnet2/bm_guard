package com.isnetis.user.service;

import javax.inject.Inject;

import org.directwebremoting.annotations.RemoteProxy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.common.service.CommonService;
import com.isnetis.user.dao.LoginDao;
import com.isnetis.user.domain.SessionUserVO;
import com.isnetis.user.domain.UserMastVO;

@Service("loginService")
@RemoteProxy(name="LoginService")
public  class LoginServiceImple implements LoginService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 트랜잭션 처리 선언
	@Inject
	private PlatformTransactionManager tx;
	
	@Autowired
	private LoginDao loginDAO;
	
	
	/** 로그인 - 유저*/
	@Override
	public SessionUserVO getFindUserInfo(UserMastVO userMast) throws Throwable {
		
		return loginDAO.getFindUserInfo(userMast);
	}

	/** 로그인 - 유저찾기*/
	@Override
	public UserMastVO getFindByIdUserInfo(String login_id) throws Throwable {
		// TODO Auto-generated method stub
		return loginDAO.getFindByIdUserInfo(login_id);
	}

	/** 로그인 - 패스워드 답변*/
	@Override
	public int getCheckPwdAnser(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return loginDAO.getCheckPwdAnser(userMast);
	}

	@Override
	public int getChangePassWord(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return loginDAO.getChangePassWord(userMast);
	}

	@Override
	public int updateLogin(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return loginDAO.updateLogin(userMast);
		
	}
	
	
}