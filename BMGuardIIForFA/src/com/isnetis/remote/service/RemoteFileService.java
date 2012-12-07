package com.isnetis.remote.service;


public interface RemoteFileService {

	int insertFile(String file_name, String folder_path, String job_desc, String job_type, int user_idx) throws Throwable;

}
