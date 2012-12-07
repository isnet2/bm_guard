package com.isnetis.monitor.domain;

public class ClientLimitMastVO {
	private String create_date;
	private String update_date;
	private int cpu_limit;
	private int memory_limit;
	private int disk_limit;
	private String createuser_idx;
	private String updateuser_idx;
	private int acquist_term;
	private String acquist_edate;
	
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public int getCpu_limit() {
		return cpu_limit;
	}
	public void setCpu_limit(int cpu_limit) {
		this.cpu_limit = cpu_limit;
	}
	public int getMemory_limit() {
		return memory_limit;
	}
	public void setMemory_limit(int memory_limit) {
		this.memory_limit = memory_limit;
	}
	public int getDisk_limit() {
		return disk_limit;
	}
	public void setDisk_limit(int disk_limit) {
		this.disk_limit = disk_limit;
	}
	public String getCreateuser_idx() {
		return createuser_idx;
	}
	public void setCreateuser_idx(String createuser_idx) {
		this.createuser_idx = createuser_idx;
	}
	public String getUpdateuser_idx() {
		return updateuser_idx;
	}
	public void setUpdateuser_idx(String updateuser_idx) {
		this.updateuser_idx = updateuser_idx;
	}
	public int getAcquist_term() {
		return acquist_term;
	}
	public void setAcquist_term(int acquist_term) {
		this.acquist_term = acquist_term;
	}
	public String getAcquist_edate() {
		return acquist_edate;
	}
	public void setAcquist_edate(String acquist_edate) {
		this.acquist_edate = acquist_edate;
	}
	
}
