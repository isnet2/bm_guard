package com.isnetis.policy.domain;

public class MediaPolicyVO {

	private int list_idx;
	private String backup_date;
	private String media_type;
	private String method;
	private int policy_idx;
	
	public MediaPolicyVO(){}

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

	public String getMedia_type() {
		return media_type;
	}

	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public int getPolicy_idx() {
		return policy_idx;
	}

	public void setPolicy_idx(int policy_idx) {
		this.policy_idx = policy_idx;
	}
	
}
