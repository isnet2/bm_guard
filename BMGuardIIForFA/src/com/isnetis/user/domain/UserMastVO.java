package com.isnetis.user.domain;

import java.util.List;

import com.isnetis.common.BaseObjectBean;
import com.isnetis.device.domain.ManagementGroupVO;
import org.directwebremoting.annotations.DataTransferObject;

@DataTransferObject
public class UserMastVO extends BaseObjectBean
{ 

	private String user_idx;         /*레코드 고유번호                         */ 
	private String backup_date;      /*레코드 백업일자                         */
	private String invalid_flag;     /*레코드 유효여부 (FALSE:유효, TRUE:무효) */
	private String create_date;      /*레코드 생성일자 (YYYY-MM-DD hh:mm:ss)   */
	private String createuser_idx;   /*레코드 생성 관리자                      */ 
	private String delete_date;      /*레코드 삭제일자 (YYYY-MM-DD hh:mm:ss)   */
	private String  deleteuser_idx;  /*레코드 삭제 관리자                      */
	private String update_date;      /*레코드 수정일자 (YYYY-MM-DD hh:mm:ss)   */
	private String updateuser_idx;   /*레코드 수정 관리자                      */
	private String client_lipaddr;   /*최종 접속한 클라이언트 IP 주소          */
	private String login_ldate;      /*최종 접속 일시                          */
	private String dept_name;        /*부서명                                  */
	private String usergrp_idx;
	private String usergrp_name;
	private String userattr_idx;     /*속성정보 (USER_ATTR의 고유번호)         */
	private String userattr_title;     /*속성정보 (USER_ATTR의 고유번호)         */
	private String user_no;          /*사번                                    */
	private String user_name;        /*사용자 명                               */
	private String login_id;         /*사용자 ID                               */
	private String login_pwd;        /*사용자 비밀번호                         */
	private String pwd_ques;         /*비밀번호 변경시 질문                    */
	private String pwd_ans;          /*비밀번호 변경시 답변                    */
	private String update_gubun;     /*변경구분                                */
	private String clientgrp_idx;
	private String history_user_idx;
	private String grp_count;
	private String client_count;
	private String grp_all_concat;
	private String user_grp_concat;
	
	private List<ManagementGroupVO> managementGroupList; /*관리그룹*/
	
	public String getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
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
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getCreateuser_idx() {
		return createuser_idx;
	}
	public void setCreateuser_idx(String createuser_idx) {
		this.createuser_idx = createuser_idx;
	}
	public String getDelete_date() {
		return delete_date;
	}
	public void setDelete_date(String delete_date) {
		this.delete_date = delete_date;
	}
	public String getDeleteuser_idx() {
		return deleteuser_idx;
	}
	public void setDeleteuser_idx(String deleteuser_idx) {
		this.deleteuser_idx = deleteuser_idx;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getUpdateuser_idx() {
		return updateuser_idx;
	}
	public void setUpdateuser_idx(String updateuser_idx) {
		this.updateuser_idx = updateuser_idx;
	}
	public String getClient_lipaddr() {
		return client_lipaddr;
	}
	public void setClient_lipaddr(String client_lipaddr) {
		this.client_lipaddr = client_lipaddr;
	}
	public String getLogin_ldate() {
		return login_ldate;
	}
	public void setLogin_ldate(String login_ldate) {
		this.login_ldate = login_ldate;
	}
	public String getUsergrp_idx() {
		return usergrp_idx;
	}
	public void setUsergrp_idx(String usergrp_idx) {
		this.usergrp_idx = usergrp_idx;
	}
	public String getUsergrp_name() {
		return usergrp_name;
	}
	public void setUsergrp_name(String usergrp_name) {
		this.usergrp_name = usergrp_name;
	}
	public String getUserattr_title() {
		return userattr_title;
	}
	public void setUserattr_title(String userattr_title) {
		this.userattr_title = userattr_title;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getUserattr_idx() {
		return userattr_idx;
	}
	public void setUserattr_idx(String userattr_idx) {
		this.userattr_idx = userattr_idx;
	}
	public String getUser_no() {
		return user_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getLogin_id() {
		return login_id;
	}
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	public String getLogin_pwd() {
		return login_pwd;
	}
	public void setLogin_pwd(String login_pwd) {
		this.login_pwd = login_pwd;
	}
	public String getPwd_ques() {
		return pwd_ques;
	}
	public void setPwd_ques(String pwd_ques) {
		this.pwd_ques = pwd_ques;
	}
	public String getPwd_ans() {
		return pwd_ans;
	}
	public void setPwd_ans(String pwd_ans) {
		this.pwd_ans = pwd_ans;
	}
	public String getUpdate_gubun() {
		return update_gubun;
	}
	public void setUpdate_gubun(String update_gubun) {
		this.update_gubun = update_gubun;
	}
	public List<ManagementGroupVO> getManagementGroupList() {
		return managementGroupList;
	}

	public void setManagementGroupList(List<ManagementGroupVO> managementGroupList) {
		this.managementGroupList = managementGroupList;
	}
	public String getClientgrp_idx() {
		return clientgrp_idx;
	}
	public void setClientgrp_idx(String clientgrp_idx) {
		this.clientgrp_idx = clientgrp_idx;
	}
	public String getHistory_user_idx() {
		return history_user_idx;
	}
	public void setHistory_user_idx(String history_user_idx) {
		this.history_user_idx = history_user_idx;
	}
	public String getGrp_count() {
		return grp_count;
	}
	public void setGrp_count(String grp_count) {
		this.grp_count = grp_count;
	}
	public String getClient_count() {
		return client_count;
	}
	public void setClient_count(String client_count) {
		this.client_count = client_count;
	}
	public String getGrp_all_concat() {
		return grp_all_concat;
	}
	public void setGrp_all_concat(String grp_all_concat) {
		this.grp_all_concat = grp_all_concat;
	}
	public String getUser_grp_concat() {
		return user_grp_concat;
	}
	public void setUser_grp_concat(String user_grp_concat) {
		this.user_grp_concat = user_grp_concat;
	}
	
}
