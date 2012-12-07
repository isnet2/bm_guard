package com.isnetis.user.domain;

import com.isnetis.common.BaseObjectBean;


public class SessionUserVO extends BaseObjectBean {

	private String user_idx ;
	private String usergrp_idx ;
	private String usergrp_code ;
	private String usergrp_name ;
	private String userattr_idx ;
	private String userattr_title ;
	private String user_no ;
	private String user_name ;
	private String login_id ;
	private String login_pwd ;
	private String pwd_ques ;
	private String pwd_ans ;
	private String user_auth_yn;  /*사용자 인증여부*/
	
	public String getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
	public String getUsergrp_idx() {
		return usergrp_idx;
	}
	public void setUsergrp_idx(String usergrp_idx) {
		this.usergrp_idx = usergrp_idx;
	}
	public String getUsergrp_code() {
		return usergrp_code;
	}
	public void setUsergrp_code(String usergrp_code) {
		this.usergrp_code = usergrp_code;
	}
	public String getUsergrp_name() {
		return usergrp_name;
	}
	public void setUsergrp_name(String usergrp_name) {
		this.usergrp_name = usergrp_name;
	}
	public String getUserattr_idx() {
		return userattr_idx;
	}
	public void setUserattr_idx(String userattr_idx) {
		this.userattr_idx = userattr_idx;
	}
	public String getUserattr_title() {
		return userattr_title;
	}
	public void setUserattr_title(String userattr_title) {
		this.userattr_title = userattr_title;
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
	public String getUser_auth_yn() {
		return user_auth_yn;
	}
	public void setUser_auth_yn(String user_auth_yn) {
		this.user_auth_yn = user_auth_yn;
	}
}

