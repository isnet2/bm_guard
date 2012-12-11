package com.isnetis.monitor.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;


import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.device.domain.ManagementGroupVO;
import com.isnetis.device.service.ClientMastService;
import com.isnetis.monitor.domain.ClientLimitMastVO;
import com.isnetis.monitor.domain.CpuLimitListVO;
import com.isnetis.monitor.domain.DiskLimitListVO;
import com.isnetis.monitor.domain.MainClientListVO;
import com.isnetis.monitor.domain.MemoryLimitListVO;
import com.isnetis.monitor.service.MainClientListService;
import com.isnetis.monitor.service.MonitorService;
import com.isnetis.user.domain.UserMastVO;
import com.isnetis.util.SessionUtil;


@Controller
public class MonitorController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	
	@Autowired
	private MonitorService monitorService; 

	@Autowired
	private ClientMastService clientService; 

	@Autowired
	private MainClientListService mainClientListService; 
	
	/**모니터링 관리 리스트 페이지*/
	@RequestMapping(value="/monitor/automatic", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getMonitorIndex(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		*/
		
		List<ClientMastVO> clientList = clientService.getInertClient();
		List<CpuLimitListVO> cpuList = monitorService.getCpuList();
		List<MemoryLimitListVO> memoryList = monitorService.getMemoryList();
		List<MainClientListVO> mainList = mainClientListService.getMainClientList();		
		ClientLimitMastVO clientLimit =  monitorService.getClientLimit();

		//임계치
		modelAndView.addObject("clientLimit",clientLimit);
		
		//미기동기기
		modelAndView.addObject("clientList",clientList);
		modelAndView.addObject("clientListSize",clientList.size());
		//CPU
		modelAndView.addObject("cpuList",cpuList);
		modelAndView.addObject("cpuListSize",cpuList.size());

		//Memory
		modelAndView.addObject("memoryList",memoryList);
		modelAndView.addObject("memoryListSize",memoryList.size());
		
		//주요자동화 기기
		modelAndView.addObject("mainList",mainList);
		modelAndView.addObject("mainListSize",mainList.size());
		
		
		
		
		
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/monitor/automatic_old");
		return modelAndView;
	}
	
	/**모니터링 관리 리스트 페이지*/
	@RequestMapping(value="/monitor/servermonitor", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getServerMonitor(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
		*/
		
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/monitor/servermonitor_old");
		return modelAndView;
	}

	/** cpuCall  */
	@RequestMapping(value="/CpuList", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getCpuList(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** GetCpuList ******************** " );
		
/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
*/		
		//callBack 함수로 값 넘겨줌
		
		List<CpuLimitListVO> cpuList = monitorService.getCpuList();
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		mav.addObject("cpuList",cpuList);
		mav.addObject("cpuListSize", cpuList.size());
		return mav;
	}
	
	
	/** MemoryCall  */
	@RequestMapping(value="/MemoryList", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getMemeoryList(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** MemoryList ******************** " );
		
/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
*/		
		//callBack 함수로 값 넘겨줌
		
		List<MemoryLimitListVO> memoryList = monitorService.getMemoryList();
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		mav.addObject("memoryList",memoryList);
		mav.addObject("memoryListSize", memoryList.size());
		return mav;
	}
	
	
	/** InertClient Call  */
	@RequestMapping(value="/InertClientList", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getInertClient(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** GetCpuList ******************** " );
		
/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
*/		
		//callBack 함수로 값 넘겨줌
		
		List<ClientMastVO> clientList = clientService.getInertClient();
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		mav.addObject("clientList",clientList);
		mav.addObject("clientListSize", clientList.size());
		return mav;
	}

	/** InertClient Call  */
	@RequestMapping(value="/MainClientList", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getMainClientList(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** MainClientList ******************** " );
		
/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
*/		
		//callBack 함수로 값 넘겨줌
		
		List<MainClientListVO> mainList = mainClientListService.getMainClientList();
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		mav.addObject("mainList",mainList);
		mav.addObject("mainListSize", mainList.size());
		return mav;
	}

	/** MemoryCall  */
	@RequestMapping(value="/RandomNumber", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getRandNum(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** MemoryList ******************** " );
		
/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
*/		
		//callBack 함수로 값 넘겨줌
	    Random oRandom = new Random();
	    // 1~10까지의 정수를 랜덤하게 출력
	    int i = oRandom.nextInt(100) + 1;
	    
		long time = System.currentTimeMillis(); 
		//SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		SimpleDateFormat dayTime = new SimpleDateFormat("hh:mm:ss");
		String str = dayTime.format(new Date(time));
		
		ArrayList <Object> arrList =  new ArrayList<Object>();
		arrList.add(i);
		arrList.add(str);
	    
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		mav.addObject("label","트랜잭션");
		mav.addObject("data", arrList);
		return mav;
	}
	

	/** MemoryCall  */
	@RequestMapping(value="/monitor/servermonitor2", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getServermonitor2(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** servermonitor2 ******************** " );
		
/*		SessionUtil sessions = new SessionUtil(request);
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
*/	
		
		
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/monitor/servermonitor2");
		return modelAndView;
	}
	
	
	
	
	
	/** 임계치 입력  */
	@RequestMapping(value="/InsertCritical", method = { RequestMethod.POST} )
	public ModelAndView insertCritical(@RequestParam(value="memoryNum",required=true) int memoryNum,
									   @RequestParam(value="cpuNum",required=true) int  cpuNum,
									   HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** InsertCritical ******************** " );

		SessionUtil sessions = new SessionUtil(request);
/*		
		
		if(!sessions.isLogin() || sessions.getLoginUser() == null) {
			modelAndView.setViewName("redirect:/index.html");
			return modelAndView;
		}
*/	
		int result = 0;
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();	
		ClientLimitMastVO clientLimit = new ClientLimitMastVO();
		clientLimit.setCpu_limit(cpuNum);
		clientLimit.setMemory_limit(memoryNum);
		clientLimit.setCreateuser_idx(sessions.getLoginUser().getUser_idx());
		
		try {
			result = monitorService.insertCritical(clientLimit);
			logger.debug("%%%% result = " + result);
			if(result == 1) {
				param.put("result", "1");
				param.put("msg", "임계치 설정이 완료되었습니다.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			param.put("result","0");
			param.put("msg", "임계치 설정중 에러가 발생하였습니다.");
		}
		
		
		//개발용 관리자 페이지로 이동 
		return new ModelAndView("json_").addObject("param", param);
	}
	
	/** 자동화기기 미반영  */
	@RequestMapping(value="/LimitDatePList", method = { RequestMethod.GET} )
	public ModelAndView getLimitDateList(@RequestParam(value="dn_sdate",required=true) String startDate,
									   @RequestParam(value="dn_edate",required=true) String endDate,
									   HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** LimitDateList ******************** " );
		logger.debug(" 888888 startDate : " + startDate);
		logger.debug(" 8888888 endDate : " + endDate);
		
		int result = 0;
		//callBack 함수로 값 넘겨줌
		Map<String, String> param = new HashMap<String, String>();	
		param.put("dn_sdate", startDate);
		param.put("dn_edate", endDate);
	
		
		List<ClientLimitMastVO> limitDateList = monitorService.getLimitDateList(param);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		//ModelAndView mav =  new ModelAndView("json_");
		
		mav.addObject("limitDList", limitDateList);
		mav.addObject("limitDListSize", limitDateList.size());
		
		
		return mav;
		
	
		
		
	}
	
	/** 미자동화기기 미반영디테일  */
	@RequestMapping(value="/LimitDatePDetail", method = { RequestMethod.GET} )
	public ModelAndView getLimitHistoryList(@RequestParam(value="value",required=true) String value,
									   HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		logger.debug("*************** LimitDatePDetail ******************** " );
		
		int result = 0;
		//callBack 함수로 값 넘겨줌
	
		
		List<ClientMastVO> limitHistoryList = clientService.getLimitHistoryList(value);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		mav.addObject("limitDHList",limitHistoryList);
		mav.addObject("limitDHListSize",limitHistoryList.size());
		
		return mav;
		
	}
	

}
