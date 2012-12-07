package com.isnetis.device.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.isnetis.common.domain.CommonConstant;
import com.isnetis.device.domain.ClientMastVO;

@Repository
public class ClientMastDaoImp extends SqlSessionDaoSupport implements ClientMastDao{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void addDevice(ClientMastVO clientMast) {
		getSqlSession().insert("addDevice", clientMast);
	}
	
	@Override
	public void addDeleteKey(ClientMastVO clientMast) {
		getSqlSession().update("addDeleteKey", clientMast);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ClientMastVO> getDeleteHistory(Map<String, String> map) {
		return getSqlSession().selectList("getDeleteHistory", map);
	}
	
	@Override
	public ClientMastVO getDeviceInfoForPolicyByClientIdx(int client_idx) {
		return (ClientMastVO)getSqlSession().selectOne("getDeviceInfoForPolicyByClientIdx", client_idx);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ClientMastVO> getDeviceList(int clientgrp_idx) {
		return (List<ClientMastVO>)getSqlSession().selectList("getDeviceList", clientgrp_idx);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ClientMastVO> getDeviceListForPolicyByClientGroupIdx(int clientgrp_idx, int nowsim_flag) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("clientgrp_idx", clientgrp_idx);
		if(nowsim_flag != CommonConstant.UNCHECKED_SIM_FLAG){
			map.put("nowsim_flag", nowsim_flag);
		}
		return getSqlSession().selectList("getDeviceListForPolicyByClientGroupIdx", map);
	}
	
	@Override
	public void removeDevice(ClientMastVO clientMast) {
		getSqlSession().update("removeDevice", clientMast);
	}
	
	@Override
	public void renameDevice(ClientMastVO clientMast) {
		getSqlSession().update("renameDevice", clientMast);
	}
	
	@Override
	public void updateDeleteKey(ClientMastVO clientMast) {
		getSqlSession().update("updateDeleteKey", clientMast);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> searchDeviceList(String option, String search_str) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("option", option);
		map.put("search_str", search_str);
		
		return getSqlSession().selectList("searchDeviceList", map);
	}
	
	@Override
	public void addDeviceHistory(int client_idx) {
		getSqlSession().insert("addDeviceHistory", client_idx);
	}
	
	@Override
	public void applyPolicy(int policy_idx, int sim_flag, int[] client_idxValues) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("policy_idx", policy_idx);
		map.put("sim_flag", sim_flag);
		map.put("client_idxValues", client_idxValues);
		getSqlSession().update("applyPolicy", map);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ClientMastVO> getDeviceListByPolicyIdx(int policynow_idx, int nowsim_flag) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("policynow_idx", policynow_idx);
		if(nowsim_flag != CommonConstant.UNCHECKED_SIM_FLAG){
			map.put("nowsim_flag", nowsim_flag);
		}
		return getSqlSession().selectList("getDeviceListByPolicyIdx", map);
	}

	@Override
	public List<ClientMastVO> getInertClient() throws Throwable {
		// TODO Auto-generated method stub
		return (List<ClientMastVO>)getSqlSession().selectList("getInertClient");
	}

	@Override
	public List<ClientMastVO> getLimitHistoryList(String value)
			throws Throwable {
		// TODO Auto-generated method stub
		return (List<ClientMastVO>)getSqlSession().selectList("getLimitHistoryList",value);
	}

	@Override
	public List<ClientMastVO> getIpDuplicateList() {
		// TODO Auto-generated method stub
		return (List<ClientMastVO>)getSqlSession().selectList("getIpDuplicateClientList");
	}

	@Override
	public List<ClientMastVO> getDevicePolicyList(Integer policynow_idx,
			Integer device_option, Integer clientgrp_idx, Integer client_idx) {
		// TODO Auto-generated method stub
		logger.debug("**** getDevicePolicyList : policynow_idx : " + policynow_idx + " device_option : " + device_option + " clientgrp_idx : " + clientgrp_idx + " client_idx : " + client_idx);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("device_option", device_option);
		if (policynow_idx!= null)
			map.put("policynow_idx", policynow_idx);
		if (clientgrp_idx!= null)
			map.put("clientgrp_idx", clientgrp_idx);
		if (client_idx!= null)
			map.put("client_idx", client_idx);

		return (List<ClientMastVO>)getSqlSession().selectList("getDevicePolicyList",map);
	}

}
