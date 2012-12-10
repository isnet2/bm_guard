package com.isnetis.policy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.policy.domain.PolicyMastVO;

@Repository
public class PolicyMastDaoImp extends SqlSessionDaoSupport implements PolicyMastDao{ 

	@Override
	public void addPolicy(PolicyMastVO policyMast) {
		getSqlSession().insert("addPolicy", policyMast);
	}
	
	@Override
	public void addOsType(int policy_idx, String os_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("policy_idx", policy_idx);
		map.put("os_type", os_type);
		getSqlSession().insert("addOsType", map);
	}
	
	@Override
	public PolicyMastVO getPolicyInfo(int policy_idx) {
		return (PolicyMastVO)getSqlSession().selectOne("getPolicyInfo", policy_idx);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PolicyMastVO> getPolicyMastList() {
		return getSqlSession().selectList("getPolicyMastList");
	}
	
	@Override
	public void deletePolicyFile(int policy_idx) {
		getSqlSession().delete("deletePolicyFile", policy_idx);
	}
	
	@Override
	public void addPolicyFile(Map<String, String> map) {
		getSqlSession().insert("addPolicyFile", map);
	}
	
	@Override
	public void addPolicyApplyClient(int policy_idx, int sim_flag, int client_idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("policy_idx", policy_idx);
		map.put("sim_mode", sim_flag);
		map.put("client_idx", client_idx);
		
		getSqlSession().insert("addPolicyApplyClient", map);
	}

	@Override
	public void deletePolicy(int policy_idx) {
		getSqlSession().update("deletePolicy", policy_idx);
	}

	@Override
	public void addPolicyHistory(int policy_idx) {
		getSqlSession().update("addPolicyHistory", policy_idx);
	}

	@Override
	public void delOsType(int policy_idx) {
		// TODO Auto-generated method stub
		 getSqlSession().update("delOsType", policy_idx);
	}

	@Override
	public void updatePolicy(PolicyMastVO policy) {
		 getSqlSession().update("updatePolicy", policy);
		
	}

	@Override
	public List<PolicyMastVO> getNowPolicyMastList() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("getNowPolicyMastList");
	}
}
