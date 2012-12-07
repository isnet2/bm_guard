package com.isnetis.common.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.isnetis.common.dao.TempDao;

@Service("tempService")
@RemoteProxy(name="TempService")
public class TempServiceImple implements TempService {

	@Autowired
	private TempDao tempDao;
	
	@Override
	public void init_grp_temp() {
		tempDao.delTemp();
		tempDao.makeTempTable_Grp();
	}
	
}
