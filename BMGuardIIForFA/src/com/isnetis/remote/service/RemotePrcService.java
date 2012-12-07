package com.isnetis.remote.service;

import com.isnetis.remote.domain.RemoteRegMgrVO;

public interface RemotePrcService {

	int insertProcess(String process, String job_desc, String job_type,
			int user_idx);

}
