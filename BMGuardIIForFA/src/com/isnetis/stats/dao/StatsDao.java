package com.isnetis.stats.dao;

import java.util.List;
import java.util.Map;

public interface StatsDao {

	List<Map<String, String>> getGroupListForStats(Map<String, Object> param);
	Map<String, Object> getDeviceStatsByGroup(Map<String, Object> param);
	List<Map<String, Object>> getDeviceStatsByOsType(Map<String, Object> param);
	List<Map<String, Object>> getDeviceStateByGroup(Map<String, Object> param);
	
}
