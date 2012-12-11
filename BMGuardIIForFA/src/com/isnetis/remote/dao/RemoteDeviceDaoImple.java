package com.isnetis.remote.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.remote.domain.RemoteDeviceMgrVO;

@Repository
public class RemoteDeviceDaoImple extends SqlSessionDaoSupport implements RemoteDeviceDao {

	@Override
	public int insertState(RemoteDeviceMgrVO remoteD) {
		// TODO Auto-generated method stub
		return getSqlSession().update("RemoteDevice.insertState", remoteD);
	}

}
