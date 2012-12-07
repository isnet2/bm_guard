package com.isnetis.device.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.common.domain.CommonConstant;
import com.isnetis.device.dao.ManagementGroupDao;
import com.isnetis.device.dao.ManagementUserDao;
import com.isnetis.device.domain.ManagementGroupVO;
import com.isnetis.device.domain.ManagementUserVO;

@Service
public class ManagementUserServiceImp implements ManagementUserService{

	@Autowired
	private CommonDao commonDao;
	@Autowired
	private ManagementUserDao managementUserDao;
	@Autowired
	private ManagementGroupService managementGroupService;
	
	@Inject
	private PlatformTransactionManager tx;
	
	@Override
	public int addManagementUser(ManagementUserVO managementUserVo, int[] clientGroupIdxValues) {
		TransactionStatus status = tx.getTransaction(new DefaultTransactionDefinition());
		int idx = commonDao.getIdx("managementuser_mast");
		managementUserVo.setUser_idx(idx);
		int result = 0;
		try {

			managementUserDao.addManagementUser(managementUserVo);
			
			for(int clientGroupIdx : clientGroupIdxValues){
				ManagementGroupVO managementGroup = new ManagementGroupVO();
				managementGroup.setUser_idx(idx);
				managementGroup.setClientgrp_idx(clientGroupIdx);
				managementGroup.setUser_type(CommonConstant.MANAGEMENT_USER_TYPE);
				
				managementGroupService.addManagementGroup(managementGroup);
			}
			tx.commit(status);
			result = 1;
		}catch(Exception e) {
			tx.rollback(status);
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public List<ManagementUserVO> getManagementUserList(int status, int[] clientGroupIdxValues) {
		return managementUserDao.getManagementUserList(status, clientGroupIdxValues);
	}
	
	@Override
	public int deleteManagementUser(int[] userIdxValues) {
		int result = 0;
		try {
			for(int userIdx : userIdxValues){
				int idx = commonDao.getIdx("managementuser_mast_history");
				managementUserDao.deleteManagementUser(userIdx);
				managementUserDao.addManagementUserHistory(userIdx);
				managementGroupService.deleteManagementGroup(idx, userIdx, CommonConstant.MANAGEMENT_USER_TYPE);
			}
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public int updateManagementUser(ManagementUserVO vo, int[] clientGroupIdxValues) {
		TransactionStatus status = tx.getTransaction(new DefaultTransactionDefinition());
		int idx = commonDao.getIdx("managementuser_mast_history");
		int result =0;
		try {
			managementUserDao.addManagementUserHistory(vo.getUser_idx());
			managementUserDao.updateManagementUser(vo);
			
			managementGroupService.updateManagementGroup(idx, vo.getUser_idx(), CommonConstant.MANAGEMENT_USER_TYPE);
			for(int clientGroupIdx : clientGroupIdxValues){
				ManagementGroupVO managementGroup = new ManagementGroupVO();
				managementGroup.setUser_idx(vo.getUser_idx());
				managementGroup.setClientgrp_idx(clientGroupIdx);
				managementGroup.setUser_type(CommonConstant.MANAGEMENT_USER_TYPE);
				
				managementGroupService.addManagementGroup(managementGroup);
			}
			tx.commit(status);
			result = 1;
		}catch(Exception e) {
			tx.rollback(status);
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public List<ManagementUserVO> getUserHistory(int user_idx) {
		List<ManagementUserVO> userList = managementUserDao.getUserHistory(user_idx);
		
		for(ManagementUserVO user : userList){
			int historyUserIdx = user.getUser_idx();
			List<ManagementGroupVO> groupList = managementGroupService.getManagementGroupHistoryList(historyUserIdx);
			user.setManagementGroupList(groupList);
		}
		return userList;
	}

	@Override
	public int getManagementUserCnt(String userLiginId) {
		// TODO Auto-generated method stub
		return  managementUserDao.getManagementUserCnt(userLiginId);
	}

}
