package com.isnetis.remote.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.remote.domain.RemotePrcMgrVO;

@Repository
public class RemotePrcDaoImple extends SqlSessionDaoSupport implements RemotePrcDao {

	@Override
	public int insertProcess(RemotePrcMgrVO remoteP) {
		// TODO Auto-generated method stub
		return getSqlSession().update("RemotePrc.insertPrc", remoteP);
	}

}
