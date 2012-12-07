package com.isnetis.device.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.common.service.TempService;
import com.isnetis.device.dao.ClientGroupDao;
import com.isnetis.device.dao.ClientMastDao;
import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ClientMastVO;

@Service
public class ClientGroupServiceImp implements ClientGroupService{
	
	@Autowired
	private CommonDao commonDao;
	@Autowired
	private ClientGroupDao clientGroupDao;
	@Autowired
	private ClientMastDao clientMastDao;
	@Autowired
	private TempService tempService;
	
	@Override
	public List<ClientGroupVO> getClientGroupList(int clientgrp_pidx){
		return clientGroupDao.getClientGroupList(clientgrp_pidx);
	}

	@Override
	public void removeGroup(int clientgrp_idx) {
		clientGroupDao.deleteGroup(clientgrp_idx);
		clientGroupDao.decreaseRefCount(clientgrp_idx);
		// 통계작업을 위한 TEMP_T 테이블 초기화
		tempService.init_grp_temp();
	}

	@Override
	public void renameGroup(ClientGroupVO vo) {
		clientGroupDao.renameGroup(vo);
	}

	@Override
	public int createGroup(ClientGroupVO vo) {
		int idx = commonDao.getIdx("clientgrp_list");
		vo.setClientgrp_idx(idx);
		clientGroupDao.insertClientGroup(vo);
		clientGroupDao.increaseRefCount(vo.getClientgrp_pidx());
		// 통계작업을 위한 TEMP_T 테이블 초기화
		tempService.init_grp_temp();
		return idx;
	}
	
	@Override
	public List<ClientMastVO> getDeviceList(int clientgrp_idx) {
		return clientMastDao.getDeviceList(clientgrp_idx);
	}

	@Override
	public List<String> searchDeviceList(String option, String searchStr) {
		return  clientMastDao.searchDeviceList(option, searchStr);
	}
}
