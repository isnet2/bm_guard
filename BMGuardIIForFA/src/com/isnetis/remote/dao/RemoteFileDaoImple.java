package com.isnetis.remote.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.remote.domain.RemoteFileMgrVO;

@Repository
public class RemoteFileDaoImple extends SqlSessionDaoSupport implements RemoteFileDao {

	@Override
	public int insertFile(RemoteFileMgrVO rFile) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("RemoteFile.insertFile", rFile);
	}

}
