package com.isnetis.remote.controller;

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

import sun.rmi.runtime.Log;

import com.isnetis.remote.domain.RemoteDeviceMgrVO;
import com.isnetis.remote.domain.RemotePolicyMgrVO;
import com.isnetis.remote.domain.RemoteProgMgrVO;
import com.isnetis.remote.domain.RemoteRegMgrVO;
import com.isnetis.remote.service.RemoteDeviceService;
import com.isnetis.remote.service.RemoteFileService;
import com.isnetis.remote.service.RemoteMgrService;
import com.isnetis.remote.service.RemotePolicyService;
import com.isnetis.remote.service.RemotePrcService;
import com.isnetis.remote.service.RemoteRegService;
import com.isnetis.remote.service.RemoteProgService;
import com.isnetis.util.SessionUtil;

@Controller
@RequestMapping("/remote")
public class RemoteController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	
	@Autowired
	private RemoteFileService remoteFileService;
	
	@Autowired
	private RemoteMgrService remoteMgrService;
	
	@Autowired
	private RemotePrcService remotePrcService;
	
	@Autowired
	private RemoteRegService remoteRegService;
	
	@Autowired
	private RemoteProgService remoteProgService;
	
	@Autowired
	private RemoteDeviceService remoteDeviceService;
	
	@Autowired
	private RemotePolicyService remotePolicyService;
	
	
	/**파일전송*/
	@RequestMapping(value="/file.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getFile(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/file");
		return modelAndView;
	}

	
	/**파일수신*/
	@RequestMapping(value="/file2.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getFile2(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/file2");
		return modelAndView;
	}

	
	/**파일삭제*/
	@RequestMapping(value="/file3.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getFile3(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/file3");
		return modelAndView;
	}

	
	/**폴더생성*/
	@RequestMapping(value="/file4.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getFile4(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/file4");
		return modelAndView;
	}

	
	/** 실행결과 처리*/
	@RequestMapping(value="/insertResult.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertResult(@RequestParam(value="job_idx")int job_idx,
										 @RequestParam(value="client_idx")int client_idx,
										 @RequestParam(value="job_kind")String job_kind,
										 @RequestParam(value="job_result")String job_result,
										 HttpServletRequest request ) throws Throwable {
		
		logger.debug("============= insertResult =============");
		logger.debug("============= job_idx : " + job_idx);
		logger.debug("============= client_idx: " + client_idx);
		logger.debug("============= job_kind: " + job_kind);
		logger.debug("============= job_result: " + job_result);

		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int result =0;
		int user_idx = 0;
		SessionUtil sessions = new  SessionUtil(request);
		if (sessions.getLoginUser()!= null) {
			user_idx = Integer.parseInt(sessions.getLoginUser().getUser_idx());
		}
		try {
			result = remoteMgrService.insertResult(job_idx, client_idx, job_kind, job_result, user_idx);
			logger.debug("============= result: " + result);
			
		}catch(Exception e) {
			result =0;
			e.printStackTrace();
		}
		//개발용 관리자 페이지로 이동
		mav.addObject("status", result);
		return mav;
	}
	
	/**파일 추가*/
	@RequestMapping(value="/insertFile.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertFile(@RequestParam(value="file_name")String file_name,
										 @RequestParam(value="folder_path")String folder_path,
										 @RequestParam(value="job_desc")String job_desc,
										 @RequestParam(value="job_type")String job_type,
										 HttpServletRequest request ) throws Throwable {
		
		logger.debug("============= insertFile =============");
		logger.debug("============= file_name : " + file_name);
		logger.debug("============= folder_path: " + folder_path);
		logger.debug("============= job_desc: " + job_desc);
		logger.debug("============= job_type : " + job_type);

		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		int job_idx =0;
		int user_idx = 0;
		SessionUtil sessions = new  SessionUtil(request);
		if (sessions.getLoginUser()!= null) {
			user_idx = Integer.parseInt(sessions.getLoginUser().getUser_idx());
		}
		try {
			job_idx = remoteFileService.insertFile(file_name, folder_path, job_desc, job_type,user_idx);
		}catch(Exception e) {
			job_idx =0;
			e.printStackTrace();
		}
		//개발용 관리자 페이지로 이동
		if(job_idx != 0) 
			mav.addObject("status", true);
		else
			mav.addObject("status", false);
		
		mav.addObject("job_idx", job_idx);
		return mav;
	}
	
	
	/**프로세스 실행*/
	@RequestMapping(value="/process.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getProcess(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/process");
		return modelAndView;
	}

	/**프로세스 종료*/
	@RequestMapping(value="/process2.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getProcess2(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/process2");
		return modelAndView;
	}

	/**프로세스 서비스 상태 검사*/
	@RequestMapping(value="/process3.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getProcess3(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/process3");
		return modelAndView;
	}

	
	/**프로세스 서비스 시작*/
	@RequestMapping(value="/process4.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getProcess4(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/process4");
		return modelAndView;
	}

	/**프로세스 서비스 중지*/
	@RequestMapping(value="/process5.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getProcess5(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/process5");
		return modelAndView;
	}

	
	/**파일 추가*/
	@RequestMapping(value="/insertProcess.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertProcess(@RequestParam(value="process_name")String process_name,
										 @RequestParam(value="job_desc")String job_desc,
										 @RequestParam(value="job_type")String job_type,
										 HttpServletRequest request ) throws Throwable {
		
		logger.debug("============= insertProcess =============");
		logger.debug("============= process_name : " + process_name);
		logger.debug("============= job_desc: " + job_desc);
		logger.debug("============= job_type : " + job_type);

		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int job_idx =0;
		int user_idx = 0;
		SessionUtil sessions = new  SessionUtil(request);
		if (sessions.getLoginUser()!= null) {
			user_idx = Integer.parseInt(sessions.getLoginUser().getUser_idx());
		}
		try {
			job_idx = remotePrcService.insertProcess(process_name, job_desc, job_type,user_idx);
		}catch(Exception e) {
			job_idx =0;
			e.printStackTrace();
		}
		//개발용 관리자 페이지로 이동
		if(job_idx != 0) 
			mav.addObject("status", true);
		else
			mav.addObject("status", false);
		
		mav.addObject("job_idx", job_idx);
		return mav;
	}
	
	
	/** 레지스트리 조회*/
	@RequestMapping(value="/registry.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getRegistry(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/registry");
		return modelAndView;
	}
	
	/** 레지스트리 추가*/
	@RequestMapping(value="/registry2.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getRegistry2(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/registry2");
		return modelAndView;
	}
	
	
	/**레지스트리 수정*/
	@RequestMapping(value="/registry3.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getRegistry3(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/registry3");
		return modelAndView;
	}
	
	
	/**레지스트리 삭제*/
	@RequestMapping(value="/registry4.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getRegistry4(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/registry4");
		return modelAndView;
	}
	
	
	/**레지스트리 추가*/
	@RequestMapping(value="/insertRegistry.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertRegistry(@RequestParam(value="key_name")String key_name,
										 @RequestParam(value="subkey_name")String subkey_name,
										 @RequestParam(value="value_name")String value_name,
										 @RequestParam(value="data_type")String data_type,
										 @RequestParam(value="reg_value")String reg_value,
										 @RequestParam(value="job_desc")String job_desc,
										 @RequestParam(value="job_type")String job_type,
										 HttpServletRequest request ) throws Throwable {
		

		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int job_idx =0;
		int user_idx = 0;
		SessionUtil sessions = new  SessionUtil(request);
		if (sessions.getLoginUser()!= null) {
			user_idx = Integer.parseInt(sessions.getLoginUser().getUser_idx());
		}
		RemoteRegMgrVO remoteR = new RemoteRegMgrVO();
		remoteR.setKey_name(subkey_name);
		remoteR.setSubkey_name(subkey_name);
		remoteR.setValue_name(value_name);
		remoteR.setData_type(data_type);
		remoteR.setReg_value(reg_value);
		remoteR.setJob_type(job_type);
		remoteR.setJob_desc(job_desc);
		remoteR.setUser_idx(user_idx);
		
		try {
			job_idx = remoteRegService.insertRegistry(remoteR);
		}catch(Exception e) {
			job_idx =0;
			e.printStackTrace();
		}
		//개발용 관리자 페이지로 이동
		if(job_idx != 0) 
			mav.addObject("status", true);
		else
			mav.addObject("status", false);
		
		mav.addObject("job_idx", job_idx);
		return mav;
	}
	
	
	/**프로그램 배포*/
	@RequestMapping(value="/program.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getProgram(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/program");
		return modelAndView;
	}
	
	/**프로그램 배포*/
	@RequestMapping(value="/insertDist.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertDist(@RequestParam(value="file_name")String file_name,
										 @RequestParam(value="job_desc")String job_desc,
										 HttpServletRequest request ) throws Throwable {
		

		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int job_idx =0;
		int user_idx = 0;
		SessionUtil sessions = new  SessionUtil(request);
		if (sessions.getLoginUser()!= null) {
			user_idx = Integer.parseInt(sessions.getLoginUser().getUser_idx());
		}
		RemoteProgMgrVO remoteP = new RemoteProgMgrVO();
		remoteP.setFile_name(file_name);
		remoteP.setJob_desc(job_desc);
		remoteP.setUser_idx(user_idx);
		
		try {
			job_idx = remoteProgService.insertDist(remoteP);
		}catch(Exception e) {
			job_idx =0;
			e.printStackTrace();
		}
		//개발용 관리자 페이지로 이동
		if(job_idx != 0) 
			mav.addObject("status", true);
		else
			mav.addObject("status", false);
		
		mav.addObject("job_idx", job_idx);
		return mav;
	}

	/**자동화 기기 종료관리*/
	@RequestMapping(value="/pc_end.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getPcEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/pc_end");
		return modelAndView;
	}

	/**자동화 기기 종료 추가*/
	@RequestMapping(value="/insertState.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertState(@RequestParam(value="job_type")String job_type,
										 @RequestParam(value="job_desc")String job_desc,
										 HttpServletRequest request ) throws Throwable {
		
		logger.debug("============= job_desc: " + job_desc);
		logger.debug("============= job_type : " + job_type);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int job_idx =0;
		int user_idx = 0;
		SessionUtil sessions = new  SessionUtil(request);
		if (sessions.getLoginUser()!= null) {
			user_idx = Integer.parseInt(sessions.getLoginUser().getUser_idx());
			
		}
		RemoteDeviceMgrVO remoteD = new RemoteDeviceMgrVO();
		remoteD.setJob_type(job_type);
		remoteD.setJob_desc(job_desc);
		remoteD.setUser_idx(user_idx);
		
		try {
			job_idx = remoteDeviceService.insertState(remoteD);
			
			logger.debug("============= job_idx: " + job_idx);
		}catch(Exception e) {
			job_idx =0;
			e.printStackTrace();
		}
		//개발용 관리자 페이지로 이동
		if(job_idx != 0) 
			mav.addObject("status", true);
		else
			mav.addObject("status", false);
		
		mav.addObject("job_idx", job_idx);
		return mav;
	}
	
	
	/**이벤트*/
	@RequestMapping(value="/event.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getEvent(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/event");
		return modelAndView;
	}

	/**자동화기기 덤프관리*/
	@RequestMapping(value="/pc_dump.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getPcDump(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/pc_dump");
		return modelAndView;
	}
	
	/**자동화기기 정책관리*/
	@RequestMapping(value="/policy.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getPolicy(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/policy");
		return modelAndView;
	}
	
	/**자동화 기기 정책관리 추가*/
	@RequestMapping(value="/insertPolicy.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView insertPolicy(@RequestParam(value="job_type")String job_type,
										 @RequestParam(value="job_desc")String job_desc,
										 HttpServletRequest request ) throws Throwable {
		
		logger.debug("============= job_desc: " + job_desc);
		logger.debug("============= job_type : " + job_type);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int job_idx =0;
		int user_idx = 0;
		SessionUtil sessions = new  SessionUtil(request);
		if (sessions.getLoginUser()!= null) {
			user_idx = Integer.parseInt(sessions.getLoginUser().getUser_idx());
			
		}
		RemotePolicyMgrVO remotePolicy = new RemotePolicyMgrVO();
		remotePolicy.setJob_type(job_type);
		remotePolicy.setJob_desc(job_desc);
		remotePolicy.setUser_idx(user_idx);
		
		try {
			job_idx = remotePolicyService.insertPolicy(remotePolicy);
			
			logger.debug("============= job_idx: " + job_idx);
		}catch(Exception e) {
			job_idx =0;
			e.printStackTrace();
		}
		//개발용 관리자 페이지로 이동
		if(job_idx != 0) 
			mav.addObject("status", true);
		else
			mav.addObject("status", false);
		
		mav.addObject("job_idx", job_idx);
		return mav;
	}
	
	
	/** 원격제어 */
	@RequestMapping(value="/remote.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getRemote(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/remote");
		return modelAndView;
	}

	/**화면 캡쳐*/
	@RequestMapping(value="/capture.html", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getCapture(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/remote/capture");
		return modelAndView;
	}
	


	

}
