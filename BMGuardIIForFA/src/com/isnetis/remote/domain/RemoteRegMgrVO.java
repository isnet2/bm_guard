package com.isnetis.remote.domain;

public class RemoteRegMgrVO {

	private int job_idx;
	private String create_date;
	private String key_name;
	private String subkey_name;
	private String value_name;
	private String data_type;
	private String reg_value;
	private String job_desc;
	private String job_type;
	private int user_idx;
	private int client_idx;
	
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
	public String getKey_name() {
		return key_name;
	}
	public void setKey_name(String key_name) {
		this.key_name = key_name;
	}
	public String getSubkey_name() {
		return subkey_name;
	}
	public void setSubkey_name(String subkey_name) {
		this.subkey_name = subkey_name;
	}
	public String getValue_name() {
		return value_name;
	}
	public void setValue_name(String value_name) {
		this.value_name = value_name;
	}
	public String getData_type() {
		return data_type;
	}
	public void setData_type(String data_type) {
		this.data_type = data_type;
	}
	public String getReg_value() {
		return reg_value;
	}
	public void setReg_value(String reg_value) {
		this.reg_value = reg_value;
	}
	public String getJob_desc() {
		return job_desc;
	}
	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getClient_idx() {
		return client_idx;
	}
	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}

}
