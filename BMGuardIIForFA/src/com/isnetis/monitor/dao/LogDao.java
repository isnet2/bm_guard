package com.isnetis.monitor.dao;

import java.util.List;

import com.isnetis.monitor.domain.LogSearchVO;

public interface LogDao {

	List<LogSearchVO> getLogSearch() throws Throwable;

}
