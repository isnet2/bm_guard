package com.isnetis.remote.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.remote.domain.RemoteMgrListVO;

@Repository
public class RemoteMgrDaoImple extends SqlSessionDaoSupport implements RemoteMgrDao {

	@Override
	public int insertResult(RemoteMgrListVO remoteR) {
		// TODO Auto-generated method stub
		return getSqlSession().update("RemoteMgrList.insertResult", remoteR);
	}

}
