package com.isnetis.device.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.isnetis.device.domain.ManagementGroupVO;

@Transactional
public interface ManagementGroupService {

	void addManagementGroup(ManagementGroupVO vo);
	void deleteManagementGroup(int historyUserIdx, int userIdx, String userType);
	void updateManagementGroup(int historyUserIdx, int userIdx, String userType);
	
	List<ManagementGroupVO> getManagementGroupHistoryList(int userIdx);
	
	
	int deleteManagementGrp(int userIdx, String userType) throws Throwable;
	int insertManagementGrp(ManagementGroupVO group) throws Throwable;
	List<ManagementGroupVO> getAdminGrpHistory(ManagementGroupVO group)  throws Throwable;
	int  insertAdminGrpHistory (ManagementGroupVO group) throws Throwable;
	
	
}
