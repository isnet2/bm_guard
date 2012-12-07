package com.isnetis.monitor.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.monitor.dao.MonitorDao;
import com.isnetis.monitor.domain.ClientLimitMastVO;
import com.isnetis.monitor.domain.CpuLimitListVO;
import com.isnetis.monitor.domain.DiskLimitListVO;
import com.isnetis.monitor.domain.MemoryLimitListVO;

@Service("monitorService")
public class MonitorServiceImp implements MonitorService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 트랜잭션 처리 선언
	@Inject
	private PlatformTransactionManager tx;
	
	@Autowired
	private MonitorDao monitorDao;

	@Override
	public List<CpuLimitListVO> getCpuList() throws Throwable {
		// TODO Auto-generated method stub
		return monitorDao.getCpuList();
	}

	@Override
	public List<MemoryLimitListVO> getMemoryList() throws Throwable {
		// TODO Auto-generated method stub
		return monitorDao.getMemoryList();
	}

	@Override
	public int insertCritical(ClientLimitMastVO clientLimit) throws Throwable {
		// TODO Auto-generated method stub
		return monitorDao.insertCritical(clientLimit);
	}

	@Override
	public ClientLimitMastVO getClientLimit() throws Throwable {
		// TODO Auto-generated method stub
		return monitorDao.getClientLimit();
	}

	@Override
	public List<ClientLimitMastVO> getLimitDateList(Map<String, String> param)
			throws Throwable {
		// TODO Auto-generated method stub
		return monitorDao.getLimitDateList(param);
	}

	
	
}
