package com.isnetis.user.dao;

import java.util.List;

import com.isnetis.user.domain.UserAttrMastVO;
import com.isnetis.user.domain.UserGrpListVO;
import com.isnetis.user.domain.UserMastBean;
import com.isnetis.user.domain.UserMastVO;

public interface UserDao {

	public int getChangePwdQuesAns(UserMastVO userMast) throws Throwable ;

	public List<UserMastVO> getUserList(UserMastVO userMast) throws Throwable ;

	public List<UserGrpListVO> getUserGrpList() throws Throwable ;

	public List<UserAttrMastVO> getUserAttrMast() throws Throwable ;
	
	public int deleteUser(String user_idx) throws Throwable ;
	
	public int insertUserHistory(UserMastVO userMast) throws Throwable ;

	//public List<UserMastVO> getFindIdxUserInfo(String user_idx) throws Throwable ;

	public UserMastVO getFindIdxUserInfo(String user_idx) throws Throwable ;
	
	public List<UserMastVO> getFindIdxUserHistory(String user_idx) throws Throwable ;

	public int insertUserMast(UserMastVO userMast) throws Throwable ;

	public int getUserMastMaxIdx() throws Throwable ;

	public int userUpdate(UserMastVO userMast) throws Throwable ;

	public int getUserHistoryMaxIdx() throws Throwable ;

	public int getCheckUserNoCnt(UserMastVO userMast)  throws Throwable ;

	public int getCheckLoginIdCnt(UserMastVO user)  throws Throwable ;

	public String getCheckUserNo(String user_no)  throws Throwable ;

	public String getCheckLoginId(String login_id)  throws Throwable ;

}
