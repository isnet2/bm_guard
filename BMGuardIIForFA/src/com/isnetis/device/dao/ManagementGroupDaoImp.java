package com.isnetis.device.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.device.domain.ManagementGroupVO;

@Repository
public class ManagementGroupDaoImp extends SqlSessionDaoSupport implements ManagementGroupDao{

	@Override
	public void addManagementGroup(ManagementGroupVO vo) {
		getSqlSession().insert("addManagementGroup", vo);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ManagementGroupVO> getManagementGroupForUser(int userIdx) {
		return getSqlSession().selectList("getManagementGroupForUser", userIdx);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ManagementGroupVO> getManagementGroupForAdmin(int userIdx) {
		return getSqlSession().selectList("getManagementGroupForAdmin", userIdx);
	}
	
	@Override
	public void addManagementGroupHistory(int historyUserIdx, int userIdx, String userType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_type", userType);
		map.put("user_idx", userIdx);
		map.put("historyuser_idx", historyUserIdx);
		getSqlSession().insert("addManagementGroupHistory", map);
	}
	
	@Override
	public void deleteManagementGroup(int userIdx, String userType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_type", userType);
		map.put("user_idx", userIdx);
		getSqlSession().insert("deleteManagementGroup", map);
	}
	
	@Override
	public void updateManagementGroup(int userIdx, String userType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_type", userType);
		map.put("user_idx", userIdx);
		getSqlSession().insert("updateManagementGroup", map);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ManagementGroupVO> getManagementGroupForUserHistory(int userIdx) {
		return getSqlSession().selectList("getManagementGroupHistoryForUser", userIdx);
	}

	@Override
	public int deleteManagementGrp(int userIdx, String userType)
			throws Throwable {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_type", userType);
		map.put("user_idx", userIdx);
		
		return getSqlSession().insert("deleteManagementGroup", map);
	}

	@Override
	public int insertManagementGrp(ManagementGroupVO group) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().insert("addManagementGroup", group);
	}

	@Override
	public int insertAdminGrpHistory(ManagementGroupVO group) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().insert("insertAdminGrpHistory", group);
	}

	@Override
	public List<ManagementGroupVO> getAdminGrpHistory(ManagementGroupVO group)
			throws Throwable {
		// TODO Auto-generated method stub
		return (List<ManagementGroupVO>) getSqlSession().selectList("getAdminGrpHistory", group);
	}
}
