package com.isnetis.device.dao;

import java.util.List;

import com.isnetis.device.domain.ManagementGroupVO;

public interface ManagementGroupDao {

	void addManagementGroup(ManagementGroupVO vo);
	List<ManagementGroupVO> getManagementGroupForUser(int userIdx);
	List<ManagementGroupVO> getManagementGroupForUserHistory(int userIdx);
	List<ManagementGroupVO> getManagementGroupForAdmin(int userIdx);
	void deleteManagementGroup(int userIdx, String userType);
	void updateManagementGroup(int userIdx, String userType);
	void addManagementGroupHistory(int historyUserIdx, int userIdx, String userType);
	
	int deleteManagementGrp(int userIdx, String userType) throws Throwable;
	int insertManagementGrp(ManagementGroupVO group) throws Throwable;
	int insertAdminGrpHistory(ManagementGroupVO group)throws Throwable;
	List<ManagementGroupVO> getAdminGrpHistory(ManagementGroupVO group) throws Throwable;
	
	
}
