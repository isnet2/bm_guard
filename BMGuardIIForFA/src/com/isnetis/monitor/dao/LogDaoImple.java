package com.isnetis.monitor.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.monitor.domain.LogSearchVO;

@Repository("LogDao")
public class LogDaoImple extends SqlSessionDaoSupport implements LogDao {

	@Override
	public List<LogSearchVO> getLogSearch() throws Throwable {
		// TODO Auto-generated method stub
		return (List<LogSearchVO>)getSqlSession().selectList("");
	}

}
