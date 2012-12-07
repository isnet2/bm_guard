/**
 * @FileName  : CommonDaoImpl.java
 * @Project   : BMGuardIIForFA
 * @Date      : 2012. 10. 11. 

 * @변경이력    :
 * @프로그램 설명 :
 */
package com.isnetis.common.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("commonDao")
public class CommonDaoImpl extends SqlSessionDaoSupport implements CommonDao {

	@SuppressWarnings("rawtypes")
	@Override
	public int getIdx(String tableName) {
		Map map = (Map)getSqlSession().selectOne("getIdx", tableName);
		return ((BigInteger)map.get("Auto_increment")).intValue();
	}

	@Override
	public List<String> getOSType() {
		// TODO Auto-generated method stub
		List<String> list = (List)getSqlSession().selectList("getOSTypeList");
		return list;
	}

}

