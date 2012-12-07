package com.isnetis.policy.domain;

public class FolderPolicyVO {
	private int list_idx;
	private String backup_date;
	private String bmfolder_path;
	private String comp_name;
	private String folder_info;
	private int policy_idx;
	
	public FolderPolicyVO(){}
	
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
	public String getBmfolder_path() {
		return bmfolder_path;
	}
	public void setBmfolder_path(String bmfolder_path) {
		this.bmfolder_path = bmfolder_path;
	}
	public String getComp_name() {
		return comp_name;
	}
	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}
	public String getFolder_info() {
		return folder_info;
	}
	public void setFolder_info(String folder_info) {
		this.folder_info = folder_info;
	}
	public int getPolicy_idx() {
		return policy_idx;
	}
	public void setPolicy_idx(int policy_idx) {
		this.policy_idx = policy_idx;
	}
	
}
