package com.isnetis.monitor.domain;

public class MainClientListVO {

	private int client_idx;
	private String send_term;
	private int used_cpu;
	private int used_memory;
	private int free_memory;
	private int used_disk;
	private int free_disk;
	private String client_name;
	
	public int getClient_idx() {
		return client_idx;
	}
	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}
	public String getSend_term() {
		return send_term;
	}
	public void setSend_term(String send_term) {
		this.send_term = send_term;
	}
	public int getUsed_cpu() {
		return used_cpu;
	}
	public void setUsed_cpu(int used_cpu) {
		this.used_cpu = used_cpu;
	}
	public int getUsed_memory() {
		return used_memory;
	}
	public void setUsed_memory(int used_memory) {
		this.used_memory = used_memory;
	}
	public int getFree_memory() {
		return free_memory;
	}
	public void setFree_memory(int free_memory) {
		this.free_memory = free_memory;
	}
	public int getUsed_disk() {
		return used_disk;
	}
	public void setUsed_disk(int used_disk) {
		this.used_disk = used_disk;
	}
	public int getFree_disk() {
		return free_disk;
	}
	public void setFree_disk(int free_disk) {
		this.free_disk = free_disk;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	
	
}
