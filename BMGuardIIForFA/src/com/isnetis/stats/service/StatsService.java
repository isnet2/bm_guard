package com.isnetis.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly=true)
public interface StatsService {

	// 자동화기기 운영현황조회(통계)
	List<Map<String, Object>> getDeviceStatsByGroup(Map<String, Object> paramMap);
	List<Map<String, Object>> getDeviceStatsByOsType(Map<String, Object> paramMap);
	
	// 자동화기기 운영현황조회(기기현황)
	List<Map<String, Object>> getDeviceStateByGroup(Map<String, Object> paramMap);
	
	// 정책관리 현황(정책별 통계)
	List<Map<String, Object>> getNewPolicyListByDate(Map<String, Object> paramMap);
	
}
