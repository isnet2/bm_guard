package com.isnetis.remote.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.remote.dao.RemoteProgDao;
import com.isnetis.remote.domain.RemoteProgMgrVO;

@Service
public class RemoteProgServiceImple implements RemoteProgService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	RemoteProgDao remoteProgDao;
	
	@Autowired
	CommonDao commonDao;
	
	@Override
	public int insertDist(RemoteProgMgrVO remoteP) {
		// TODO Auto-generated method stub
		int job_idx = 0;
		int result = 0;
		try {
			job_idx = commonDao.getIdx("REMOTEPROG_MGR");
			result =  remoteProgDao.insertDist(remoteP);
			if (result == 0) job_idx = 0;
		} catch (Exception e) {
			job_idx = 0;
			e.printStackTrace();
			// TODO: handle exception
		}
		return job_idx;
	}
	
}
