package com.isnetis.device.dao;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.isnetis.device.domain.ClientGroupVO;

@Repository
public class ClientGroupDaoImp extends SqlSessionDaoSupport implements ClientGroupDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<ClientGroupVO> getClientGroupList(int clientgrp_pidx) {
		return getSqlSession().selectList("getClientGroupList", clientgrp_pidx);
	}

	@Override
	public void insertClientGroup(ClientGroupVO vo) {
		getSqlSession().insert("insertClientGroup", vo);
	}

	@Override
	public void increaseRefCount(int clientgrp_idx) {
		getSqlSession().update("increaseRefCount", clientgrp_idx);
	}

	@Override
	public void renameGroup(ClientGroupVO vo) {
		getSqlSession().update("renameGroup", vo);
	}

	@Override
	public void deleteGroup(int clientgrp_idx) {
		getSqlSession().update("deleteGroup", clientgrp_idx);
	}

	@Override
	public void decreaseRefCount(int clientgrp_idx) {
		getSqlSession().update("decreaseRefCount", clientgrp_idx);
	}
	
	@Override
	public ClientGroupVO getClientGroupInfo(int clientgrp_idx) {
		return (ClientGroupVO)getSqlSession().selectOne("getClientGroupInfo", clientgrp_idx);
	}
	@Override
	public ClientGroupVO getClientGrpName(int clientgrp_idx) {
		return (ClientGroupVO)getSqlSession().selectOne("getClientGrpName", clientgrp_idx);
	}

	@Override
	public int getclientGrpCnt(ClientGroupVO clientGrp) {
		// TODO Auto-generated method stub
		return (Integer)getSqlSession().selectOne("getClientGrpCnt", clientGrp);
	}

	@Override
	public ClientGroupVO getClientGroupByName(ClientGroupVO clientGrp) {
		// TODO Auto-generated method stub
		return (ClientGroupVO)getSqlSession().selectOne("getClientGroupByName", clientGrp);
	}
}
