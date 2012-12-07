package com.isnetis.policy.domain;

import java.util.List;

import com.isnetis.user.domain.UserMastVO;

public class PolicyMastVO {
	private int policy_idx;
	private String backup_date;
	private int invalid_flag;
	private String create_date;
	private String delete_date;
	private String update_date;
	private String policy_name;
	private String policy_desc;
	private String policy_type;
	private UserMastVO createUser;
	private UserMastVO deleteUser;
	private UserMastVO updateUser;
	private List<FolderPolicyVO> folderPolicyList;
	private List<PassPolicyVO> passPolicyList;
	private List<SystemPolicyVO> systemPolicyList;
	private List<MediaPolicyVO> mediaPolicyList;
	private List<String> osTypeList;
	private int sharedfolder_flag;
	
	public PolicyMastVO(){}

	public int getPolicy_idx() {
		return policy_idx;
	}

	public void setPolicy_idx(int policy_idx) {
		this.policy_idx = policy_idx;
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

	public String getDelete_date() {
		return delete_date;
	}

	public void setDelete_date(String delete_date) {
		this.delete_date = delete_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public UserMastVO getCreateUser() {
		return createUser;
	}

	public void setCreateUser(UserMastVO createUser) {
		this.createUser = createUser;
	}

	public UserMastVO getDeleteUser() {
		return deleteUser;
	}

	public void setDeleteUser(UserMastVO deleteUser) {
		this.deleteUser = deleteUser;
	}

	public UserMastVO getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(UserMastVO updateUser) {
		this.updateUser = updateUser;
	}

	public List<String> getOsTypeList() {
		return osTypeList;
	}

	public void setOsTypeList(List<String> osTypeList) {
		this.osTypeList = osTypeList;
	}

	public String getPolicy_name() {
		return policy_name;
	}

	public void setPolicy_name(String policy_name) {
		this.policy_name = policy_name;
	}

	public String getPolicy_desc() {
		return policy_desc;
	}

	public void setPolicy_desc(String policy_desc) {
		this.policy_desc = policy_desc;
	}

	public String getPolicy_type() {
		return policy_type;
	}

	public void setPolicy_type(String policy_type) {
		this.policy_type = policy_type;
	}

	public List<FolderPolicyVO> getFolderPolicyList() {
		return folderPolicyList;
	}

	public void setFolderPolicyList(List<FolderPolicyVO> folderPolicyList) {
		this.folderPolicyList = folderPolicyList;
	}

	public List<PassPolicyVO> getPassPolicyList() {
		return passPolicyList;
	}

	public void setPassPolicyList(List<PassPolicyVO> passPolicyList) {
		this.passPolicyList = passPolicyList;
	}

	public List<SystemPolicyVO> getSystemPolicyList() {
		return systemPolicyList;
	}

	public void setSystemPolicyList(List<SystemPolicyVO> systemPolicyList) {
		this.systemPolicyList = systemPolicyList;
	}

	public List<MediaPolicyVO> getMediaPolicyList() {
		return mediaPolicyList;
	}

	public void setMediaPolicyList(List<MediaPolicyVO> mediaPolicyList) {
		this.mediaPolicyList = mediaPolicyList;
	}

	public int getSharedfolder_flag() {
		return sharedfolder_flag;
	}

	public void setSharedfolder_flag(int sharedfolder_flag) {
		this.sharedfolder_flag = sharedfolder_flag;
	}
	
}
