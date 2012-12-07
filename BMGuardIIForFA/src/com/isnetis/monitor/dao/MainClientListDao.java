package com.isnetis.monitor.dao;

import java.util.List;

import com.isnetis.monitor.domain.MainClientListVO;

public interface MainClientListDao {

	List<MainClientListVO> getMainClientList() throws Throwable;
	int deleteMainClientList(MainClientListVO mainClientList) throws Throwable;
	int insertMainClientList(MainClientListVO mainClientList) throws Throwable;
}
