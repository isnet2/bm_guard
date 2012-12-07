/**
 * @FileName  : CommonServiceImpl.java
 * @Project   : BMGuardIIForFA
 * @Date      : 2012. 10. 11. 
 * @작성자      : @author yion

 * @변경이력    :
 * @프로그램 설명 :
 */
package com.isnetis.common.service;

import java.util.List;

import javax.inject.Inject;

import org.directwebremoting.annotations.RemoteProxy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import com.isnetis.common.dao.CommonDao;

@Service("commonService")
@RemoteProxy(name="CommonService")
public  class CommonServiceImpl implements CommonService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 트랜잭션 처리 선언
	@Inject
	private PlatformTransactionManager tx;
	
	@Autowired
	private CommonDao commonDao;

	@Override
	public List<String> getOSType() {
		// TODO Auto-generated method stub
		return commonDao.getOSType();
	}
	



}
