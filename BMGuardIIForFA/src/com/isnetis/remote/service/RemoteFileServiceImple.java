package com.isnetis.remote.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.remote.dao.RemoteFileDao;
import com.isnetis.remote.dao.RemoteMgrDao;
import com.isnetis.remote.domain.RemoteFileMgrVO;
import com.isnetis.remote.domain.RemoteMgrListVO;

@Service
public class RemoteFileServiceImple implements RemoteFileService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	RemoteFileDao remoteFileDao;
	
	@Autowired
	CommonDao commonDao;
	

	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	
	@Override
	public int insertFile(String file_name, String folder_path, String job_desc,String job_type, int user_idx) throws Throwable {
		// TODO Auto-generated method stub
		int result = 0;
		int job_idx = 0;
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		RemoteFileMgrVO rFile = new RemoteFileMgrVO();
		rFile.setFile_name(file_name);
		rFile.setFolder_path(folder_path);
		rFile.setJob_desc(job_desc);
		rFile.setUser_idx(user_idx);
		rFile.setJob_type(job_type); // 생성 : create

		job_idx = commonDao.getIdx("REMOTEFILE_MGR");

		try {
			result = remoteFileDao.insertFile(rFile);
			logger.debug("$$$$$$$$ insertFile result : " + result);
			if(result != 1) {
				job_idx = 0;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return job_idx;
	}
	
}
