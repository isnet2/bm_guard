package com.isnetis.monitor.domain;

public class DiskLimitListVO {
	private int client_idx;
	private int used_disk;
	private String client_name;
	public int getClient_idx() {
		return client_idx;
	}
	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}
	public int getUsed_disk() {
		return used_disk;
	}
	public void setUsed_disk(int used_disk) {
		this.used_disk = used_disk;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	
}
