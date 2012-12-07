package com.isnetis.policy.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.policy.domain.SystemPolicyVO;

@Repository
public class SystemPolicyDaoImp extends SqlSessionDaoSupport implements SystemPolicyDao{

	@Override
	public void addSystemPolicy(SystemPolicyVO systemPolicy) {
		getSqlSession().insert("addSystemPolicy", systemPolicy);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SystemPolicyVO> getSystemPolicyList(int policy_idx) {
		return getSqlSession().selectList("getSystemPolicyList", policy_idx);
	}

	@Override
	public void delSystemPolicy(int policy_idx) {
		getSqlSession().update("delSystemPolicy", policy_idx);
		
	}
}
