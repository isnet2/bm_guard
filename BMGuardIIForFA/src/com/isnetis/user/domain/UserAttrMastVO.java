package com.isnetis.user.domain;

public class UserAttrMastVO {
	private String userattr_idx;   /*레코드 고유번호 1:최상위 관리자 2:제어 및 모니터링 3:모니터링*/
	private String backup_date;    /*레코드 백업일자                                              */
	private String invalid_flag;   /*레코드 유효여부 (0:유효, 1:무효)                             */
	private String ref_count;      /*                                                             */
	private String userattr_title; /*최상위 관리자, 제어 및 모니터링, 모니터링                    */
	
	public String getUserattr_idx() {
		return userattr_idx;
	}
	public void setUserattr_idx(String userattr_idx) {
		this.userattr_idx = userattr_idx;
	}
	public String getBackup_date() {
		return backup_date;
	}
	public void setBackup_date(String backup_date) {
		this.backup_date = backup_date;
	}
	public String getInvalid_flag() {
		return invalid_flag;
	}
	public void setInvalid_flag(String invalid_flag) {
		this.invalid_flag = invalid_flag;
	}
	public String getRef_count() {
		return ref_count;
	}
	public void setRef_count(String ref_count) {
		this.ref_count = ref_count;
	}
	public String getUserattr_title() {
		return userattr_title;
	}
	public void setUserattr_title(String userattr_title) {
		this.userattr_title = userattr_title;
	}
	

}
