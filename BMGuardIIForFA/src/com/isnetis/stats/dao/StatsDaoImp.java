package com.isnetis.stats.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class StatsDaoImp extends SqlSessionDaoSupport implements StatsDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, String>> getGroupListForStats(Map<String, Object> param) {
		return getSqlSession().selectList("getGroupListForStats", param);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getDeviceStatsByGroup(Map<String, Object> param) {
		return (Map<String, Object>)getSqlSession().selectOne("getDeviceStatsByGroup", param);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getDeviceStatsByOsType(Map<String, Object> param) {
		return getSqlSession().selectList("getDeviceStatsByOsType", param);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getDeviceStateByGroup(Map<String, Object> param) {
		return getSqlSession().selectList("getDeviceStateByGroup", param);
	}
}
