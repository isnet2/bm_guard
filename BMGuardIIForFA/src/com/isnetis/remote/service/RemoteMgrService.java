package com.isnetis.remote.service;

public interface RemoteMgrService {

	int insertResult(int job_idx, int client_idx, String job_kind,
			String job_result, int user_idx);

	
}
