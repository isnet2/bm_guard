/**
 * @FileName  : CommonController.java
 * @Project   : BMGuardIIForFA
 * @변경이력    :
 * @프로그램 설명 :
 */
package com.isnetis.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.isnetis.common.service.CommonService;
import com.isnetis.util.SessionUtil;

@Controller 

public class CommonController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CommonService commonService;

	
	
	/**
	 * 일반적인 형태의 View 호출 프로세스 
	 * @param request
	 * @param response
	 * @param modelAndView
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping(value = "/index") 
	public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		logger.debug("Welcome Index!!! - " + request.getParameter("login_id"));

		// 페이지 이동
		modelAndView.setViewName("/index");
		
		if(request.getParameter("login_id")!=null && !request.getParameter("login_id").equals("")) {
			modelAndView.addObject("login_id",request.getParameter("login_id"));
		}

		return modelAndView;
	}
	
	/**
	 * 일반적인 형태의 View 호출 프로세스 
	 * @param request
	 * @param response
	 * @param modelAndView
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping(value = "common/inc/header", method = RequestMethod.GET)
	public ModelAndView getHeader(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		logger.debug("******** header **********");
		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		
		modelAndView.addObject("loginUser", sessions.getLoginUser());
		modelAndView.setViewName("common/inc/header");
		return modelAndView;
	}
	
	

	
	/**
	 * 기본적인 형태의 JDBC 호출 프로세스 
	 * @param request
	 * @param response
	 * @param modelAndView
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping(value = "/excelTest", method = RequestMethod.GET)
	public ModelAndView excelTest(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		
		String msg = "JDBC result";
		// 페이지 이동
		modelAndView.addObject("msg", msg);

		
		modelAndView.setViewName("/excelTest");
		return modelAndView;
	} 
	
	
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public ModelAndView gethelp(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		
		modelAndView.setViewName("/help");
		return modelAndView;
	} 
	
	@RequestMapping(value = "/guide", method = RequestMethod.GET)
	public ModelAndView getGuide(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		
		modelAndView.setViewName("/guide");
		return modelAndView;
	} 
	
}

