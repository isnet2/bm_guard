package com.isnetis.policy.service;

import org.springframework.transaction.annotation.Transactional;

import com.isnetis.policy.domain.PolicyMastVO;

@Transactional
public interface PolicyFileService {

	 void insertPoliceFile(PolicyMastVO policy);
	 void deletePolicyFile(int policy_idx);

}
