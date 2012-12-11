package com.isnetis.remote.domain;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.remote.dao.RemotePolicyDao;

@Repository
public class RemotePolicyDaoImple extends SqlSessionDaoSupport implements RemotePolicyDao {

	@Override
	public int insertPolicy(RemotePolicyMgrVO remotePolicy) {
		// TODO Auto-generated method stub
		return getSqlSession().update("RemotePolicy.insertPolicy",remotePolicy);
	}

}
