package com.isnetis.common.dao;

import java.util.HashMap;
import java.util.List;

import com.isnetis.common.domain.TempVO;

public interface TempDao {

	List<TempVO> getTemp();
	int delTemp();
	int addCol6(HashMap<String, String> map);
	void makeTempTable_Grp();
}
