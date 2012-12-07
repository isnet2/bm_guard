package com.isnetis.policy.dao;

import java.util.List;

import com.isnetis.policy.domain.MediaPolicyVO;

public interface MediaPolicyDao {

	void addMediaPolicy(MediaPolicyVO mediaPolicy);
	List<MediaPolicyVO> getMediaPolicyList(int policy_idx);
	void delMediaPolicy(int policy_idx);
}
