package com.isnetis.user.domain;

public class UserGrpListVO {

	private String usergrp_idx;  /*레코드 고유번호                        */
	private String backup_date;  /*레코드 백업일자                        */
	private String invalid_flag; /*레코드 유효여부 (FALSE:유효, TRUE:무효)*/
	private String ref_count;
	private String grp_type;
	private String usergrp_pidx; /*상위그룹 정보 (USERGRP_LIST의 고유번호)*/
	private String usergrp_name; /*그룹명                                 */
	private String usergrp_code; /*그룹코드                               */

	public String getUsergrp_idx() {
		return usergrp_idx;
	}
	public void setUsergrp_idx(String usergrp_idx) {
		this.usergrp_idx = usergrp_idx;
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
	public String getGrp_type() {
		return grp_type;
	}
	public void setGrp_type(String grp_type) {
		this.grp_type = grp_type;
	}
	public String getUsergrp_pidx() {
		return usergrp_pidx;
	}
	public void setUsergrp_pidx(String usergrp_pidx) {
		this.usergrp_pidx = usergrp_pidx;
	}
	public String getUsergrp_name() {
		return usergrp_name;
	}
	public void setUsergrp_name(String usergrp_name) {
		this.usergrp_name = usergrp_name;
	}
	public String getUsergrp_code() {
		return usergrp_code;
	}
	public void setUsergrp_code(String usergrp_code) {
		this.usergrp_code = usergrp_code;
	}
}
