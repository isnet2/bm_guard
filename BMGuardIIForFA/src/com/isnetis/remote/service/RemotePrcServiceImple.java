package com.isnetis.remote.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.remote.dao.RemotePrcDao;
import com.isnetis.remote.domain.RemotePrcMgrVO;

@Service
public class RemotePrcServiceImple implements RemotePrcService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	RemotePrcDao remotePrcDao;
	
	@Autowired
	CommonDao commonDao;
	
	@Override
	public int insertProcess(String process, String job_desc, String job_type,
			int user_idx) {
		// TODO Auto-generated method stub
		int job_idx =0;
		int result = 0;
		RemotePrcMgrVO remoteP = new RemotePrcMgrVO();
		remoteP.setProcess_name(process);
		remoteP.setJob_type(job_type);
		remoteP.setJob_desc(job_desc);
		try {
			job_idx = commonDao.getIdx("REMOTEPRC_MGR");
			result = remotePrcDao.insertProcess(remoteP);
			logger.debug("********* insertProcess : job_idx " + job_idx);
			if(result == 0)
				job_idx = 0;
		}catch(Exception e) {
			job_idx = 0;
			e.printStackTrace();
		}
		return job_idx;
	}

}
