package com.isnetis.user.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.user.domain.UserAttrMastVO;
import com.isnetis.user.domain.UserGrpListVO;
import com.isnetis.user.domain.UserMastBean;
import com.isnetis.user.domain.UserMastVO;

@Repository("UserDao")
public class UserDaoImple extends SqlSessionDaoSupport implements UserDao {

	@Override
	public int getChangePwdQuesAns(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("UserMast.getChangePwdQuesAns", userMast);
	}

	@Override
	public List<UserMastVO> getUserList(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		List<UserMastVO> list = null;
		
		list = (List<UserMastVO>)getSqlSession().selectList("UserMast.getUserList", userMast);
		return list;
	}

	@Override
	public List<UserGrpListVO> getUserGrpList() throws Throwable {
		// TODO Auto-generated method stub
		List<UserGrpListVO> list = null;
		
		list = (List<UserGrpListVO>)getSqlSession().selectList("UserGrpList.getUserGrpList");
		return list;
	}

	@Override
	public List<UserAttrMastVO> getUserAttrMast() throws Throwable {
		// TODO Auto-generated method stub
		List<UserAttrMastVO> list = null;
		
		list = (List<UserAttrMastVO>)getSqlSession().selectList("UserAttrMast.getUserAttrMast");
		return list;
	}

	@Override
	public int deleteUser(String user_idx) throws Throwable {
		// TODO Auto-generated method stub
		int result =0;
			result = getSqlSession().update("UserMast.deleteUser", user_idx);

		return result;
	}

	@Override
	public int insertUserHistory(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("UserMast.insertUserMastHistory", userMast);
	}

//	@Override
//	public List<UserMastVO> getFindIdxUserInfo(String user_idx) throws Throwable {
//		// TODO Auto-generated method stub
//		List<UserMastVO> list = null;
//		list = (List<UserMastVO>)getSqlSession().selectList("UserMast.getFindIdxUserInfo" ,  user_idx);
//		return list;
//	}
	
	@Override
	public UserMastVO getFindIdxUserInfo(String user_idx) throws Throwable {
		// TODO Auto-generated method stub
		return (UserMastVO)getSqlSession().selectOne("UserMast.getFindIdxUserInfo" ,  user_idx);

	}

	@Override
	public List<UserMastVO> getFindIdxUserHistory(String user_idx)
			throws Throwable {
		// TODO Auto-generated method stub
		List<UserMastVO> list = null;
		list = (List<UserMastVO>)getSqlSession().selectList("UserMast.getFindIdxUserHistory", user_idx);
		return list;
	}

	@Override
	public int insertUserMast(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("UserMast.insertUser", userMast);
	}

	@Override
	public int getUserMastMaxIdx() throws Throwable {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("UserMast.getUserMastMaxIdx");
	}

	@Override
	public int userUpdate(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("UserMast.updateUser", userMast);
	}

	@Override
	public int getUserHistoryMaxIdx() throws Throwable {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("UserMast.getUserHistoryMaxIdx");
	}

	@Override
	public int getCheckUserNoCnt(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("UserMast.getCheckUserNoCnt", userMast);
	}

	@Override
	public int getCheckLoginIdCnt(UserMastVO user) throws Throwable {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("UserMast.getCheckLoginIdCnt", user);
	}

	@Override
	public String getCheckUserNo(String user_no) throws Throwable {
		// TODO Auto-generated method stub
		return (String)getSqlSession().selectOne("UserMast.getCheckUserNo", user_no);
	}

	@Override
	public String getCheckLoginId(String login_id) throws Throwable {
		// TODO Auto-generated method stub
		return (String)getSqlSession().selectOne("UserMast.getCheckLoginId", login_id);
	}

}
