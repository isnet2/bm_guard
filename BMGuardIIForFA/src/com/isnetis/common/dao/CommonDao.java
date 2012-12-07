/**
 * @FileName  : CommonDao.java
 * @Project   : BMGuardIIForFA
 * @Date      : 2012. 10. 11. 
 * @작성자      : @author yion

 * @변경이력    :
 * @프로그램 설명 :
 */
package com.isnetis.common.dao;

import java.util.List;
import java.util.Map;

public interface CommonDao {

	int getIdx(String tableName);
	List <String> getOSType();
}
