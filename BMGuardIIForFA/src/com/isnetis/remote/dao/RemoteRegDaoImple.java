package com.isnetis.remote.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.isnetis.remote.domain.RemoteRegMgrVO;

@Repository
public class RemoteRegDaoImple extends SqlSessionDaoSupport implements RemoteRegDao {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public int insertRegistry(RemoteRegMgrVO remoteR) {
		// TODO Auto-generated method stub
		return getSqlSession().update("RemoteReg.insertReg", remoteR);
	}
}
