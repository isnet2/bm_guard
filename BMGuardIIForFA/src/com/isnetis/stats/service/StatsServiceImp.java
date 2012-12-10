package com.isnetis.stats.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.stats.dao.StatsDao;

@Service
public class StatsServiceImp implements StatsService{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private StatsDao statsDao;
	
	// 자동화기기 운영현황(통계) - 관리그룹별
	@Override
	public List<Map<String, Object>> getDeviceStatsByGroup(Map<String, Object> paramMap) {
		
		/*
		 * 1레벨에 해당하는 관리그룹의 모든 하위그룹번호를 조회해서 1레벨 관리그룹별로 저장한다.
		 * 조회된 하위그룹번호는 ","를 구분자로 사용하여 나열되어 있다. [{"3": "3, 7, 79"}, {"4":"78, 9, 70"}]
		 * 조회조건으로 사용할때는 ","를 기준으로 잘라서 배열로 만든 다음, paramMap에 "sub_group_idxs"를 key로 사용해서 저장한다.
		 */
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		
		// 선택된 레벨1 그룹의 하위그룹번호를 조회한다.
		List<Map<String, String>> sub_group_list = statsDao.getGroupListForStats(paramMap);
		
		for(Map<String, String> sub_group : sub_group_list){
			String[] sub_group_idxs = sub_group.get("sub_groups").split(",");
			paramMap.put("sub_group_idxs", sub_group_idxs);
			
			Map<String, Object> result =  statsDao.getDeviceStatsByGroup(paramMap);
			result.put("group_name", sub_group.get("group_name"));
			resultList.add(result);
		}
		logger.info("["+getClass().getName()+"][getDeviceStatsByGroup] total_data_count["+resultList.size()+"]");

		return resultList;
	}
	
	// 자동화기기 운영현황(통계) - OS별
	@Override
	public List<Map<String, Object>> getDeviceStatsByOsType(Map<String, Object> paramMap) {
		List<Map<String, Object>> resultList = statsDao.getDeviceStatsByOsType(paramMap);
		logger.info("["+getClass().getName()+"][getDeviceStatsByOsType] total_data_count["+resultList.size()+"]");
		
		return resultList;
	}
	
	// 자동화기기 운영현황(기기현황)
	@Override
	public List<Map<String, Object>> getDeviceStateByGroup(Map<String, Object> paramMap) {
		
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		
		// 선택된 레벨1 그룹의 하위그룹번호를 조회한다.
		List<Map<String, String>> sub_group_list = statsDao.getGroupListForStats(paramMap);
		
		for(Map<String, String> sub_group : sub_group_list){
			
			String[] sub_group_idxs = sub_group.get("sub_groups").split(",");
			paramMap.put("sub_group_idxs", sub_group_idxs);
			
			List<Map<String, Object>> result = statsDao.getDeviceStateByGroup(paramMap);
			resultList.addAll(result);
			
		}
		logger.info("["+getClass().getName()+"][getDeviceStateByGroup] total_data_count["+resultList.size()+"]");
		
		return resultList;
	}

	// 정책관리현황 (정책별 통계)
	@Override
	public List<Map<String, Object>> getNewPolicyListByDate(Map<String, Object> paramMap) {
		List<Map<String, Object>> resultList =  statsDao.getNewPolicyListByDate(paramMap);
		logger.info("["+getClass().getName()+"][getNewPolicyListByDate] total_data_count["+resultList.size()+"]");
		
		return resultList;
	}
	
	// 정책관리현황 (기기별 통계)
	@Override
	public List<Map<String, Object>> getDeviceListByDate(Map<String, Object> paramMap) {
		List<Map<String, Object>> resultList = statsDao.getDeviceListByDate(paramMap);
		logger.info("["+getClass().getName()+"][getDeviceListByDate] total_data_count["+resultList.size()+"]");
		return resultList;
	}
}
