package com.isnetis.monitor.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.isnetis.monitor.dao.LogDao;
import com.isnetis.monitor.domain.LogSearchVO;

@Service("logService")
public class LogServiceImple implements LogService {

Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 트랜잭션 처리 선언
	@Inject
	private PlatformTransactionManager tx;
	
	@Autowired
	private LogDao logDao;

	@Override
	public List<LogSearchVO> getLogSerch() throws Throwable {
		// TODO Auto-generated method stub
		return logDao.getLogSearch();
	}
}
