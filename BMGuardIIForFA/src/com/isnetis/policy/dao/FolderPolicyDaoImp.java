package com.isnetis.policy.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.policy.domain.FolderPolicyVO;

@Repository
public class FolderPolicyDaoImp extends SqlSessionDaoSupport implements FolderPolicyDao{

	@Override
	public void addFolderPolicy(FolderPolicyVO folderPolicy) {
		getSqlSession().insert("addFolderPolicy", folderPolicy);
	}
	
	@Override
	public void delFolderPolicy(int  policy_idx) {
		getSqlSession().update("delFolderPolicy", policy_idx);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FolderPolicyVO> getFolderPolicyList(int policy_idx) {
		return getSqlSession().selectList("getFolderPolicyList", policy_idx);
	}
}
