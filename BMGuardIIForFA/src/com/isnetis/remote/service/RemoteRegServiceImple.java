package com.isnetis.remote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.remote.dao.RemoteRegDao;
import com.isnetis.remote.domain.RemoteRegMgrVO;

@Service
public class RemoteRegServiceImple implements RemoteRegService {

	@Autowired
	RemoteRegDao remoteRegDao;
	
	@Autowired
	CommonDao commonDao;
	
	@Override
	public int insertRegistry(RemoteRegMgrVO remoteR) {
		// TODO Auto-generated method stub
		int job_idx = 0;
		int result = 0;
		try {
			job_idx =commonDao.getIdx("REMOTEREG_MGR");
			result = remoteRegDao.insertRegistry(remoteR);
			
		} catch (Exception e) {
			// TODO: handle exception
			job_idx = 0;
			e.printStackTrace();
		}
		return job_idx;
	}

}
