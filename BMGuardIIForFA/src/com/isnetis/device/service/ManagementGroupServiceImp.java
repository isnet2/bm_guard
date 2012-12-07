package com.isnetis.device.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.domain.CommonConstant;
import com.isnetis.device.dao.ManagementGroupDao;
import com.isnetis.device.domain.ManagementGroupVO;

@Service
public class ManagementGroupServiceImp implements ManagementGroupService{

	@Autowired
	private ManagementGroupDao managementGroupDao;
	
	@Override
	public void addManagementGroup(ManagementGroupVO vo) {
		managementGroupDao.addManagementGroup(vo);
		
	}
	@Override
	public void deleteManagementGroup(int historyUserIdx, int userIdx, String userType) {
		managementGroupDao.addManagementGroupHistory(historyUserIdx, userIdx, CommonConstant.MANAGEMENT_USER_TYPE);
		managementGroupDao.updateManagementGroup(userIdx, CommonConstant.MANAGEMENT_USER_TYPE);
	}
	@Override
	public void updateManagementGroup(int historyUserIdx, int userIdx, String userType) {
		managementGroupDao.addManagementGroupHistory(historyUserIdx, userIdx, userType);
		managementGroupDao.deleteManagementGroup(userIdx, CommonConstant.MANAGEMENT_USER_TYPE);
	}
	
	@Override
	public List<ManagementGroupVO> getManagementGroupHistoryList(int userIdx) {
		return managementGroupDao.getManagementGroupForUserHistory(userIdx);
	}
	@Override
	public int deleteManagementGrp(int userIdx, String userType) throws Throwable {
		// TODO Auto-generated method stub
		return managementGroupDao.deleteManagementGrp(userIdx, userType);
	}
	@Override
	public int insertManagementGrp(ManagementGroupVO group) throws Throwable {
		// TODO Auto-generated method stub
		return managementGroupDao.insertManagementGrp(group);
	}
	@Override
	public List<ManagementGroupVO> getAdminGrpHistory(ManagementGroupVO group)
			throws Throwable {
		// TODO Auto-generated method stub
		return managementGroupDao.getAdminGrpHistory(group);
	}
	@Override
	public int insertAdminGrpHistory(ManagementGroupVO group) throws Throwable {
		// TODO Auto-generated method stub
		return managementGroupDao.insertAdminGrpHistory( group);
	}
}
