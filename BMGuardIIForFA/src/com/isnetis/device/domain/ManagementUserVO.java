package com.isnetis.device.domain;

import java.util.List;

import com.isnetis.user.domain.UserMastVO;

public class ManagementUserVO {

	private int user_idx;
	private String backup_date;
	private int invalid_flag;
	private String create_date;
	private UserMastVO createUser;
	private String delete_date;
	private UserMastVO deleteUser;
	private String update_date;
	private UserMastVO updateUser;
	private String userlogin_id;
	private String userlogin_pwd;
	private String user_status;
	private List<ManagementGroupVO> managementGroupList;
	
	public ManagementUserVO(){}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
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

	public String getUserlogin_id() {
		return userlogin_id;
	}

	public void setUserlogin_id(String userlogin_id) {
		this.userlogin_id = userlogin_id;
	}

	public String getUserlogin_pwd() {
		return userlogin_pwd;
	}

	public void setUserlogin_pwd(String userlogin_pwd) {
		this.userlogin_pwd = userlogin_pwd;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public List<ManagementGroupVO> getManagementGroupList() {
		return managementGroupList;
	}

	public void setManagementGroupList(List<ManagementGroupVO> managementGroupList) {
		this.managementGroupList = managementGroupList;
	}
	
}
