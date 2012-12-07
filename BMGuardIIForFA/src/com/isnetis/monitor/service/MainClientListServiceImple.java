package com.isnetis.monitor.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.isnetis.monitor.dao.MainClientListDao;
import com.isnetis.monitor.domain.MainClientListVO;

@Service("mainClientService")
public class MainClientListServiceImple implements MainClientListService{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 트랜잭션 처리 선언
	@Inject
	private PlatformTransactionManager tx;
	
	@Autowired
	MainClientListDao mainClientListDao;
	
	@Override
	public List<MainClientListVO> getMainClientList() throws Throwable {
		// TODO Auto-generated method stub
		return mainClientListDao.getMainClientList();
	}

	@Override
	public int deleteMainClientList(MainClientListVO mainClientList) throws Throwable {
		// TODO Auto-generated method stub
		return mainClientListDao.deleteMainClientList(mainClientList);
	}

	@Override
	public int insertMainClientList(MainClientListVO mainClientList) throws Throwable {
		// TODO Auto-generated method stub
		return mainClientListDao.insertMainClientList(mainClientList);
	}

}
