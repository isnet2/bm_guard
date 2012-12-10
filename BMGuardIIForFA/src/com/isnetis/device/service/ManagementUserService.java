package com.isnetis.device.service;

import java.util.List;


import com.isnetis.device.domain.ManagementUserVO;

public interface ManagementUserService {

	int addManagementUser(ManagementUserVO vo, int[] clientGroupIdxValues);
	List<ManagementUserVO> getManagementUserList(int status, int[] clientGroupIdxValues);
	int deleteManagementUser(int[] userIdxValues);
	int updateManagementUser(ManagementUserVO vo, int[] clientGroupIdxValues);
	
	List<ManagementUserVO> getUserHistory(int user_idx);
	int getManagementUserCnt(String userLiginId);
}
