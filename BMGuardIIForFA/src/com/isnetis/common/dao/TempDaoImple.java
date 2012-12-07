package com.isnetis.common.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.common.domain.TempVO;

@Repository
public class TempDaoImple extends SqlSessionDaoSupport implements TempDao {

	@Override
	public int addCol6(HashMap<String, String> map) {
		return getSqlSession().update("Temp.addCol6", map);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TempVO> getTemp() {
		return (List<TempVO>)getSqlSession().selectList("Temp.getTemp");
	}

	@Override
	public int delTemp() {
		return getSqlSession().delete("Temp.delTemp");
	}
	
	@Override
	public void makeTempTable_Grp() {
		getSqlSession().selectOne("Temp.makeTempTable_Grp");
	}

}
