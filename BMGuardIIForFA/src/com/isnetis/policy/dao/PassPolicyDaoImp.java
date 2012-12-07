package com.isnetis.policy.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.policy.domain.PassPolicyVO;

@Repository
public class PassPolicyDaoImp extends SqlSessionDaoSupport implements PassPolicyDao{

	@Override
	public void addPassPolicy(PassPolicyVO passPolicy) {
		getSqlSession().insert("addPassPolicy", passPolicy);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PassPolicyVO> getPassPolicyList(int policy_idx) {
		return getSqlSession().selectList("getPassPolicyList", policy_idx);
	}

	@Override
	public void delPassPolicy(int policy_idx) {
		getSqlSession().update("delPassPolicy", policy_idx);
		
	}
}
