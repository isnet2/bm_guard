package com.isnetis.device.domain;

public class ClientGroupVO  {

	private int clientgrp_idx;
	private int invalid_flag;
	private int clientgrp_pidx;
	private String clientgrp_name;
	private String clientgrp_code;
	private int ref_count;
	private int full_path;
	
	public ClientGroupVO() {}

	public int getClientgrp_idx() {
		return clientgrp_idx;
	}

	public void setClientgrp_idx(int clientgrp_idx) {
		this.clientgrp_idx = clientgrp_idx;
	}

	public int getInvalid_flag() {
		return invalid_flag;
	}

	public void setInvalid_flag(int invalid_flag) {
		this.invalid_flag = invalid_flag;
	}

	public int getClientgrp_pidx() {
		return clientgrp_pidx;
	}

	public void setClientgrp_pidx(int clientgrp_pidx) {
		this.clientgrp_pidx = clientgrp_pidx;
	}

	public String getClientgrp_name() {
		return clientgrp_name;
	}

	public void setClientgrp_name(String clientgrp_name) {
		this.clientgrp_name = clientgrp_name;
	}

	public int getRef_count() {
		return ref_count;
	}

	public void setRef_count(int ref_count) {
		this.ref_count = ref_count;
	}

	public String getClientgrp_code() {
		return clientgrp_code;
	}

	public void setClientgrp_code(String clientgrp_code) {
		this.clientgrp_code = clientgrp_code;
	}

	public int getFull_path() {
		return full_path;
	}

	public void setFull_path(int full_path) {
		this.full_path = full_path;
	}
	
}
