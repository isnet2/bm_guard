package com.isnetis.remote.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.remote.domain.RemoteProgMgrVO;

@Repository
public class RemoteProgDaoImple extends SqlSessionDaoSupport  implements RemoteProgDao {

	@Override
	public int insertDist(RemoteProgMgrVO remoteP) {
		// TODO Auto-generated method stub
		return getSqlSession().update("RemoteProg.insertDist" , remoteP);
	}

}
