package com.isnetis.device.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.isnetis.common.domain.CommonConstant;
import com.isnetis.common.service.CommonService;
import com.isnetis.common.view.TreeJSONView;
import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.device.service.ClientMastService;

@Controller
public class ClientController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CommonService commonService;
	@Autowired
	private ClientMastService clientMastService;
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	
	@RequestMapping(value="/auto/index.html")
	public ModelAndView index(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/auto/index");
		return mav;
	}
	
	@RequestMapping(value="/auto/auto_del.html")
	public ModelAndView auto_del(){
		ModelAndView mav = new ModelAndView();
		
		List<String> osType = commonService.getOSType();
		mav.addObject("osType", osType);
		mav.setViewName("/auto/auto_del");
		return mav;
	}
	
	@RequestMapping(value="/auto/auto_overlap.html")
	public ModelAndView auto_overlap(){
		
		List<ClientMastVO> clientList = clientMastService.getIpDuplicateList();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/auto/auto_overlap");
		mav.addObject("clientList", clientList);
		mav.addObject("clientSize", clientList.size());
		return mav;
	}
	
	@RequestMapping(value="/auto/addDeleteKey.html")
	public ModelAndView addDeleteKey(@RequestParam("clientgrp_idx")int clientgrp_idx,
			                         @RequestParam("client_idx")int client_idx){
		
		logger.info("["+getClass().getName()+"][addDeleteKey] clientgrp_idx["+clientgrp_idx+"]");
		logger.info("["+getClass().getName()+"][addDeleteKey] client_idx["+client_idx+"]");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try {
			clientMastService.addDeleteKey(client_idx);
			List<ClientMastVO>clientList = clientMastService.getDeviceList(clientgrp_idx);
			mav.addObject("clientList", clientList);
		}catch(Exception e){
			logger.error("["+getClass().getName()+"][addDeleteKey] 삭제키 발급 오류");
			logger.error("["+getClass().getName()+"][addDeleteKey]" + e.getMessage());
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultStatus);
		return mav;
		
	}
	
	@RequestMapping(value="/auto/addDevice.html")
	public ModelAndView addDevice(@RequestParam("clientgrp_idx")int clientgrp_idx, 
								  @RequestParam("client_name")String client_name){

		logger.info("["+getClass().getName()+"][addDevice] clientgrp_idx["+clientgrp_idx+"]");
		logger.info("["+getClass().getName()+"][addDevice] client_name["+client_name+"]");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int idx = 0;
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		
		try{
			ClientGroupVO clientGroup = new ClientGroupVO();
			clientGroup.setClientgrp_idx(clientgrp_idx);
		
			ClientMastVO clientMast = new ClientMastVO();
			clientMast.setClient_name(client_name);
			clientMast.setClientGrp(clientGroup);
			
			idx = clientMastService.addDevice(clientMast);
		
			if (clientgrp_idx != 0) {
				List<ClientMastVO>clientList = clientMastService.getDeviceList(clientgrp_idx);
				mav.addObject("clientList", clientList);
			}
			mav.addObject("idx", idx);
			
		}catch(Exception e){
			logger.error("["+getClass().getName()+"][addDevice] 자동화기기 등록 오류");
			logger.error("["+getClass().getName()+"][addDevice]" + e.getMessage());
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultStatus);
		
		return mav;
	}
	
	@RequestMapping(value="/auto/getDeleteHistory.html")
	public ModelAndView getDeviceHistory(@RequestParam(value="start_date", required=false)String startDate, 
														@RequestParam(value="end_date", required=false)String endDate,
														@RequestParam(value="user_option", required=false)String userOption,
														@RequestParam(value="user_name", required=false)String username, 
														@RequestParam(value="device_option", required=false)String searchOption, 
														@RequestParam(value="search_str", required=false)String searchStr, 
														@RequestParam(value="os_type", required=false)String osType){
		
		logger.info("["+getClass().getName()+"][getDeviceHistory] start_date["+startDate+"]");
		logger.info("["+getClass().getName()+"][getDeviceHistory] end_date["+endDate+"]");
		logger.info("["+getClass().getName()+"][getDeviceHistory] user_option["+userOption+"]");
		logger.info("["+getClass().getName()+"][getDeviceHistory] user_name["+username+"]");
		logger.info("["+getClass().getName()+"][getDeviceHistory] device_option["+searchOption+"]");
		logger.info("["+getClass().getName()+"][getDeviceHistory] search_str["+searchStr+"]");
		logger.info("["+getClass().getName()+"][getDeviceHistory] os_type["+osType+"]");
		

		ModelAndView mav = new ModelAndView();	
		mav.setView(mappingJacksonJsonView);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("start_date", startDate);
		map.put("end_date", endDate + " 23:59:59");
		map.put("user_option", userOption);
		map.put("user_name", username);
		map.put("device_option", searchOption);
		map.put("search_str", searchStr);
		map.put("os_type", osType);
		
		List<ClientMastVO> clientList = clientMastService.getDeleteHistory(map);
		mav.addObject("clientList", clientList);
		
		return mav;
	}
	
	@RequestMapping(value="/auto/renameDevice.html")
	public ModelAndView renameDevice(@RequestParam("clientgrp_idx")int clientgrp_idx,
                                     @RequestParam("client_idx")int client_idx,
                                     @RequestParam("client_name")String client_name){
		
		logger.info("["+getClass().getName()+"][renameDevice] clientgrp_idx["+clientgrp_idx+"]");
		logger.info("["+getClass().getName()+"][renameDevice] client_idx["+client_idx+"]");
		logger.info("["+getClass().getName()+"][renameDevice] client_name["+client_name+"]");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try{
			ClientMastVO clientVO = new ClientMastVO();
			clientVO.setClient_idx(client_idx);
			clientVO.setClient_name(client_name);
			
			clientMastService.renameDevice(clientVO);
			if (clientgrp_idx != 0) {
				List<ClientMastVO>clientList = clientMastService.getDeviceList(clientgrp_idx);
				mav.addObject("clientList", clientList);
			}
			
			mav.addObject("operation", "REMOVE_GROUP");
		}catch(Exception e){
			logger.error("["+getClass().getName()+"][renameDevice] 자동화기기 이름변경 오류");
			logger.error("["+getClass().getName()+"][renameDevice]" + e.getMessage());
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		
		mav.addObject("status", resultStatus);
		
		return mav;
	}
	
	@RequestMapping(value="/auto/removeDevice.html")
	public ModelAndView removeDevice(@RequestParam("clientgrp_idx")int clientgrp_idx,
			                         @RequestParam("client_idx")int client_idx){
		
		logger.info("["+getClass().getName()+"][removeDevice] clientgrp_idx["+clientgrp_idx+"]");
		logger.info("["+getClass().getName()+"][removeDevice] client_idx["+client_idx+"]");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try{
			mav.addObject("operation", "REMOVE_GROUP");
			
			ClientMastVO clientVO = new ClientMastVO();
			clientVO.setClient_idx(client_idx);
			clientMastService.removeDevice(clientVO);
			
			if (clientgrp_idx != 0) {
				List<ClientMastVO>clientList = clientMastService.getDeviceList(clientgrp_idx);
				mav.addObject("clientList", clientList);
			}
		}catch(Exception e){
			logger.error("["+getClass().getName()+"][removeDevice] 자동화기기 삭제 오류");
			logger.error("["+getClass().getName()+"][removeDevice]" + e.getMessage());
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultStatus);
		return mav;
	}
	
	@RequestMapping(value="/auto/deleteIpDuplClient.html")
	public ModelAndView deleteIpDuplClient(@RequestParam("checkIndexs")String checkIndexs){
		
		logger.info("["+getClass().getName()+"][deleteIpDuplClient] checkIndexs["+checkIndexs+"]");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try{
			ClientMastVO clientVO = new ClientMastVO();
			String [] arr = checkIndexs.split(",");
			for(int i=0; i < arr.length;i++) {
				clientVO.setClient_idx(Integer.parseInt(arr[i]));
				clientMastService.removeDevice(clientVO);
			}
		}catch(Exception e){
			logger.error("["+getClass().getName()+"][removeDevice] 자동화기기 삭제 오류");
			logger.error("["+getClass().getName()+"][removeDevice]" + e.getMessage());
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultStatus);
		
		return mav;
	}
	
	@RequestMapping(value="/auto/insertAllDevice.html")
	public ModelAndView insertAllDevice(@RequestParam("arr") String arr) {
		
		logger.info("["+getClass().getName()+"][insertAllDevice] arr["+arr+"]");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		HashMap <Integer, String> map = new HashMap<Integer, String>();
		
		String [] arrays = arr.split("\\^");
		logger.debug("arrays.length : " + arrays.length );
		for(int i =0; i < arrays.length; i++) {
			map.put(i, arrays[i]);
		}
		
		logger.debug("map.size : " + map.size());
		
		int result = clientMastService.insertAllDevice(map);
		mav.addObject("result",result);
		return mav;
	}
	
	@RequestMapping(value="/device/list.html")
	public ModelAndView device_list(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/device/device_list");
		return mav;
	}
	
}
