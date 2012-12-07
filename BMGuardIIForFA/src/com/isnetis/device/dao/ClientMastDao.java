package com.isnetis.device.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.isnetis.device.domain.ClientMastVO;

public interface ClientMastDao {

	void addDevice(ClientMastVO clientMast);
	void addDeleteKey(ClientMastVO clientMast);
	List<ClientMastVO> getDeleteHistory(Map<String, String> map);
	ClientMastVO getDeviceInfoForPolicyByClientIdx(int client_idx);
	List<ClientMastVO> getDeviceList(int clientgrp_idx);
	List<ClientMastVO> getDeviceListForPolicyByClientGroupIdx(int clientgrp_idx, int nowsim_flag);
	List<String> searchDeviceList(String option, String search_str);
	void removeDevice(ClientMastVO clientMast);
	void renameDevice(ClientMastVO clientMast);
	void applyPolicy(int policy_idx, int sim_flag, int[] client_idxValues);
	void addDeviceHistory(int client_idx);
	List<ClientMastVO> getDeviceListByPolicyIdx(int policynow_idx, int nowsim_flag);
	List<ClientMastVO> getInertClient() throws Throwable;
	List<ClientMastVO> getLimitHistoryList(String value) throws Throwable;
	List<ClientMastVO> getIpDuplicateList();
	public void updateDeleteKey(ClientMastVO clientMast);
	List<ClientMastVO> getDevicePolicyList(Integer policynow_idx, Integer device_option, Integer clientgrp_idx, Integer client_idx);

	
}
