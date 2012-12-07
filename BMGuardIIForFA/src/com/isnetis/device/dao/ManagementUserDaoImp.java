package com.isnetis.device.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.device.domain.ManagementUserVO;
import com.isnetis.user.domain.UserMastVO;

@Repository
public class ManagementUserDaoImp extends SqlSessionDaoSupport implements ManagementUserDao {

	@Override
	public void addManagementUser(ManagementUserVO vo) {
		getSqlSession().insert("addManagementUser", vo);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ManagementUserVO> getManagementUserList(int status, int[] clientGroupIdxValues) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", status);
		map.put("clientGroupIdxValues", clientGroupIdxValues);
		
		return getSqlSession().selectList("getManagementUserList", map);
	}
	
	@Override
	public void addManagementUserHistory(int userIdx) {
		getSqlSession().insert("addManagementUserHistory", userIdx);
	}
	
	@Override
	public void deleteManagementUser(int userIdx) {
		getSqlSession().delete("deleteManagementUser", userIdx);
	}
	
	@Override
	public UserMastVO getUserInfo(int userIdx) {
		return (UserMastVO)getSqlSession().selectOne("getUserInfo", userIdx);
	}

	@Override
	public void updateManagementUser(ManagementUserVO vo) {
		getSqlSession().update("updateManagementUser", vo);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ManagementUserVO> getUserHistory(int userIdx) {
		return getSqlSession().selectList("getManagementUserHistory", userIdx);
	}

	@Override
	public int getManagementUserCnt(String userLoginId) {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("getUserCnt", userLoginId);
	}
	
}
