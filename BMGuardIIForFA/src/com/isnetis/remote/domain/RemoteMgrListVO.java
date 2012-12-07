package com.isnetis.remote.domain;

public class RemoteMgrListVO {

	private int list_idx;
	private String create_date;
	private int client_idx;
	private int job_idx;
	private String job_kind;
	private String job_result;
	
	public int getList_idx() {
		return list_idx;
	}
	
	public void setList_idx(int list_idx) {
		this.list_idx = list_idx;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public int getClient_idx() {
		return client_idx;
	}
	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}
	public int getJob_idx() {
		return job_idx;
	}
	public void setJob_idx(int job_idx) {
		this.job_idx = job_idx;
	}
	public String getJob_kind() {
		return job_kind;
	}
	public void setJob_kind(String job_kind) {
		this.job_kind = job_kind;
	}
	public String getJob_result() {
		return job_result;
	}
	public void setJob_result(String job_result) {
		this.job_result = job_result;
	}
}
