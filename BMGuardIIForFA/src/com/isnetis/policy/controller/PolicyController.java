package com.isnetis.policy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.isnetis.common.domain.CommonConstant;
import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.policy.domain.PolicyMastVO;
import com.isnetis.policy.service.PolicyFileService;
import com.isnetis.policy.service.PolicyMastService;

@Controller
@RequestMapping("/policy")
public class PolicyController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PolicyMastService policyMastService;
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	
	// 정책 조회 페이지로 이동
	@RequestMapping(value="/index.html")
	public ModelAndView index(@RequestParam(value="policy_idx",required=false) Integer policy_idx){
		
		logger.info("["+getClass().getName() + "] policy_idx["+policy_idx+"]");
		
		ModelAndView mav = new ModelAndView();
		
		List<PolicyMastVO> policyMastList = policyMastService.getPolicyMastList();
		mav.addObject("policyMastList", policyMastList);
		
		if(policy_idx!=null)
			mav.addObject("policy_idx", policy_idx);
		
		mav.setViewName("/policy/index");
		
		return mav;
	}
	
	// 정책 신규 생성 페이지로 이동
	@RequestMapping(value="/createPolicy.html")
	public ModelAndView createPolicy(){
		
		ModelAndView mav = new ModelAndView();
		
		List<PolicyMastVO> policyMastList = policyMastService.getPolicyMastList();
		mav.addObject("policyMastList", policyMastList);
		mav.setViewName("/policy/createPolicy");
		
		return mav;
	}
	
	
	@RequestMapping(value="/updatePolicy.html")
	public ModelAndView updatePolicy(@RequestParam(value="policy_idx",required=false) Integer policy_idx){
		
		ModelAndView mav = new ModelAndView();
		
		List<PolicyMastVO> policyMastList = policyMastService.getPolicyMastList();
		mav.addObject("policyMastList", policyMastList);
		
		if(policy_idx !=null && policy_idx!= 0) {
			
			PolicyMastVO policyMast = policyMastService.getPolicyInfo(policy_idx);
			mav.addObject("policyMast", policyMast);
		}
		mav.setViewName("/policy/updatePolicy");
		
		return mav;
	}
	
	// 정책 적용 페이지로 이동
	@RequestMapping(value="/apply.html")
	public ModelAndView applyIndex(){
		ModelAndView mav = new ModelAndView();
		
		List<PolicyMastVO> policyMastList = policyMastService.getPolicyMastList();
		mav.addObject("policyMastList", policyMastList);
		
		List<PolicyMastVO> policyNowMastList = policyMastService.getNowPolicyMastList();
		mav.addObject("policyNowMastList", policyNowMastList);
		
		mav.setViewName("/policy/apply");
		
		return mav;
	}
	
	// 정책 적용 페이지로 이동
	@RequestMapping(value="/cri_device.html")
	public ModelAndView criDvice(){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/policy/cri_device");
		return mav;
	}
	
	// 정책 조회(정책기준) 페이지로 이동
	@RequestMapping(value="/cri_policy.html")
	public ModelAndView criPolicy(){
		ModelAndView mav = new ModelAndView();
		
		List<PolicyMastVO> policyMastList = policyMastService.getPolicyMastList();
		mav.addObject("policyMastList", policyMastList);
		
		mav.setViewName("/policy/cri_policy");
		return mav;
	}
	
	// 정책 상세정보 조회
	@RequestMapping(value="/policyInfo.html")
	public ModelAndView getPolicyInfo(@RequestParam(value="policy_idx")int policy_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		PolicyMastVO policyMast = policyMastService.getPolicyInfo(policy_idx);
		mav.addObject("policyMast", policyMast);
		
		return mav;
	}
	
	// 정책 목록 조회
	@RequestMapping(value="/getPolicyList.html")
	public ModelAndView getPolicyList(){
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		List<PolicyMastVO> policyMastList = policyMastService.getPolicyMastList();
		mav.addObject("policyMastList", policyMastList);
		
		return mav;
	}
	
	// 정책 추가
	@RequestMapping(value="/addPolicy.html")
	public ModelAndView addPolicy(PolicyMastVO policy){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int resultCode = CommonConstant.REQUEST_PROCESS_SUCCEED;
		int policy_idx = 0;
		try{
			policy_idx = policyMastService.addPolicy(policy);
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
			resultCode = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultCode);
		mav.addObject("policy_idx", policy_idx);
		return mav;
	}
	
	// 정책 수정
	@RequestMapping(value="/changePolicy.html")
	public ModelAndView changePolicy(PolicyMastVO policy){ ModelAndView mav = new ModelAndView();
	
		logger.info("["+getClass().getName() + "] changePolicy() policy_idx["+policy.getPolicy_idx()+"]");
	
		mav.setView(mappingJacksonJsonView);
		
		int resultCode = CommonConstant.REQUEST_PROCESS_FAIL;
		int result = 0;
		try{
			result = policyMastService.changePolicy(policy);
			if (result == 1 ) {
				resultCode = CommonConstant.REQUEST_PROCESS_SUCCEED;
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.error(e.getMessage());
			resultCode = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultCode);
		
		return mav;
	}
	
	
	@RequestMapping(value="/getDeviceListByClientGrpIdx.html")
	public ModelAndView getDeviceListByClientGrpIdx(@RequestParam(value="clientgrp_idx")int clientgrp_idx,
													@RequestParam(value="nowsim_flag", required=false, defaultValue="-1")int nowsim_flag){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		List<ClientMastVO> deviceList = policyMastService.getDeviceListForPolicy(clientgrp_idx, CommonConstant.UNCHECKED_SIM_FLAG);
		mav.addObject("deviceList", deviceList);
		
		return mav;
	}
	
	@RequestMapping(value="/getDeviceByClientIdx.html")
	public ModelAndView getDeviceByClientIdx(@RequestParam(value="client_idx")int client_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		ClientMastVO device = policyMastService.getDeviceForPolicy(client_idx);
		mav.addObject("device", device);
		
		return mav;
	}
	
	//선택기기정책적용 
	@RequestMapping(value="/applyPolicyString.html")
	public ModelAndView applyPolicyString(@RequestParam(value="policy_idx")int policy_idx,
											 @RequestParam(value="client_idxs")String client_idxs){
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		int result = 0;
		try {
			policyMastService.applyPolicyString(policy_idx, client_idxs);
			result = 1;
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		mav.addObject("result", result);
		return mav;
	}

	//선택기기정책적용 
	@RequestMapping(value="/applyPolicyOne.html")
	public ModelAndView applyPolicyOne(@RequestParam(value="policy_idx")int policy_idx,
									  @RequestParam(value="client_idx")int client_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		int result = 0;
		try {
			policyMastService.applyPolicyOne(policy_idx, client_idx);
			result = 1;
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		
		mav.addObject("result", result);
		return mav;
	}
	
	
	// 정책적용
	@RequestMapping(value="/applyPolicyForDevice.html")
	public ModelAndView applyPolicyForDevice(@RequestParam(value="policy_idx")int policy_idx,
											@RequestParam(value="sim_flag")int sim_flag,
											@RequestParam(value="client_idx")int[] client_idxValues){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		int resultCode = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try{
			policyMastService.applyPolicy(policy_idx, sim_flag, client_idxValues);
		}catch(Exception e){
			e.printStackTrace();
			resultCode = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultCode);
		
		return mav;
	}
	
	@RequestMapping(value="/getDeviceHistoryForPolicy.html")
	public ModelAndView getDeviceHistoryForPolicy(@RequestParam(value="client_idx")int client_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		ClientMastVO device = policyMastService.getDeviceForPolicy(client_idx);
		mav.addObject("device", device);
		
		return mav;
	}
	
	@RequestMapping(value="/getDeviceListByPolicyIdx.html")
	public ModelAndView getDeviceListByPolicyIdx(@RequestParam(value="policynow_idx")Integer policynow_idx,
												 @RequestParam(value="nowsim_flag", required=false, defaultValue="-1")int nowsim_flag){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		List<ClientMastVO> deviceList = policyMastService.getDeviceListByPolicyIdx(policynow_idx, nowsim_flag);
		mav.addObject("deviceNowList", deviceList);
		
		return mav;
	}
	
	@RequestMapping(value="/device.html")
	public ModelAndView getDevice(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		return mav;
	}
	
	@RequestMapping(value="/getDevicePolicyList.html")
	public ModelAndView getDevicePolicyList(@RequestParam(value="device_option", required=false )Integer device_option,
											@RequestParam(value="policynow_idx", required=false)Integer policynow_idx,
											@RequestParam(value="clientgrp_idx", required=false )Integer clientgrp_idx,
											@RequestParam(value="client_idx", required=false )Integer client_idx) {
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		
		List<ClientMastVO> deviceList = policyMastService.getDevicePolicyList(policynow_idx, device_option,clientgrp_idx, client_idx);
		
		logger.debug("*** deviceList Size = " + deviceList.size());
		mav.addObject("deviceList", deviceList);
		return mav;
	}
	

	@RequestMapping(value="/deletePolicy.html")
	public ModelAndView deletePolicy(@RequestParam(value="policy_idx")int policy_idx){
		
		logger.info("["+ getClass().getName() + "] deletePolicy() policy_idx["+policy_idx+"]");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		int result = 0;
		try {
			result = policyMastService.deletePolicy(policy_idx);
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		mav.addObject("result", result);
		
		return mav;
	}

	
}
