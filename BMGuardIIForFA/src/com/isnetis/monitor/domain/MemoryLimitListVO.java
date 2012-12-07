package com.isnetis.monitor.domain;

public class MemoryLimitListVO {
	private int client_idx;
	private int used_memory;
	private String client_name;
	public int getClient_idx() {
		return client_idx;
	}
	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}
	public int getUsed_memory() {
		return used_memory;
	}
	public void setUsed_memory(int used_memory) {
		this.used_memory = used_memory;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	

}
