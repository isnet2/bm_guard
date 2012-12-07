package com.isnetis.policy.dao;

import java.util.List;
import java.util.Map;

import com.isnetis.policy.domain.PolicyMastVO;

public interface PolicyMastDao {

	void addPolicy(PolicyMastVO policyMast);
	void addOsType(int policy_idx, String os_type);
	List<PolicyMastVO> getPolicyMastList();
	PolicyMastVO getPolicyInfo(int policy_idx);
	
	void addPolicyFile(Map<String, String> map);
	void addPolicyApplyClient(int policy_idx, int sim_flag, int client_idx);
	int deletePolicy(int policy_idx);
	int addPolicyHistory(int policy_idx);
	void delOsType(int policy_idx);
	void updatePolicy(PolicyMastVO policy);
	List<PolicyMastVO> getNowPolicyMastList();
}
