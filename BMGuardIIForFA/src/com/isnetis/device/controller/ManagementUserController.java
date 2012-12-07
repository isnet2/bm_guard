package com.isnetis.device.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.isnetis.common.domain.CommonConstant;
import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ManagementUserVO;
import com.isnetis.device.service.ClientGroupService;
import com.isnetis.device.service.ManagementUserService;
import com.isnetis.util.DateUtil;

@Controller
@RequestMapping("/auto")
public class ManagementUserController {

	
	@Autowired
	private ManagementUserService managementUserService;
	@Autowired
	private ClientGroupService clientGroupService;
	@Autowired
	private MappingJacksonJsonView mappingJacksonJsonView;
	
	@RequestMapping(value="/addManagementUser.html")
	public ModelAndView addManagementUser(@RequestParam("userlogin_id")String userlogin_id,
															@RequestParam("userlogin_pwd")String userlogin_pwd,
															@RequestParam("clientGroupIdx")int[] clientGroupIdxValues) throws Exception{

		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		if(managementUserService.getManagementUserCnt(userlogin_id) > 0) {
			mav.addObject("resultCode", "duplicate");
			return mav;
		}
		
		try{
			
			ManagementUserVO vo = new ManagementUserVO();
			vo.setUserlogin_id(userlogin_id);
			vo.setUserlogin_pwd(DigestUtils.md5DigestAsHex(userlogin_pwd.getBytes()));
			vo.setCreate_date(DateUtil.getTodayTimeStamp());
			int result = managementUserService.addManagementUser(vo, clientGroupIdxValues);
			if (result == 1) {
				mav.addObject("resultCode", "success");
			}else {
				mav.addObject("resultCode", "fail");
			}
			
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject("resultCode", "fail");
		}
	
		return mav;
	}
	
	@RequestMapping(value="/getManagementUserList.html")
	public ModelAndView getManagementUserList(){
		
		ModelAndView mav = new ModelAndView();
		try{
			List<ManagementUserVO> userList = managementUserService.getManagementUserList(CommonConstant.UNCHECKED_INVALID_FLAG, null);
			List<ClientGroupVO>  groupList = clientGroupService.getClientGroupList(CommonConstant.ROOT_GROUP_IDX);
			
			mav.addObject("userList", userList);
			mav.addObject("groupList", groupList);
			mav.addObject("totalCount", userList.size());
			mav.setViewName("auto/auto_user");
		}catch(Exception e){
			e.printStackTrace();
			mav.setViewName("redirect:/auto/index.html");
		}
		return mav;
	}
	
	@RequestMapping(value="/searchManagementUserList.html")
	public ModelAndView searchManagementUserList(@RequestParam(value="status", defaultValue="-1")int status, 
																@RequestParam(value="clientGroupIdx", required=false)int[] clientGroupIdxValues){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		try{
			List<ManagementUserVO> userList = managementUserService.getManagementUserList(status, clientGroupIdxValues);
			mav.addObject("userList", userList);
			mav.addObject("resultCode", "success");
		}catch(Exception e){
			mav.addObject("resultCode", "fail");
		}
		return mav;
	}
	
	@RequestMapping(value="/deleteManagementUser.html")
	public ModelAndView deleteManagementUser(@RequestParam(value="user_idx")int[] user_idx){
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		try{
			int result = managementUserService.deleteManagementUser(user_idx);
			if (result == 1) {
				mav.addObject("resultCode", "success");
			}else {
				mav.addObject("resultCode", "fail");
			}
		}catch(Exception e){
			mav.addObject("resultCode", "fail");
		}
		return mav;
	}
	
	@RequestMapping(value="/updateManagementUser.html")
	public ModelAndView updateManagementUser(@RequestParam("user_idx")int user_idx,
																@RequestParam("userlogin_id")String userlogin_id,
																@RequestParam("userlogin_pwd")String userlogin_pwd,
																@RequestParam("clientGroupIdx")int[] clientGroupIdxValues) {
		
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		try{
			ManagementUserVO vo = new ManagementUserVO();
			vo.setUser_idx(user_idx);
			vo.setUserlogin_id(userlogin_id);
			vo.setUserlogin_pwd(userlogin_pwd);
			vo.setUpdate_date(DateUtil.getTodayTimeStamp());
			
			int result = managementUserService.updateManagementUser(vo, clientGroupIdxValues);
			if (result == 1) {
				mav.addObject("resultCode", "success");
			}else {
				mav.addObject("resultCode", "fail");
			}
		}catch(Exception e){
			e.printStackTrace();
			mav.addObject("resultCode", "fail");
		}
		return mav;
	}
	
	@RequestMapping(value="/getUserHistory.html")
	public ModelAndView getUserHistory(@RequestParam("user_idx")int user_idx){
		ModelAndView mav = new ModelAndView();
		mav.setView(mappingJacksonJsonView);
		
		List<ManagementUserVO> userList = managementUserService.getUserHistory(user_idx);
		mav.addObject("userList", userList);
		mav.addObject("userSize",userList.size());
		return mav;
	}
}
