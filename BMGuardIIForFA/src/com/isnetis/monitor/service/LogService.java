package com.isnetis.monitor.service;

import java.util.List;

import com.isnetis.monitor.domain.LogSearchVO;

public interface LogService {

	List<LogSearchVO> getLogSerch() throws Throwable; 
}
