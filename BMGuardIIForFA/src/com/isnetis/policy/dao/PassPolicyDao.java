package com.isnetis.policy.dao;

import java.util.List;

import com.isnetis.policy.domain.PassPolicyVO;

public interface PassPolicyDao {

	void addPassPolicy(PassPolicyVO passPolicy);
	List<PassPolicyVO> getPassPolicyList(int policy_idx);
	void delPassPolicy(int policy_idx);
}
