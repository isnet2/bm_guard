package com.isnetis.policy.domain;

public class SystemPolicyVO {

	private int list_idx;
	private String backup_date;
	private String process_name;
	private int policy_idx;
	
	public SystemPolicyVO(){}

	public int getList_idx() {
		return list_idx;
	}

	public void setList_idx(int list_idx) {
		this.list_idx = list_idx;
	}

	public String getBackup_date() {
		return backup_date;
	}

	public void setBackup_date(String backup_date) {
		this.backup_date = backup_date;
	}

	public String getProcess_name() {
		return process_name;
	}

	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}

	public int getPolicy_idx() {
		return policy_idx;
	}

	public void setPolicy_idx(int policy_idx) {
		this.policy_idx = policy_idx;
	}
	
}
