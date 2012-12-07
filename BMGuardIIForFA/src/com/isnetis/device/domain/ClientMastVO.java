package com.isnetis.device.domain;

import com.isnetis.policy.domain.PolicyMastVO;
import com.isnetis.user.domain.UserMastVO;

public class ClientMastVO {

	private int client_idx;
	private String backup_date;
	private int invalid_flag;
	private int online_flag;
	private int active_flag;
	private String create_date;
	private UserMastVO createUser;
	private String delete_date;
	private UserMastVO deleteUser;
	private String update_date;
	private UserMastVO updateUser;
	private String client_name;
	private String mac_addr;
	private String ip_addr;
	private String login_ldate;
	private UserMastVO loginUser;
	private ClientGroupVO clientGrp;
	private PolicyMastVO policy;
	private int sim_flag;
	private PolicyMastVO nowPolicy;
	private String clientgrp_name;
	private int nowsim_flag;
	private String policy_nowdate;
	private int client_state;
	private String mode_sdate;
	private String mode_edate;
	private String mode_memo;
	private String os_type;
	private String delete_key;
	private int apply_limit;
	private int policy_apply_flag;
	private int miss_apply_info;
	
	public ClientMastVO() {}

	public int getClient_idx() {
		return client_idx;
	}

	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}

	public String getBackup_date() {
		return backup_date;
	}

	public void setBackup_date(String backup_date) {
		this.backup_date = backup_date;
	}

	public int getInvalid_flag() {
		return invalid_flag;
	}

	public void setInvalid_flag(int invalid_flag) {
		this.invalid_flag = invalid_flag;
	}

	public int getOnline_flag() {
		return online_flag;
	}

	public void setOnline_flag(int online_flag) {
		this.online_flag = online_flag;
	}

	public int getActive_flag() {
		return active_flag;
	}

	public void setActive_flag(int active_flag) {
		this.active_flag = active_flag;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public UserMastVO getCreateUser() {
		return createUser;
	}

	public void setCreateUser(UserMastVO createUser) {
		this.createUser = createUser;
	}

	public String getDelete_date() {
		return delete_date;
	}

	public void setDelete_date(String delete_date) {
		this.delete_date = delete_date;
	}

	public UserMastVO getDeleteUser() {
		return deleteUser;
	}

	public void setDeleteUser(UserMastVO deleteUser) {
		this.deleteUser = deleteUser;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public UserMastVO getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(UserMastVO updateUser) {
		this.updateUser = updateUser;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getMac_addr() {
		return mac_addr;
	}

	public void setMac_addr(String mac_addr) {
		this.mac_addr = mac_addr;
	}

	public String getIp_addr() {
		return ip_addr;
	}

	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}


	public String getLogin_ldate() {
		return login_ldate;
	}

	public void setLogin_ldate(String login_ldate) {
		this.login_ldate = login_ldate;
	}

	public UserMastVO getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(UserMastVO loginUser) {
		this.loginUser = loginUser;
	}

	public ClientGroupVO getClientGrp() {
		return clientGrp;
	}

	public void setClientGrp(ClientGroupVO clientGrp) {
		this.clientGrp = clientGrp;
	}

	public PolicyMastVO getPolicy() {
		return policy;
	}

	public void setPolicy(PolicyMastVO policy) {
		this.policy = policy;
	}

	public PolicyMastVO getNowPolicy() {
		return nowPolicy;
	}

	public void setNowPolicy(PolicyMastVO nowPolicy) {
		this.nowPolicy = nowPolicy;
	}
	
	public int getSim_flag() {
		return sim_flag;
	}

	public void setSim_flag(int sim_flag) {
		this.sim_flag = sim_flag;
	}

	public int getNowsim_flag() {
		return nowsim_flag;
	}

	public void setNowsim_flag(int nowsim_flag) {
		this.nowsim_flag = nowsim_flag;
	}

	public String getPolicy_nowdate() {
		return policy_nowdate;
	}

	public void setPolicy_nowdate(String policy_nowdate) {
		this.policy_nowdate = policy_nowdate;
	}

	public int getClient_state() {
		return client_state;
	}

	public void setClient_state(int client_state) {
		this.client_state = client_state;
	}

	public String getMode_sdate() {
		return mode_sdate;
	}

	public void setMode_sdate(String mode_sdate) {
		this.mode_sdate = mode_sdate;
	}

	public String getMode_edate() {
		return mode_edate;
	}

	public void setMode_edate(String mode_edate) {
		this.mode_edate = mode_edate;
	}

	public String getMode_memo() {
		return mode_memo;
	}

	public void setMode_memo(String mode_memo) {
		this.mode_memo = mode_memo;
	}

	public String getOs_type() {
		return os_type;
	}

	public void setOs_type(String os_type) {
		this.os_type = os_type;
	}

	public String getDelete_key() {
		return delete_key;
	}

	public void setDelete_key(String delete_key) {
		this.delete_key = delete_key;
	}

	public int getApply_limit() {
		return apply_limit;
	}

	public void setApply_limit(int apply_limit) {
		this.apply_limit = apply_limit;
	}

	public int getPolicy_apply_flag() {
		return policy_apply_flag;
	}

	public void setPolicy_apply_flag(int policy_apply_flag) {
		this.policy_apply_flag = policy_apply_flag;
	}

	public int getMiss_apply_info() {
		return miss_apply_info;
	}

	public void setMiss_apply_info(int miss_apply_info) {
		this.miss_apply_info = miss_apply_info;
	}

	public String getClientgrp_name() {
		return clientgrp_name;
	}

	public void setClientgrp_name(String clientgrp_name) {
		this.clientgrp_name = clientgrp_name;
	}
	
	
}
