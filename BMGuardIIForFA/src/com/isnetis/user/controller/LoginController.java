package com.isnetis.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.isnetis.user.domain.SessionUserVO;
import com.isnetis.user.domain.UserMastVO;
import com.isnetis.user.service.LoginService;
import com.isnetis.user.service.UserService;
import com.isnetis.util.SessionUtil;

@Controller
public class LoginController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LoginService loginService;

	@Autowired
	private UserService userService;

	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	
	@RequestMapping(value="/LoginCheck", method = RequestMethod.POST )
	public ModelAndView getLoginCheck(@ModelAttribute("loginForm")UserMastVO userMast, HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
	
		logger.debug("********** LoginCheck *********** ");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		SessionUserVO sessionUser = loginService.getFindUserInfo(userMast); 
		String password = DigestUtils.md5DigestAsHex(userMast.getLogin_pwd().getBytes());
		
		if (sessionUser == null) {

			param.put("result", "0");
	    	param.put("msg", "아이디와 비밀번호가 상이합니다.");  	
		} else {

			if(password.equals(sessionUser.getLogin_pwd())) {
				
				SessionUtil sessions = new SessionUtil(request, sessionUser);
				
				userMast.setClient_lipaddr(request.getRemoteAddr()); 
				int result = loginService.updateLogin(userMast);
				
				param.put("result", "1");
		    	param.put("msg", "로그인 성공하였습니다.");  
			} else {
				param.put("result", "-1");
		    	param.put("msg", "아이디와 비밀번호가 상이합니다.");  
			}
		}
		
		mav.addObject("param", param);
		return mav;
		
	}

	/**비밀번호 변경 아이디 있는지*/
	@RequestMapping(value="/FindByPwdQues", method = RequestMethod.POST )
	public ModelAndView getFindByPwdQues(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
	
		logger.debug("********** FindByPwdQues ***********  " + request.getParameter("pwd_login_id"));
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		UserMastVO user = loginService.getFindByIdUserInfo(request.getParameter("pwd_login_id")); 
		
		if (user == null) {
			param.put("result", "0");
	    	param.put("msg", "아이디를  확인해 주시기 바랍니다.");  	
		
		} else {
			logger.debug("********** user.getLogin_id() ***********  " + user.getLogin_id());
			String pwdQues = user.getPwd_ques();
			if(!pwdQues.equals("")) {
				param.put("result", "1");
		    	param.put("pwd_ques", pwdQues); 
		    	param.put("login_id", user.getLogin_id());
			} else {
				param.put("result", "0");
		    	param.put("msg", "질문이 등록되어 있지 않습니다. 관리자에게 문의하시기 바랍니다.");  
			}
		}
		mav.addObject("param", param);
		return mav;
	}
	
	@RequestMapping(value="/CheckPwdAnser", method = RequestMethod.POST )
	public ModelAndView getCheckPwdAnser(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
	
		logger.debug("********** CheckPwdAnser *********** " + " : " + request.getParameter("pwd_login_id") + " : " +  request.getParameter("pwd_ans"));
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		UserMastVO user = new UserMastVO();
		user.setLogin_id(request.getParameter("pwd_login_id"));
		user.setPwd_ans(request.getParameter("pwd_ans"));
		
		int result = 0;
		result = loginService.getCheckPwdAnser(user); 
		
		if (result == 0) {
			param.put("result", "0");
	    	param.put("msg", "답변을 확인해 주시기 바랍니다.");  	
		} else if(result==1 ){
			param.put("result", "1");
		}
			
		mav.addObject("param", param);
		return mav;
	}
	
	/**
	 * 로그인
	 * @param request
	 * @param response
	 * @param modelAndView
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping(value="/login/Login", method = RequestMethod.GET)
	public ModelAndView getLogin(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		
		logger.debug("id : " ,  request.getParameter("login_id"));
		SessionUtil sessions = new SessionUtil(request);
		if(!sessions.isLogin()) {
			
			UserMastVO userMast = new UserMastVO();
			userMast.setLogin_id(request.getParameter("login_id"));
			
			SessionUserVO sessionUser = loginService.getFindUserInfo(userMast);
			
			sessions = new SessionUtil(request,sessionUser);
			
			
		}else 
		
		modelAndView.setViewName("/login/Login");
		return modelAndView;
	}
	
	//비밀번호 변경
	@SuppressWarnings("unused")
	@RequestMapping(value="/ChangePassWord" , method = RequestMethod.POST )
	public ModelAndView getChangePassWord (HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView)  throws Throwable {
		SessionUtil sessions = new SessionUtil(request);
		
		logger.debug("********** ChangePassWord *********** " + " : " + request.getParameter("hid_login_id") + " : " + request.getParameter("login_pwd") + request.getParameter("new_pwd"));

		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();
		
		UserMastVO user = new UserMastVO();
		
		if(!sessions.isLogin()) {
			user.setLogin_id(request.getParameter("hid_login_id"));
		}else {
			user.setLogin_id(sessions.getLoginUser().getLogin_id());
			user.setLogin_pwd(request.getParameter("login_pwd"));
			
			SessionUserVO userCheck = loginService.getFindUserInfo(user); 
			
			String password = DigestUtils.md5DigestAsHex(user.getLogin_pwd().getBytes());
			
			logger.debug("********** password_table *********** : " + password );
			logger.debug("********** password_input  *********** : " + password );
			
			
			if (userCheck == null) {
				param.put("result", "-1");
		    	param.put("msg", "아이디와 비밀번호가 상이합니다.");  	
		    	mav.addObject("param", param);
				return mav;
			} 
			if(!password.equals(userCheck.getLogin_pwd())) {
				param.put("result", "-1");
		    	param.put("msg", "아이디와 비밀번호가 상이합니다.");  	
		    	mav.addObject("param", param);
				return mav;
			}
		}

		user.setLogin_pwd(request.getParameter("new_pwd"));

		int result = 0;
		try {
			result = loginService.getChangePassWord(user); 
		
			if (result == 0) {
				param.put("result", "-1");
		    	param.put("msg", "비밀번호 변경이제대로  이루어 지지 않았습니다.");  	
			} else if(result==1 ){
				param.put("result", "1");
				param.put("msg", "비밀번호가 변경되었습니다.");  	
			}
		}catch(Exception e) {
			param.put("result", "-1");
	    	param.put("msg", "비밀번호 변경이제대로  이루어 지지 않았습니다.");  
		}
		mav.addObject("param", param);
		return mav;
	}
	
		
	
	
	/**
	 * 로그 아웃 
	 * @param request
	 * @param response
	 * @param modelAndView
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("### 로그아웃  ");
		SessionUtil sessions = new SessionUtil(request);
		sessions.invalidate();

		modelAndView.setViewName("redirect:/index.html");
		return modelAndView;
	}
	
	@RequestMapping(value="/TestReport",  method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView testReport(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("### TestReport  ");
		
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		UserMastVO userMast = new UserMastVO();
		
		List<UserMastVO> usersList =  userService.getList(userMast);           
		JRDataSource JRdataSource = new JRBeanCollectionDataSource(usersList);           
		parameterMap.put("datasource", JRdataSource);           
		ModelAndView mav= new ModelAndView("pdfReport", parameterMap); 
		
		// :: jasperReportsMultiFormatView를 활용하는 방법이다.
		// :: 파라미터의 종류  :    csv, pdf , xls , html
		//  <==  원하는 형식의 파라미터를 받아주고   (참고 : 필자는 pdf를 파라미터로 넣어주었다)
		String format = "pdf"; 
		mav.addObject("format",format );//  이렇게 저장해 주기만 하면 된다.                                                                
		return mav;
	
	}


}
