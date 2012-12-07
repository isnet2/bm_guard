package com.isnetis.user.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.user.domain.SessionUserVO;
import com.isnetis.user.domain.UserMastVO;

@Repository("LoginDao")
public class LoginDaoImple extends SqlSessionDaoSupport implements LoginDao{

	/** 로그인 - 유저*/
	@Override
	public SessionUserVO getFindUserInfo(UserMastVO userMast) throws Throwable {
		
		return (SessionUserVO) getSqlSession().selectOne("UserMast.getFindUserInfo", userMast);
	}

	/** 로그인 - 유저찾기*/
	@Override
	public UserMastVO getFindByIdUserInfo(String login_id) throws Throwable {
		// TODO Auto-generated method stub
		return (UserMastVO) getSqlSession().selectOne("UserMast.getFindByIdUserInfo", login_id);

	}

	/** 로그인 - 패스워드 답변*/
	@Override
	public int getCheckPwdAnser(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("UserMast.getCheckPwdAnser", userMast);
	}

	@Override
	public int getChangePassWord(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("UserMast.getChangePassWord", userMast);
	}

	@Override
	public int updateLogin(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("UserMast.updateLogin", userMast);
	}

}

