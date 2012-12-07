package com.isnetis.device.dao;

import java.util.List;

import com.isnetis.device.domain.ClientGroupVO;

public interface ClientGroupDao {
	List<ClientGroupVO> getClientGroupList(int clientgrp_pidx);
	void insertClientGroup(ClientGroupVO vo);
	void increaseRefCount(int clientgrp_idx);
	void renameGroup(ClientGroupVO vo);
	void deleteGroup(int clientgrp_idx);
	void decreaseRefCount(int clientgrp_idx);
	ClientGroupVO getClientGroupInfo(int clientgrp_idx);
	ClientGroupVO getClientGrpName(int clientgrp_idx);
	int getclientGrpCnt(ClientGroupVO clientGrp);
	ClientGroupVO getClientGroupByName(ClientGroupVO clientGrp);
}
