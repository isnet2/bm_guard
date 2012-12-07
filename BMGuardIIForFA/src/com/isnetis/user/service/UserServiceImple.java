package com.isnetis.user.service;

import java.util.List;

import javax.inject.Inject;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.isnetis.user.dao.UserDao;
import com.isnetis.user.domain.UserAttrMastVO;
import com.isnetis.user.domain.UserGrpListVO;
import com.isnetis.user.domain.UserMastBean;
import com.isnetis.user.domain.UserMastVO;

@Service("userService")
@RemoteProxy(name="UserService")
public class UserServiceImple implements UserService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 트랜잭션 처리 선언
	@Inject
	private PlatformTransactionManager tx;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public int getChangePwdQuesAns(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getChangePwdQuesAns(userMast);
	}

	@Override
	public List<UserMastVO> getList(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getUserList(userMast);
	}

	@Override
	public List<UserGrpListVO> getUserGrpList() throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getUserGrpList();
	}

	@Override
	public List<UserAttrMastVO> getUserAttrMast() throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getUserAttrMast();
	}

	@Override
	public int deleteUser(String user_idx) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.deleteUser(user_idx);
	}

	@Override
	public int insertUserHistory(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.insertUserHistory(userMast);
	}

	@Override
	public UserMastVO getFindIdxUserInfo(String user_idx) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getFindIdxUserInfo(user_idx);
	}

	@Override
	@RemoteMethod
	public List<UserMastVO> getFindIdxUserHistory(String user_idx) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getFindIdxUserHistory(user_idx);
	}
	
	@Override
	@RemoteMethod
	public Object[] getFindIdxDWR(String user_idx) throws Throwable {
		
		Object [] resultArr = new Object[2] ;
		
		//UserMastVO  user= userDao.getFindIdxUserInfo(user_idx);
		List<UserMastVO> list = userDao.getFindIdxUserHistory(user_idx);
	
		//resultArr[0] = user;
		resultArr[1] = list;
		
		return resultArr;
		
	}

	@Override
	public int insertUserMast(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.insertUserMast(userMast);
	}

	@Override
	public int getUserMastMaxIdx() throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getUserMastMaxIdx();
	}

	@Override
	public int userUpdate(UserMastVO userMast) throws Throwable {		
		// TODO Auto-generated method stub
		return userDao.userUpdate(userMast);
	}

	@Override
	public int getUserHistoryMaxIdx() throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getUserHistoryMaxIdx();
	}

	@Override
	public int deleteInsertUser(String idxs) throws Throwable {
		// TODO Auto-generated method stub
		int result=0, result1=0, result2 =0;
		UserMastVO user = new UserMastVO();
		
		TransactionStatus status = tx.getTransaction(new DefaultTransactionDefinition());
		String [] arr = idxs.split(",");
		try {
			
			user.setUpdate_gubun("D");
			for(String value : arr) {
				user.setUser_idx(value);
				result1 +=userDao.deleteUser(user.getUser_idx());
				result2 +=userDao.insertUserHistory(user);
			}
			result = result1;
			
			tx.commit(status);
		
		}catch(Exception e) {
			tx.rollback(status);
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int getCheckUserNoCnt(UserMastVO userMast) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getCheckUserNoCnt(userMast);
	}

	@Override
	public int getCheckLoginIdCnt(UserMastVO user) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getCheckLoginIdCnt(user);
	}

	@Override
	public String getCheckUserNo(String user_no) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getCheckUserNo(user_no);
	}

	@Override
	public String getCheckLoginId(String login_id) throws Throwable {
		// TODO Auto-generated method stub
		return userDao.getCheckLoginId(login_id);
	}
    

}
