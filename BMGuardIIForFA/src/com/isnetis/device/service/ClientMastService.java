package com.isnetis.device.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.isnetis.device.domain.ClientMastVO;

@Transactional
public interface ClientMastService {

	int addDevice(ClientMastVO clientMast);
	void addDeleteKey(int idx);
	List<ClientMastVO> getDeleteHistory(Map<String, String> map);
	void renameDevice(ClientMastVO clientMast);
	void removeDevice(ClientMastVO clientMast);
	//List<ClientMastVO> searchDeviceList(String option, String search_str);
	List<ClientMastVO> getInertClient() throws Throwable;
	List<ClientMastVO> getLimitHistoryList(String value) throws Throwable;
	List<ClientMastVO> getIpDuplicateList();
	List<ClientMastVO> getDeviceList(int clientgrp_idx);
	int insertAllDevice(HashMap<Integer, String> map);
}
