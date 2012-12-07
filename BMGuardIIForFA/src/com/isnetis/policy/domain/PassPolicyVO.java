package com.isnetis.policy.domain;

public class PassPolicyVO {

	private int list_idx;
	private String process_name;
	private String comp_name;
	private String passpr_info;
	private int policy_idx;
	
	public PassPolicyVO(){}

	public int getList_idx() {
		return list_idx;
	}

	public void setList_idx(int list_idx) {
		this.list_idx = list_idx;
	}

	public String getProcess_name() {
		return process_name;
	}

	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}

	public String getComp_name() {
		return comp_name;
	}

	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}

	public String getPasspr_info() {
		return passpr_info;
	}

	public void setPasspr_info(String passpr_info) {
		this.passpr_info = passpr_info;
	}

	public int getPolicy_idx() {
		return policy_idx;
	}

	public void setPolicy_idx(int policy_idx) {
		this.policy_idx = policy_idx;
	}
	
}
