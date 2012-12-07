package com.isnetis.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.isnetis.user.domain.SessionUserVO;
import com.isnetis.util.SessionUtil;



public class sessionCheckInterceptor extends HandlerInterceptorAdapter {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
	{
		 boolean result   =  false;
  	     String rootPath   =  request.getContextPath();
		  try{
			   logger.debug("enter intercepter");
			   HttpSession session  =  request.getSession(false);
			   
			   if(session == null){
				   response.sendRedirect(rootPath);
				   return false;
			   }else{
			       SessionUtil sessions = new SessionUtil(request);
					
					if(!sessions.isLogin() || sessions.getLoginUser() == null) {
						 response.sendRedirect(rootPath);
					     return false;
					}
			   }
			   
			   result =  true;
		      
		   }catch(Exception e){
			   e.printStackTrace();
			   logger.debug(e.getMessage());
		   return false;
		  }
		  
		  return result;
	}
}
