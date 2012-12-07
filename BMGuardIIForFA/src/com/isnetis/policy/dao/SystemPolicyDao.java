package com.isnetis.policy.dao;

import java.util.List;

import com.isnetis.policy.domain.SystemPolicyVO;

public interface SystemPolicyDao {

	void addSystemPolicy(SystemPolicyVO systemPolicy);
	List<SystemPolicyVO> getSystemPolicyList(int policy_idx);
	void delSystemPolicy(int policy_idx);
}
