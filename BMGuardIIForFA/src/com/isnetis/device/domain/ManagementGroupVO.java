package com.isnetis.device.domain;


public class ManagementGroupVO {

	private int user_idx;
	private int clientgrp_idx;
	private String clientgrp_name;
	private String user_type;
	private int history_idx;
	private int history_user_idx;
	
	public ManagementGroupVO(){}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getClientgrp_idx() {
		return clientgrp_idx;
	}

	public void setClientgrp_idx(int clientgrp_idx) {
		this.clientgrp_idx = clientgrp_idx;
	}

	public String getClientgrp_name() {
		return clientgrp_name;
	}

	public void setClientgrp_name(String clientgrp_name) {
		this.clientgrp_name = clientgrp_name;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public int getHistory_idx() {
		return history_idx;
	}

	public void setHistory_idx(int history_idx) {
		this.history_idx = history_idx;
	}

	public int getHistory_user_idx() {
		return history_user_idx;
	}

	public void setHistory_user_idx(int history_user_idx) {
		this.history_user_idx = history_user_idx;
	}

	
	
}
