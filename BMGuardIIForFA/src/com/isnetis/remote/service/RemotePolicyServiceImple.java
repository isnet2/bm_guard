package com.isnetis.remote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.remote.dao.RemotePolicyDao;
import com.isnetis.remote.dao.RemoteServiceDao;
import com.isnetis.remote.domain.RemotePolicyMgrVO;

@Service
public class RemotePolicyServiceImple implements RemotePolicyService {

	@Autowired
	CommonDao commonDao;
	
	@Autowired
	RemotePolicyDao remotePolicyDao;
	
	@Override
	public int insertPolicy(RemotePolicyMgrVO remotePolicy) {
		// TODO Auto-generated method stub
		int job_idx =0;
		int result =0;
		 try {
			job_idx = commonDao.getIdx("REMOTEPOLICY_MGR");
			result = remotePolicyDao.insertPolicy(remotePolicy);
			if(result ==0) job_idx =0;
		} catch (Exception e) {
			// TODO: handle exception
			job_idx =0;
			e.printStackTrace();
		}

		 return job_idx;
	}

}
