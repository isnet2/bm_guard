package com.isnetis.policy.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.device.dao.ClientMastDao;
import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.policy.dao.FolderPolicyDao;
import com.isnetis.policy.dao.MediaPolicyDao;
import com.isnetis.policy.dao.PassPolicyDao;
import com.isnetis.policy.dao.PolicyMastDao;
import com.isnetis.policy.dao.SystemPolicyDao;
import com.isnetis.policy.domain.FolderPolicyVO;
import com.isnetis.policy.domain.MediaPolicyVO;
import com.isnetis.policy.domain.PassPolicyVO;
import com.isnetis.policy.domain.PolicyMastVO;
import com.isnetis.policy.domain.SystemPolicyVO;

@Service
public class PolicyMastServiceImp implements PolicyMastService{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	// 트랜잭션 처리 선언
	
	@Autowired
	private CommonDao commonDao;
	@Autowired
	private ClientMastDao clientMastDao;
	@Autowired
	private PolicyMastDao policyMastDao;
	@Autowired
	private FolderPolicyDao folderPolicyDao;
	@Autowired
	private PassPolicyDao passPolicyDao;
	@Autowired
	private SystemPolicyDao systemPolicyDao;
	@Autowired
	private MediaPolicyDao mediaPolicyDao;
	@Autowired
	private PolicyFileService policyFileService;
	
	@Override
	public int addPolicy(PolicyMastVO policyMast) {
		
		int policy_idx = commonDao.getIdx("policy_mast");
		policyMast.setPolicy_idx(policy_idx);
		
		List<FolderPolicyVO> folderPolicyList = policyMast.getFolderPolicyList();
		List<PassPolicyVO> passPolicyList = policyMast.getPassPolicyList();
		List<SystemPolicyVO> systemPolicyList = policyMast.getSystemPolicyList();
		List<MediaPolicyVO> mediaPolicyList = policyMast.getMediaPolicyList();
		List<String> osTypeList = policyMast.getOsTypeList();

		policyMastDao.addPolicy(policyMast);
		
		if(osTypeList != null){
			for(String os_type : osTypeList){
				policyMastDao.addOsType(policy_idx, os_type);
			}
		}
		if(folderPolicyList != null){
			for(FolderPolicyVO folderPolicy : folderPolicyList){
				folderPolicy.setPolicy_idx(policy_idx);
				folderPolicyDao.addFolderPolicy(folderPolicy);
			}
		}
		if(passPolicyList != null){
			for(PassPolicyVO passPolicy : passPolicyList){
				passPolicy.setPolicy_idx(policy_idx);
				passPolicyDao.addPassPolicy(passPolicy);
			}
		}
		if(systemPolicyList != null){
			for(SystemPolicyVO systemPolicy : systemPolicyList){
				systemPolicy.setPolicy_idx(policy_idx);
				systemPolicyDao.addSystemPolicy(systemPolicy);
			}
		}
		if(mediaPolicyList != null){
			for(MediaPolicyVO mediaPolicy : mediaPolicyList){
				mediaPolicy.setPolicy_idx(policy_idx);
				mediaPolicyDao.addMediaPolicy(mediaPolicy);
			}
		}
		
		policyFileService.insertPoliceFile(policyMast);
		
		return policy_idx;
		
	}
	
	@Override
	public List<PolicyMastVO> getPolicyMastList() {
		return policyMastDao.getPolicyMastList();
	}
	
	@Override
	public PolicyMastVO getPolicyInfo(int policy_idx) {
		return policyMastDao.getPolicyInfo(policy_idx);
	}
	
	@Override
	public List<ClientMastVO> getDeviceListForPolicy(int clientgrp_idx, int nowsim_flag) {
		return clientMastDao.getDeviceListForPolicyByClientGroupIdx(clientgrp_idx, nowsim_flag);
	}
	
	@Override
	public ClientMastVO getDeviceForPolicy(int client_idx) {
		return clientMastDao.getDeviceInfoForPolicyByClientIdx(client_idx);
	}
	
	@Override
	public void applyPolicy(int policy_idx, int sim_flag, int[] client_idxValues) {
		clientMastDao.applyPolicy(policy_idx, sim_flag, client_idxValues);
		for(int client_idx : client_idxValues){
			clientMastDao.addDeviceHistory(client_idx);
			policyMastDao.addPolicyApplyClient(policy_idx, sim_flag, client_idx);
		}
		
	}
	
	@Override
	public List<ClientMastVO> getDeviceListByPolicyIdx(Integer policynow_idx, Integer nowsim_flag) {
		return clientMastDao.getDeviceListByPolicyIdx(policynow_idx, nowsim_flag);
	}

	@Override
	public List<ClientMastVO> getDevicePolicyList(Integer policynow_idx,
			Integer device_option, Integer clientgrp_idx, Integer client_idx) {
		// TODO Auto-generated method stub
		return clientMastDao.getDevicePolicyList(policynow_idx, device_option, clientgrp_idx, client_idx);
	}

	@Override
	public int deletePolicy(int policy_idx) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = policyMastDao.deletePolicy(policy_idx);
			policyMastDao.addPolicyHistory(policy_idx);
		}catch (Exception e){
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int addPolicyHistory(int policy_idx) {
		// TODO Auto-generated method stub
		return policyMastDao.addPolicyHistory(policy_idx);
	}

	@Override
	public int changePolicy(PolicyMastVO policy) {
		logger.info(getClass().getName() + "changePolicy() execute.");
		
		int result = 0;
		
		int policy_idx = policy.getPolicy_idx();
		
		List<FolderPolicyVO> folderPolicyList = policy.getFolderPolicyList();
		List<PassPolicyVO> passPolicyList = policy.getPassPolicyList();
		List<SystemPolicyVO> systemPolicyList = policy.getSystemPolicyList();
		List<MediaPolicyVO> mediaPolicyList = policy.getMediaPolicyList();
		List<String> osTypeList = policy.getOsTypeList();
		
		try {
		
			policyMastDao.updatePolicy(policy);
			
			if(osTypeList != null){
				//del & insert
				policyMastDao.delOsType(policy_idx);
				
				for(String os_type : osTypeList){
					policyMastDao.addOsType(policy_idx, os_type);
				}
			}
			if(folderPolicyList != null){
				//del & insert
				folderPolicyDao.delFolderPolicy(policy_idx);
				
				for(FolderPolicyVO folderPolicy : folderPolicyList){
					folderPolicy.setPolicy_idx(policy_idx);
					folderPolicyDao.addFolderPolicy(folderPolicy);
				}
			}
			if(passPolicyList != null){
				//del & insert
				passPolicyDao.delPassPolicy(policy_idx);
				
				for(PassPolicyVO passPolicy : passPolicyList){
					passPolicy.setPolicy_idx(policy_idx);
					passPolicyDao.addPassPolicy(passPolicy);
				}
			}
			if(systemPolicyList != null){
				
				//del & insert
				systemPolicyDao.delSystemPolicy(policy_idx);
				
				for(SystemPolicyVO systemPolicy : systemPolicyList){
					systemPolicy.setPolicy_idx(policy_idx);
					systemPolicyDao.addSystemPolicy(systemPolicy);
				}
			}
			if(mediaPolicyList != null){
				
				//del & insert
				mediaPolicyDao.delMediaPolicy(policy_idx);
				
				for(MediaPolicyVO mediaPolicy : mediaPolicyList){
					mediaPolicy.setPolicy_idx(policy_idx);
					mediaPolicyDao.addMediaPolicy(mediaPolicy);
				}
			}
			
			policyFileService.deletePolicyFile(policy_idx);
			policyFileService.insertPoliceFile(policy);
			result = 1;
		}catch(Exception e) {
			result = 0;
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<PolicyMastVO> getNowPolicyMastList() {
		// TODO Auto-generated method stub
		return policyMastDao.getNowPolicyMastList();
	}

	@Override
	public int applyPolicyString(int policy_idx, String client_idxs) {
		// TODO Auto-generated method stub
		int result = 0;
		String [] client_arr = client_idxs.split(",");
		try {
			for(int i = 0; i < client_arr.length;i++) {
				int client_idx = Integer.parseInt(client_arr[i]);
				policyMastDao.addPolicyApplyClient(policy_idx, 0, client_idx);
				clientMastDao.addDeviceHistory(client_idx);
			}
			result =1;
		}catch(Exception e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int applyPolicyOne(int policy_idx, int client_idx) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			policyMastDao.addPolicyApplyClient(policy_idx, 0, client_idx);
			clientMastDao.addDeviceHistory(client_idx);
			result = 1;
		}catch(Exception e) {
			result =0;
			e.printStackTrace();
		}
		return result;
	}
}
