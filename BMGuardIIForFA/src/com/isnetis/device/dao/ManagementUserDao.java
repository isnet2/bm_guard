package com.isnetis.device.dao;

import java.util.List;

import com.isnetis.device.domain.ManagementUserVO;
import com.isnetis.user.domain.UserMastVO;

public interface ManagementUserDao {

	void addManagementUser(ManagementUserVO vo);
	List<ManagementUserVO> getManagementUserList(int status, int[] clientGroupIdxValues);
	void deleteManagementUser(int userIdx);
	void addManagementUserHistory(int userIdx);	
	UserMastVO getUserInfo(int userIdx);
	void updateManagementUser(ManagementUserVO vo);

	List<ManagementUserVO> getUserHistory(int userIdx);
	int getManagementUserCnt(String userLiginId);
}
