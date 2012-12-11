package com.isnetis.remote.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.remote.dao.RemoteDeviceDao;
import com.isnetis.remote.domain.RemoteDeviceMgrVO;

@Service
public class RemoteDeviceServiceImple implements RemoteDeviceService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	RemoteDeviceDao remoteDeviceDao;
	
	@Autowired
	CommonDao commonDao;
	
	@Override
	public int insertState(RemoteDeviceMgrVO remoteD) {
		// TODO Auto-generated method stub
		int job_idx =0;
		int result =0;
		try {
			job_idx = commonDao.getIdx("REMOTEDEVICE_MGR");
			result = remoteDeviceDao.insertState(remoteD);
			if(result ==0) job_idx =0;
		} catch (Exception e) {
			// TODO: handle exception
			job_idx = 0;
 			e.printStackTrace();
		}
		return job_idx;
	}

}
