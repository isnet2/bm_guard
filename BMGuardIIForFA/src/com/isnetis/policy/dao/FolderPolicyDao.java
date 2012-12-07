package com.isnetis.policy.dao;

import java.util.List;

import com.isnetis.policy.domain.FolderPolicyVO;

public interface FolderPolicyDao {

	void addFolderPolicy(FolderPolicyVO folderPolicy);
	List<FolderPolicyVO> getFolderPolicyList(int policy_idx);
	void delFolderPolicy(int policy_idx);
}
