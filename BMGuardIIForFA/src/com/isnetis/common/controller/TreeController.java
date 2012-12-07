package com.isnetis.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.isnetis.common.domain.CommonConstant;
import com.isnetis.common.view.TreeJSONView;
import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.device.service.ClientGroupService;

@Controller
public class TreeController {

	@Autowired
	private ClientGroupService clientGroupService;
	@Autowired
	private TreeJSONView treeJSONView;
	
	@RequestMapping(value="/getChildren.html", method=RequestMethod.GET)
	public ModelAndView getGroup(@RequestParam("clientgrp_pidx")int clientgrp_pidx) {
		
		List<ClientGroupVO> list = clientGroupService.getClientGroupList(clientgrp_pidx);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(treeJSONView);
		mav.addObject("operation", "GET_CHILDREN");

		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/createGroup.html", method=RequestMethod.POST)
	public ModelAndView createGroup(@RequestParam("clientgrp_pidx")int clientgrp_pidx, @RequestParam("clientgrp_name")String clientgrp_name){
		
		ClientGroupVO vo = new ClientGroupVO();
		vo.setClientgrp_pidx(clientgrp_pidx);
		vo.setClientgrp_name(clientgrp_name);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(treeJSONView);
		mav.addObject("operation", "CREATE_GROUP");
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try{
			int idx = clientGroupService.createGroup(vo);
			mav.addObject("clientgrp_idx", idx);
		}catch(Exception e){
			e.printStackTrace();
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		
		mav.addObject("status", resultStatus);
		
		return mav;
	}
	
	@RequestMapping(value="/renameGroup.html", method=RequestMethod.POST)
	public ModelAndView renameGroup(@RequestParam("clientgrp_idx")int clientgrp_idx, @RequestParam("clientgrp_name")String clientgrp_name){
		
		ClientGroupVO vo = new ClientGroupVO();
		vo.setClientgrp_idx(clientgrp_idx);
		vo.setClientgrp_name(clientgrp_name);
		
		ModelAndView mav = new ModelAndView();
		mav.setView(treeJSONView);
		mav.addObject("operation", "RENAME_GROUP");
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try{
			clientGroupService.renameGroup(vo);
		}catch(Exception e){
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultStatus);
		
		return mav;
	}
	
	@RequestMapping(value="/removeGroup.html", method=RequestMethod.POST)
	public ModelAndView removeGroup(@RequestParam("clientgrp_idx")int clientgrp_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(treeJSONView);
		mav.addObject("operation", "REMOVE_GROUP");
		
		int resultStatus = CommonConstant.REQUEST_PROCESS_SUCCEED;
		try{
			clientGroupService.removeGroup(clientgrp_idx);
		}catch(Exception e){
			resultStatus = CommonConstant.REQUEST_PROCESS_FAIL;
		}
		mav.addObject("status", resultStatus);
		
		return mav;
	}
	
	@RequestMapping(value="/getDeviceList.html", method=RequestMethod.GET)
	public ModelAndView getDeviceList(@RequestParam("clientgrp_idx")int clientgrp_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(treeJSONView);
		mav.addObject("operation", "GET_DEVICE");
		
		List<ClientMastVO> list = clientGroupService.getDeviceList(clientgrp_idx);
		mav.addObject("list", list);
		mav.addObject("clientgrp_idx", clientgrp_idx);
		
		return mav;
	}
	
	@RequestMapping(value="/searchDeviceList.html")
	public ModelAndView searchDeviceList(@RequestParam("option")String option, @RequestParam("search_str")String search_str){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(treeJSONView);
		mav.addObject("operation", "SEARCH_DEVICE");
		
		List<String> list = clientGroupService.searchDeviceList(option, search_str);
		mav.addObject("list", list);
		
		return mav;
	}
	
	
}
