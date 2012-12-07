package com.isnetis.monitor.dao;

import java.util.List;
import java.util.Map;

import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.monitor.domain.ClientLimitMastVO;
import com.isnetis.monitor.domain.CpuLimitListVO;
import com.isnetis.monitor.domain.DiskLimitListVO;
import com.isnetis.monitor.domain.MemoryLimitListVO;

public interface MonitorDao {

	List<MemoryLimitListVO> getMemoryList() throws Throwable;

	List<CpuLimitListVO> getCpuList() throws Throwable;

	ClientLimitMastVO getClientLimit() throws Throwable;

	int insertCritical(ClientLimitMastVO clientLimit) throws Throwable;

	List<ClientLimitMastVO> getLimitDateList(Map<String, String> param) throws Throwable;;


}
