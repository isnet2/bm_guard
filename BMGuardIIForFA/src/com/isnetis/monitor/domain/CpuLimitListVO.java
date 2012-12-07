package com.isnetis.monitor.domain;

public class CpuLimitListVO {

	private int client_idx;
	private int used_cpu;
	private String client_name;
	public int getClient_idx() {
		return client_idx;
	}
	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}
	public int getUsed_cpu() {
		return used_cpu;
	}
	public void setUsed_cpu(int used_cpu) {
		this.used_cpu = used_cpu;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	

	
	
}
