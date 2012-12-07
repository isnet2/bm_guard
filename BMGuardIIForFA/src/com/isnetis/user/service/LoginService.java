package com.isnetis.user.service;

import com.isnetis.user.domain.SessionUserVO;
import com.isnetis.user.domain.UserMastVO;

public interface LoginService {

	
	/** 로그인 - 유저*/
	SessionUserVO getFindUserInfo(UserMastVO userMast) throws Throwable;
	
	/** 로그인 - 유저찾기*/
	UserMastVO getFindByIdUserInfo(String login_id) throws Throwable;

	/** 로그인 - 패스워드 답변*/
	int getCheckPwdAnser(UserMastVO userMast)throws Throwable;

	/** 로그인 - 비밀번호 변경*/
	int getChangePassWord(UserMastVO user)throws Throwable;

	/** 로그인 - 로그인일자, IpAdress*/
	int updateLogin(UserMastVO userMast)throws Throwable;



}
