package com.isnetis.stats.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.stats.dao.StatsDao;

@Service
public class StatsServiceImp implements StatsService{

	@Autowired
	private StatsDao statsDao;
	
	// 자동화기기 운영현황(통계) - 관리그룹별
	@Override
	public List<Map<String, Object>> getDeviceStatsByGroup(Map<String, Object> paramMap) {
		
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
		
		return resultList;
	}
	
	// 자동화기기 운영현황(통계) - OS별
	@Override
	public List<Map<String, Object>> getDeviceStatsByOsType(Map<String, Object> paramMap) {
		return statsDao.getDeviceStatsByOsType(paramMap);
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
		
		return resultList;
	}
}
