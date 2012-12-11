package com.isnetis.remote.domain;

public class RemoteProgMgrVO {

   private int  job_idx;
   private String create_date;
   private String file_name;
   private String job_desc;
   private int user_idx;
   private int client_idx;
   private  RemoteMgrListVO remoteMgr;
   
	public int getJob_idx() {
		return job_idx;
	}
	public void setJob_idx(int job_idx) {
		this.job_idx = job_idx;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getJob_desc() {
		return job_desc;
	}
	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public void setRemoteMgrList(RemoteMgrListVO remoteMgr ) {
		this.remoteMgr = remoteMgr;
	}
	public RemoteMgrListVO getRemoteMgrList(){
		return remoteMgr;
	}
	public int getClient_idx() {
		return client_idx;
	}
	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}
}
