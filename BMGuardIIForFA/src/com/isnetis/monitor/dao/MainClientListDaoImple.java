package com.isnetis.monitor.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.monitor.domain.MainClientListVO;

@Repository("MainClientListDao")
public class MainClientListDaoImple extends SqlSessionDaoSupport implements MainClientListDao {

	@Override
	public List<MainClientListVO> getMainClientList() throws Throwable {
		// TODO Auto-generated method stub
		return (List<MainClientListVO>)getSqlSession().selectList("MainClientList.getMainClientList");
	}

	@Override
	public int deleteMainClientList(MainClientListVO mainClientList) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("MainClientList.deleteMainClientList", mainClientList);
	}

	@Override
	public int insertMainClientList(MainClientListVO mainClientList) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().insert("MainClientList.insertMainClientList",mainClientList);
	}

}
