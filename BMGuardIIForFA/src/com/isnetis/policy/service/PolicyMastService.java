package com.isnetis.policy.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.policy.domain.PolicyMastVO;

@Transactional
public interface PolicyMastService {

	int addPolicy(PolicyMastVO policyMast);
	List<PolicyMastVO> getPolicyMastList();
	PolicyMastVO getPolicyInfo(int policy_idx);
	List<ClientMastVO> getDeviceListForPolicy(int clientgrp_idx, int nowsim_flag);
	ClientMastVO getDeviceForPolicy(int client_idx);
	void applyPolicy(int policy_idx, int sim_flag, int[] client_idxValues);
	List<ClientMastVO> getDeviceListByPolicyIdx(Integer policynow_idx, Integer nowsim_flag);
	List<ClientMastVO> getDevicePolicyList(Integer policynow_idx, Integer device_option, Integer clientgrp_idx, Integer client_idx);
	void deletePolicy(int policy_idx);
	void addPolicyHistory(int policy_idx);
	void changePolicy(PolicyMastVO policy);
	List<PolicyMastVO> getNowPolicyMastList();
	void applyPolicyString(int policy_idx, String client_idxs);
	void applyPolicyOne(int policy_idx, int client_idx);
}

