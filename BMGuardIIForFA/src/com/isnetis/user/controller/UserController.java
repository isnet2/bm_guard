package com.isnetis.user.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ManagementGroupVO;
import com.isnetis.device.service.ClientGroupService;
import com.isnetis.device.service.ManagementGroupService;
import com.isnetis.user.domain.UserAttrMastVO;
import com.isnetis.user.domain.UserGrpListVO;
import com.isnetis.user.domain.UserMastBean;
import com.isnetis.user.domain.UserMastVO;
import com.isnetis.user.service.LoginService;
import com.isnetis.user.service.UserService;
import com.isnetis.util.SessionUtil;

@Controller
public class UserController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ClientGroupService clientGroupService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ManagementGroupService managementGroupService;
	
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	

	/**사용자 관리 리스트 페이지*/
	@RequestMapping(value="user/list", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getUserList(HttpServletRequest request) throws Throwable {
		SessionUtil sessions = new SessionUtil(request);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		UserMastVO userMast = new UserMastVO();
		String search_kind = request.getParameter("search_kind"); 
		
		if (search_kind != null && !search_kind.equals("")) {		
			if(search_kind.equals("0")) {
				userMast.setUpdate_gubun("C");
			}else if(search_kind.equals("1")) {
				userMast.setUpdate_gubun("D");
			}
		}else {
			search_kind = "-1";
		}
		
		List<UserMastVO> userList = userService.getList(userMast);
		
		int userSize = 0;
		if (userList != null) {
			userSize = userList.size();
		}
		logger.debug("###userSize : "  + userSize);
		
		modelAndView.addObject("userList", userList);
		modelAndView.addObject("userSize", userSize);
		modelAndView.addObject("loginUser", sessions.getLoginUser());
		
		int pidx = 1;
		List<ClientGroupVO> clientGrpList = clientGroupService.getClientGroupList(pidx);
		
		List<UserAttrMastVO> userAttrMast = userService.getUserAttrMast();
		List<UserGrpListVO> userGrpList = userService.getUserGrpList();
		
		logger.debug("$$$ clientGrpList : " + clientGrpList.size());
		logger.debug("$$$ userAttrMast : " + userAttrMast.size());
		logger.debug("$$$ userGrpList : " + userGrpList.size());
		
		
		modelAndView.addObject("clientGrpList",clientGrpList);
		modelAndView.addObject("userAttrMast" ,userAttrMast);
		modelAndView.addObject("userGrpList"  ,userGrpList);
		modelAndView.addObject("search_kind"  ,search_kind);
		
		
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("user/list");
		return modelAndView;
	}
	
	/** 비밀번호 변경 페이지*/
	@RequestMapping(value="user/pass", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getPass(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}

		String loginPwd = sessions.getLoginUser().getLogin_pwd();

		
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("user/pass");
		return modelAndView;
	}

	/** 비밀번호 질문_답변 페이지 */
	@RequestMapping(value="user/first_pass", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getFirstPass( HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}

		modelAndView.addObject("pwdQues",sessions.getLoginUser().getPwd_ques());
		modelAndView.addObject("pwdAns",sessions.getLoginUser().getPwd_ans());
		
		
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("user/first_pass");
		return modelAndView;
	}
	
	
	//비밀번호 변경
	@RequestMapping(value="/ChangePwdQuesAns" , method = RequestMethod.POST )
	public ModelAndView getChangePwdQuesAns (@ModelAttribute("changePwdQuesAnsform")UserMastVO userMast, HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView)  throws Throwable {
		SessionUtil sessions = new SessionUtil(request);

		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		
		userMast.setLogin_id(sessions.getLoginUser().getLogin_id());
		
		 int result = 0;
		try {
			result = userService.getChangePwdQuesAns(userMast);
		
			 if (result==1) {
				 sessions.getLoginUser().setPwd_ans(userMast.getPwd_ans());
				 sessions.getLoginUser().setPwd_ques(userMast.getPwd_ques());
			 } 
		
			if (result == 0) {
				param.put("result", "-1");
		    	param.put("msg", "비밀번호 초기화 질문/답변 변경이제대로  이루어 지지 않았습니다.");  	
			} else if(result==1 ){
				param.put("result", "1");
				param.put("msg", "비밀번호 초기화 질문/답변이 변경되었습니다.");  	
			}
		}catch (Exception e) {
			param.put("result", "-1");
	    	param.put("msg", "비밀번호 초기화 질문/답변 변경이제대로  이루어 지지 않았습니다.");  
		}
			
		return new ModelAndView("json_").addObject("param", param);
		
	}

	/** 사용자_삭제  */
	@RequestMapping(value="/DeleteUser", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView deleteUser(@RequestParam(value="checkIndexs",required=true) String idxs, HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** DeleteUser ******************** " + idxs);
		int result =0;
		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		try {
			result = userService.deleteInsertUser(idxs);
			if (result > 0) {
				param.put("result", "1");
		    	param.put("msg", "사용자가가 삭제되었습니다.");  	
			} 
		}catch(Exception e) {
			param.put("result", "0");
			param.put("msg", "사용자 삭제중 에러가 발생하였습니다.");  	
		}
			
		return new ModelAndView("json_").addObject("param", param);

	}	
	

	@RequestMapping(value="/UpdateUserList", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView updateUserList( HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** getUpdateUserList ******************** " + request.getParameter("checkIndex1"));
		
		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		
		String user_idx = request.getParameter("checkIndex1");

		UserMastVO updateUser = userService.getFindIdxUserInfo(user_idx);
		List<UserMastVO> historyList = userService.getFindIdxUserHistory(user_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		mav.addObject("updateUser", updateUser);
		mav.addObject("historyList", historyList);

		return mav;

	}	
	
	/** 사용자_신규등록  */
	@RequestMapping(value="/InsertUser", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertUserMast(@ModelAttribute("signForm")UserMastVO newUser,  HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** NewUser ******************** " );
		
		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		int result;
		result = userService.getCheckLoginIdCnt(newUser);
		if(result == 1) {
			param.put("result", "0");
			param.put("msg", "동일한  Login ID가 존재합니다.");  	
			return new ModelAndView("json_").addObject("param", param);			
		}
		
		result = userService.getCheckUserNoCnt(newUser);
		if(result == 1) {
			param.put("result", "0");
			param.put("msg", "동일한  사번이 존재합니다.");  	
			return new ModelAndView("json_").addObject("param", param);
		}

		int result1,result2 = 0;
		
		try {
				newUser.setCreateuser_idx(sessions.getLoginUser().getUser_idx());
				result1 = userService.insertUserMast(newUser);
				
				if (result1 < 1) {
					param.put("result", "0");
					param.put("msg", "사용자  입력중 에러발생하였습니다.");  	
					return new ModelAndView("json_").addObject("param", param);
				} 
				
				int user_idx = userService.getUserMastMaxIdx();
				
				newUser.setUser_idx(String.valueOf(user_idx));
				newUser.setUpdate_gubun("C");
				
				result2 = userService.insertUserHistory(newUser);
				int history_user_idx = userService.getUserHistoryMaxIdx();
				logger.debug("^^^^^^ history_user_idx = " + history_user_idx );
				
				if (newUser.getClientgrp_idx()!= null || !newUser.getClientgrp_idx().equals("")) { 
					ManagementGroupVO mGroup = new ManagementGroupVO();
					String [] clientgrp = newUser.getClientgrp_idx().split(",");
					    mGroup.setHistory_user_idx(history_user_idx);
						mGroup.setUser_idx(user_idx);
						mGroup.setUser_type("A");
						
					for(int i=0; i < clientgrp.length; i++) {
						mGroup.setClientgrp_idx(Integer.parseInt(clientgrp[i]));
						managementGroupService.addManagementGroup(mGroup);
					}
					
					logger.debug("/* 2-4. 사용자관리그룹 history 입력*/");
					managementGroupService.insertAdminGrpHistory(mGroup);
				}
				
				if (result1 !=0 && result2 != 0) {
					param.put("result", "1");
			    	param.put("msg", "사용자가가 입력되었습니다.");  	
				} else {
					param.put("result", "0");
					param.put("msg", "사용자 입력중 에러가 발생하였습니다.");  	
				}
		}catch(Exception e) {
			param.put("result", "0");
			param.put("msg", "사용자 입력중 에러가 발생하였습니다.");  	
		}
			
		return new ModelAndView("json_").addObject("param", param);
	}	
	
	/** 사용자_수정등록  */
	@RequestMapping(value="/ChangeUser.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView changeUser(@RequestParam(value="u_user_idx",required=false) String user_idx,
								   @RequestParam(value="u_user_no_old",required=false) String user_no_old,
								   @RequestParam(value="u_login_id_old",required=false) String login_id_old,
			                       @RequestParam(value="u_user_name",required=false)  String user_name,
			                       @RequestParam(value="u_user_no",required=false)  String user_no,
			                       @RequestParam(value="u_login_id",required=false)  String login_id,
			                       @RequestParam(value="u_login_pwd",required=false)  String login_pwd,
			                       @RequestParam(value="u_userattr_idx",required=false)  String userattr_idx,
			                       @RequestParam(value="u_usergrp_idx",required=false)  String usergrp_idx,
			                       @RequestParam(value="u_clientgrp_idx",required=false)  String clientgrp_idx,
			                       HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** UpdateUser ******************** " );
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		logger.debug("***************  " + user_idx + " " +  user_name + " " + user_no + " " + login_id);
		
		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		logger.debug("*************** UpdateUser ******************** 2" );
				
		
		/*1-1. 사용자 정보 Bean 생성 */
		UserMastVO user = new UserMastVO();
		user.setUpdateuser_idx(sessions.getLoginUser().getUser_idx());
		user.setUser_idx(user_idx);
		user.setUser_name(user_name);
		user.setUser_no(user_no);
		user.setLogin_id(login_id);
		user.setLogin_pwd(login_pwd);
		user.setUserattr_idx(userattr_idx);
		user.setUsergrp_idx(usergrp_idx);
		user.setUpdate_gubun("U");
		
		logger.debug("*************** UpdateUser ******************** 3" );
		int result = 0;
		logger.debug("*************** UpdateUser ********************  " + login_id +" : "+ login_id_old );
		if(!login_id.equals(login_id_old)){
			result = userService.getCheckLoginIdCnt(user);
			if(result == 1) {
				mav.addObject("result", "0");
				mav.addObject("msg", "동일한  Login ID가 존재합니다.");  	
				return mav;
			}
		}
		logger.debug("*************** UpdateUser ******************** 4" );
		logger.debug("*************** UpdateUser ******************** " +user_no + " : " +  user_no_old);
		if(!user_no.equals(user_no_old)){
			result = userService.getCheckUserNoCnt(user);
			if(result == 1) {
				mav.addObject("result", "0");
				mav.addObject("msg", "동일한  사번이 존재합니다.");  	
				return mav;
			}
		}
		logger.debug("*************** UpdateUser ******************** 5" );

		int result1, result2, history_user_idx  = 0;
		try {
				logger.debug("/*1-2. 사용자 정보수정 */");
				result1 = userService.userUpdate(user);
				
				logger.debug("/*1-2. 사용자 정보 history 입력 */");
				result2 = userService.insertUserHistory(user);
				
				logger.debug("/*1-3. 사용자 정보 history idx  */");
				history_user_idx = userService.getUserHistoryMaxIdx();
				user.setHistory_user_idx(String.valueOf(history_user_idx));
				
				
				logger.debug("/* 2-1.사용자 관리그룹 삭제 */");
				managementGroupService.deleteManagementGrp(Integer.parseInt(user_idx), "A");
				
				logger.debug("/* 2-2.사용자 관리그룹 Bean 생성*/");
		
				ManagementGroupVO mGroup = new ManagementGroupVO();
				mGroup.setUser_idx(Integer.parseInt(user_idx));
				mGroup.setHistory_user_idx(history_user_idx);
				mGroup.setUser_type("A");
				
				logger.debug("why why 2???");
					
				logger.debug("/* 2-3.사용자 관리그룹  입력*/ : " + clientgrp_idx);
				String [] clientGrp = clientgrp_idx.split(",");
				
				if(clientGrp != null && clientGrp.length > 0) {
					for(int i=0; i < clientGrp.length; i++) {
						mGroup.setClientgrp_idx(Integer.parseInt(clientGrp[i]));
						managementGroupService.insertManagementGrp(mGroup);
					}
					logger.debug("/* 2-4. 사용자관리그룹 history 입력*/");
					managementGroupService.insertAdminGrpHistory(mGroup);
				}
				
				UserMastVO updateUser = userService.getFindIdxUserInfo(user_idx);
				List<UserMastVO> historyList = userService.getFindIdxUserHistory(user_idx);
		
				if (result1 !=0 && result2 != 0) {
					mav.addObject("result", "1");
					mav.addObject("msg", "사용자가가 수정되었습니다.");  	
				} else {
					mav.addObject("result", "0");
					mav.addObject("msg", "사용자 수정중 에러가 발생하였습니다.");  	
				}
		
				mav.addObject("uHistory",historyList );
				mav.addObject("uUser",updateUser);

				logger.debug("why why 3???" + historyList.size());
		}catch(Exception e) {
			mav.addObject("result", "0");
			mav.addObject("msg", "사용자 입력중 에러가 발생하였습니다.");  	
			mav.addObject("param",param);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/CheckLoginIdCnt", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getCheckLoginIdCnt( @RequestParam(value="u_user_idx",required=true) String user_idx,
			                             @RequestParam(value="u_login_id",required=true) String login_id) throws Throwable {
		logger.debug("*************** getCheckLoginIdCnt ******************** " );
		logger.debug("*************** user_idx : "  + user_idx);
		logger.debug("*************** login_id : " + login_id);
		
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		UserMastVO user = new UserMastVO();
		user.setLogin_id(login_id);
		user.setUser_idx(user_idx);
		
		int result = 0;
		
		result = userService.getCheckLoginIdCnt(user);
		logger.debug("^^^^^^^^^^^^^ CheckLogidCnt   :   " + result);
		
		// result == 1 동일한 Login Id가 이 있을 경우
		if (result == 1) {
			param.put("result", "0");
			param.put("msg", "동일한  Login ID가 존재합니다.");  	
		} else {
			param.put("result", "1");
		}
		
		
		return new ModelAndView("json_").addObject("param", param);

	}	
	
	
	@RequestMapping(value="/CheckUserNoCnt", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getCheckUserNoCnt( @RequestParam(value="u_user_idx",required=true) String user_idx,
			                            @RequestParam(value="u_user_no",required=true) String user_no) throws Throwable {
		logger.debug("*************** CheckUserNoCnt ******************** " );
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		UserMastVO user = new UserMastVO();
		user.setUser_no(user_no);
		user.setUser_idx(user_idx);
		
		int result = 0;
		
		result = userService.getCheckUserNoCnt(user);
		
		// result == 1 동일한 UserNO가 이 있을 경우
		if (result == 1) {
			param.put("result", "0");
			param.put("msg", "동일한  사번이 존재합니다.");  	
		} else {
			param.put("result", "1");
		}
		
		
		return new ModelAndView("json_").addObject("param", param);
		
	}	
	
	@RequestMapping(value="/SortingData", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getSortingData( HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** getSortingData ******************** ");
		logger.debug("%%%%%%%%%%%%%%%%" +  request.getParameter("userList"));
		
		
	return modelAndView;

	}	
	
	
	@RequestMapping(value="/getUserKindList", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getUserKindList( @RequestParam(value="search_kind",required=true) int user_kind) throws Throwable {
		logger.debug("*************** getUserKindList ******************** " + user_kind);
	
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		UserMastVO user = new UserMastVO();
		if (user_kind == 0) {
			user.setUpdate_gubun("C");
		}else if(user_kind==1)  {
			user.setUpdate_gubun("D");
		}
		
		//사용중인 사용자
		List<UserMastVO> userList = userService.getList(user);
		
		int userSize = 0;
		if (userList != null) {
			userSize = userList.size();
		}
		logger.debug("###userSize : "  + userSize);
		
		mav.addObject("userList", userList);
		mav.addObject("userSize", userSize);
		
		return mav;

	}
}
