package com.isnetis.remote.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.remote.dao.RemoteMgrDao;
import com.isnetis.remote.domain.RemoteMgrListVO;


@Service
public class RemoteMgrServiceImple implements RemoteMgrService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	RemoteMgrDao remoteMgrDao;
	
	@Override
	public int insertResult(int job_idx, int client_idx, String job_kind,
			String job_result, int user_idx) {
		// TODO Auto-generated method stub
		int result = 0;
		RemoteMgrListVO remoteR = new RemoteMgrListVO();
		remoteR.setJob_idx(job_idx);
		remoteR.setClient_idx(client_idx);
		remoteR.setJob_kind(job_kind);
		remoteR.setJob_result(job_result);
		try {
			result = remoteMgrDao.insertResult(remoteR);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
