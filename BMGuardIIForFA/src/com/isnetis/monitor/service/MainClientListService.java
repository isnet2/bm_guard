package com.isnetis.monitor.service;

import java.util.List;

import com.isnetis.monitor.domain.MainClientListVO;

public interface MainClientListService {

	List<MainClientListVO> getMainClientList() throws Throwable;
	int deleteMainClientList(MainClientListVO mainClientList) throws Throwable;
	int insertMainClientList(MainClientListVO mainClientList) throws Throwable;
}
