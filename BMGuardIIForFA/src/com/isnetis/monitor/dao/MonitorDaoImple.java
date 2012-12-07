package com.isnetis.monitor.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.device.domain.ClientMastVO;
import com.isnetis.monitor.domain.ClientLimitMastVO;
import com.isnetis.monitor.domain.CpuLimitListVO;
import com.isnetis.monitor.domain.DiskLimitListVO;
import com.isnetis.monitor.domain.MemoryLimitListVO;

@Repository("MonitorDao")
public class MonitorDaoImple extends SqlSessionDaoSupport implements MonitorDao {

	@Override
	public List<MemoryLimitListVO> getMemoryList() throws Throwable {
		// TODO Auto-generated method stub
		return (List<MemoryLimitListVO>)getSqlSession().selectList("ClientLimitMast.getMemoryLimitList");
	}

	@Override
	public List<CpuLimitListVO> getCpuList() throws Throwable {
		// TODO Auto-generated method stub
		return (List<CpuLimitListVO>)getSqlSession().selectList("ClientLimitMast.getCpuLimitList");
	}

	@Override
	public ClientLimitMastVO getClientLimit() throws Throwable {
		// TODO Auto-generated method stub
		return (ClientLimitMastVO)getSqlSession().selectOne("ClientLimitMast.getClientLimit");
	}

	@Override
	public int insertCritical(ClientLimitMastVO clientLimit) throws Throwable {
		// TODO Auto-generated method stub
		return getSqlSession().update("ClientLimitMast.insertClientLimit",clientLimit);
	}

	@Override
	public List<ClientLimitMastVO> getLimitDateList(Map<String, String> param)
			throws Throwable {
		// TODO Auto-generated method stub
		return (List<ClientLimitMastVO>)getSqlSession().selectList("ClientLimitMast.getLimitDateList", param);
	}

}
