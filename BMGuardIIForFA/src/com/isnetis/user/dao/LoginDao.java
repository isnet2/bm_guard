package com.isnetis.user.dao;

import com.isnetis.user.domain.SessionUserVO;
import com.isnetis.user.domain.UserMastVO;

public interface LoginDao {
	
	/** 로그인 - 유저*/
	SessionUserVO getFindUserInfo(UserMastVO userMast) throws Throwable;
	
	/** 로그인 - 유저찾기*/
	UserMastVO getFindByIdUserInfo(String login_id) throws Throwable;

	/** 로그인 - 패스워드 답변*/
	int getCheckPwdAnser(UserMastVO userMast) throws Throwable;

	int getChangePassWord(UserMastVO userMast) throws Throwable;

	/** 로그인 - 로그인일자, ip-adress*/
	int updateLogin(UserMastVO userMast) throws Throwable;


}
