package com.isnetis.device.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ClientMastVO;

@Transactional
public interface ClientGroupService {

	List<ClientGroupVO> getClientGroupList(int clientgrp_pidx);
	void removeGroup(int idx);
	void renameGroup(ClientGroupVO vo);
	int createGroup(ClientGroupVO vo);
	List<ClientMastVO> getDeviceList(int clientgrp_idx);
	List<String> searchDeviceList(String option, String searchStr);
}
