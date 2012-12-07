package com.isnetis.monitor.service;

import java.util.List;
import java.util.Map;

import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.monitor.domain.ClientLimitMastVO;
import com.isnetis.monitor.domain.CpuLimitListVO;
import com.isnetis.monitor.domain.MemoryLimitListVO;

public interface MonitorService {

	List<CpuLimitListVO> getCpuList() throws Throwable;
	
	List<MemoryLimitListVO> getMemoryList() throws Throwable;
	
	int insertCritical(ClientLimitMastVO clientLimit) throws Throwable;

	ClientLimitMastVO getClientLimit() throws Throwable;

	List<ClientLimitMastVO> getLimitDateList(Map<String, String> param) throws Throwable;
	

}
