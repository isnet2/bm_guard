package com.isnetis.util.ajax;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

public class JsonpView extends MappingJacksonJsonView{

	public static final String DEFAULT_CONTENT_TYPE = "application/javascript";
	
	
	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if("GET".equals(request.getMethod().toUpperCase())){
			Map<String, String[] > params = request.getParameterMap();
			if(params.containsKey("callback")){
				response.getOutputStream().write(new String(params.get("callback")[0] + "(").getBytes());
				super.render(model, request, response);
				response.getOutputStream().write(new String(")").getBytes());
				response.setContentType("application/javascript");
			}else{
				super.render(model, request, response);
				response.setContentType("application/json");
			}
		}else{
			super.render(model, request, response);
			response.setContentType("application/json");
		}
	}
}
