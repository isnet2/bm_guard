package com.isnetis.device.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.util.DigestUtils;

import com.isnetis.common.dao.CommonDao;
import com.isnetis.common.dao.TempDao;
import com.isnetis.device.dao.ClientGroupDao;
import com.isnetis.device.dao.ClientMastDao;
import com.isnetis.device.domain.ClientGroupVO;
import com.isnetis.device.domain.ClientMastVO;

@Service
public class ClientMastServiceImp implements ClientMastService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 트랜잭션 처리 선언
	@Inject
	private PlatformTransactionManager tx;
	
	@Autowired
	private ClientMastDao clientMastDao;
	
	@Autowired 
	private ClientGroupDao clientGrpDao;
	
	@Autowired
	private CommonDao commonDao;
	
	@Autowired
	private TempDao tempDao;
	
	
	@Override
	public int addDevice(ClientMastVO clientMast) {
		int idx =commonDao.getIdx("CLIENT_MAST");
		clientMastDao.addDevice(clientMast);
		return idx;
	}

	@Override
	public void addDeleteKey(int client_idx) {
		
		String deleteKey = this.generateDeleteKey();
		
		ClientMastVO vo = new ClientMastVO();
		vo.setClient_idx(client_idx);
		vo.setDelete_key(deleteKey);
		clientMastDao.addDeleteKey(vo);

	}
	
	private String generateDeleteKey(){
		String seed = String.valueOf(System.currentTimeMillis());
		//return DigestUtils.md5DigestAsHex(seed.getBytes()).substring(0, 16);
		return seed;
	}
	
	@Override
	public List<ClientMastVO> getDeleteHistory(Map<String, String> map) {
		return clientMastDao.getDeleteHistory(map);
	}
	
	@Override
	public void renameDevice(ClientMastVO clientMast) {
		clientMastDao.renameDevice(clientMast);
		clientMastDao.addDeviceHistory(clientMast.getClient_idx());
	}
	
	@Override
	public void removeDevice(ClientMastVO clientMast) {
		clientMastDao.removeDevice(clientMast);
		clientMastDao.addDeviceHistory(clientMast.getClient_idx());
	}
	
//	@Override
//	public List<ClientMastVO> searchDeviceList(String option, String search_str) {
//		return clientMastDao.searchDeviceList(option, search_str);
//	}

	@Override
	public List<ClientMastVO> getInertClient() throws Throwable {
		// TODO Auto-generated method stub
		return clientMastDao.getInertClient();
	}

	@Override
	public List<ClientMastVO> getLimitHistoryList(String value)
			throws Throwable {
		// TODO Auto-generated method stub
		return clientMastDao.getLimitHistoryList(value);
	}

	@Override
	public List<ClientMastVO> getIpDuplicateList() {
		// TODO Auto-generated method stub
		return clientMastDao.getIpDuplicateList();
	}

	@Override
	public List<ClientMastVO> getDeviceList(int clientgrp_idx) {
		// TODO Auto-generated method stub
		return clientMastDao.getDeviceList(clientgrp_idx);
	}

	@Override
	public int insertAllDevice(HashMap<Integer, String> map) {
		
		logger.debug("**addTemp**");
		int rtnCnt = 0;
		HashMap <String, String> result = new HashMap<String, String>();
		
		TransactionStatus status = tx.getTransaction(new DefaultTransactionDefinition());
		try {
			
			for(int i = 0; i < map.size();i++) {
				String [] arr = (String [])map.get(i).split(",");
			
				result.put("col1", arr[0]);
				result.put("col2", arr[1]);
				result.put("col3", arr[2]);
				result.put("col4", arr[3]);
				result.put("col5", arr[4]);
				result.put("col6", arr[5]);
				
				ClientGroupVO clientGrp = new ClientGroupVO();
				clientGrp.setClientgrp_name(arr[3]);
				clientGrp.setClientgrp_code(arr[4]);
				
				//상위그룹 insert 혹은 상위그룹 번호 알아 오기
				ClientGroupVO rtnGrp= clientGrpDao.getClientGroupByName(clientGrp);
				int p_idx = 0;
				
				if(rtnGrp == null){ 
					p_idx = commonDao.getIdx("CLIENTGRP_LIST");	
					clientGrpDao.insertClientGroup(clientGrp);
				
				}else {
					p_idx = rtnGrp.getClientgrp_idx();
				}
				
				// 현재 그룹  insert 혹은 그룹 번호 알아 오기
				clientGrp.setClientgrp_name(arr[0]);
				clientGrp.setClientgrp_code(arr[1]);
				clientGrp.setClientgrp_pidx(p_idx);
				
				rtnGrp= clientGrpDao.getClientGroupByName(clientGrp);
				
				if(rtnGrp == null){ 
					clientGrp.setClientgrp_idx(commonDao.getIdx("CLIENTGRP_LIST"));	
					clientGrpDao.insertClientGroup(clientGrp);
					clientGrpDao.increaseRefCount(clientGrp.getClientgrp_pidx());
				
				}else {
					clientGrp.setClientgrp_idx(rtnGrp.getClientgrp_idx());
				}
				// 기기 등록
				ClientMastVO client = new ClientMastVO();
				client.setClient_name(arr[5]);
				client.setClientGrp(clientGrp);
				
				clientMastDao.addDevice(client);
								
			}
			tx.commit(status);
			rtnCnt = 1;
		}catch(Exception e) {
			tx.rollback(status);
			e.printStackTrace();
		}
		
		return rtnCnt;
	}
}
