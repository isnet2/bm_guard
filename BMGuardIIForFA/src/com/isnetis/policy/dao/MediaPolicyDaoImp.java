package com.isnetis.policy.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.policy.domain.MediaPolicyVO;

@Repository
public class MediaPolicyDaoImp extends SqlSessionDaoSupport implements MediaPolicyDao{

	@Override
	public void addMediaPolicy(MediaPolicyVO mediaPolicy) {
		getSqlSession().insert("addMediaPolicy", mediaPolicy);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MediaPolicyVO> getMediaPolicyList(int policy_idx) {
		return getSqlSession().selectList("getMediaPolicyList", policy_idx);
	}

	@Override
	public void delMediaPolicy(int policy_idx) {
		getSqlSession().update("delMediaPolicy", policy_idx);
		
	}
}
