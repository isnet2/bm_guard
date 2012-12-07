package com.isnetis.user.service;

import java.util.List;

import com.isnetis.user.domain.UserAttrMastVO;
import com.isnetis.user.domain.UserGrpListVO;
import com.isnetis.user.domain.UserMastBean;
import com.isnetis.user.domain.UserMastVO;

public interface UserService {

	/** 비밀번호_질문변경*/
	int getChangePwdQuesAns(UserMastVO userMast) throws Throwable;

	/** 유저_리스트*/
	List<UserMastVO> getList(UserMastVO userMast) throws Throwable;
	
	List<UserGrpListVO> getUserGrpList() throws Throwable;
	
	List<UserAttrMastVO> getUserAttrMast() throws Throwable;
	
	int deleteUser(String user_idx) throws Throwable;
	
	int insertUserHistory(UserMastVO userMast) throws Throwable;
	
	
	int insertUserMast(UserMastVO userMast) throws Throwable;
	
	int getUserMastMaxIdx() throws Throwable;
	
	int getUserHistoryMaxIdx() throws Throwable;
	
	UserMastVO getFindIdxUserInfo(String user_idx) throws Throwable;

	List<UserMastVO> getFindIdxUserHistory(String user_idx) throws Throwable;
	
	Object[] getFindIdxDWR(String user_idx) throws Throwable;
	
	int userUpdate(UserMastVO userMast) throws Throwable;

	int deleteInsertUser(String idxs) throws Throwable;

	int getCheckUserNoCnt(UserMastVO userMast) throws Throwable;

	int getCheckLoginIdCnt(UserMastVO user) throws Throwable;
	
	String getCheckUserNo(String user_no)  throws Throwable ;

	String getCheckLoginId(String login_id)  throws Throwable ;


}
