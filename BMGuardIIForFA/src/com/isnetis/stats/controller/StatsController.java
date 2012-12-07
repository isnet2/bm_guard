package com.isnetis.stats.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.isnetis.common.domain.CommonConstant;
import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.service.ClientGroupService;
import com.isnetis.stats.service.StatsService;

@Controller
 public class StatsController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	@Autowired
	private ClientGroupService clientGroupService;
	@Autowired
	private StatsService statsService;
	
	// 자동화기기 운영현황(통계)
	@RequestMapping(value="/stats/index", method = RequestMethod.GET  )
	public ModelAndView getStats(ModelAndView modelAndView) throws Throwable {
		
		List<ClientGroupVO>  groupList = clientGroupService.getClientGroupList(CommonConstant.ROOT_GROUP_IDX);
		modelAndView.addObject("groupList", groupList);
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/stats/index");
		return modelAndView;
	}
	
	// 자동화기기 운영현황(통계)
	@RequestMapping(value="/stats/index", method = RequestMethod.POST  )
	public ModelAndView getStats(@RequestParam("start_date")String start_date,
								@RequestParam("end_date")String end_date,
								@RequestParam(value="os_type", required=false)String[] os_types,
								@RequestParam(value="clientgrp_idx", required=false)int[] clientgrp_idxs) throws Throwable {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		if(os_types != null){
			map.put("os_types", os_types);
		}
		if(clientgrp_idxs != null){
			map.put("clientgrp_idxs", clientgrp_idxs);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setView(mappingJacksonJsonView);
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		
		try{
			List<Map<String, Object>> deviceStatsByGroup =  statsService.getDeviceStatsByGroup(map);
			List<Map<String, Object>> deviceStatsByOstype =  statsService.getDeviceStatsByOsType(map);
			
			modelAndView.addObject("deviceStatsByGroup", deviceStatsByGroup);
			modelAndView.addObject("deviceStatsByOstype", deviceStatsByOstype);
			
		}catch(Exception e){
			e.printStackTrace();
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		modelAndView.addObject("status", resultStatus);
			
		return modelAndView;
	}
	
	/**통계 관리 리스트 페이지*/
	@RequestMapping(value="/stats/set", method = RequestMethod.GET )
	public ModelAndView getSet(ModelAndView modelAndView) throws Throwable {

		List<ClientGroupVO>  groupList = clientGroupService.getClientGroupList(CommonConstant.ROOT_GROUP_IDX);
		modelAndView.addObject("groupList", groupList);
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/stats/set");
		return modelAndView;
	}
	
	

	/**통계 관리 리스트 페이지*/
	@RequestMapping(value="/stats/set", method = RequestMethod.POST )
	public ModelAndView getSet(@RequestParam("start_date")String start_date,
								@RequestParam("end_date")String end_date,
								@RequestParam(value="clientgrp_idx", required=false)int[] clientgrp_idxs) throws Throwable {

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		if(clientgrp_idxs != null){
			map.put("clientgrp_idxs", clientgrp_idxs);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setView(mappingJacksonJsonView);
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		
		try{
			List<Map<String, Object>> list = statsService.getDeviceStateByGroup(map);
			modelAndView.addObject("new_device_list", list);
			
		}catch(Exception e){
			e.printStackTrace();
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		modelAndView.addObject("status", resultStatus);
			
		return modelAndView;
	}
	
	/**통계 관리 리스트 페이지*/
	@RequestMapping(value="/stats/policy", method = RequestMethod.GET )
	public ModelAndView getPolicy() throws Throwable {
		
		ModelAndView modelAndView = new ModelAndView();
		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/stats/policy");
		return modelAndView;
	}

	/**통계 관리 리스트 페이지*/
	@RequestMapping(value="/stats/policy_dvc", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getPolicyDvc(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/stats/policy_dvc");
		return modelAndView;
	}
	
	/**통계 관리 리스트 페이지*/
	@RequestMapping(value="/stats/report", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getreport(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/stats/report");
		return modelAndView;
	}
	
	/**통계 관리 리스트 페이지*/
	@RequestMapping(value="/stats/nowlog", method = { RequestMethod.POST,RequestMethod.GET } )
	public ModelAndView getNowLog(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView) throws Throwable {

		//개발용 관리자 페이지로 이동 
		modelAndView.setViewName("/stats/nowlog");
		return modelAndView;
	}
	
 }