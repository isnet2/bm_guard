package com.isnetis.common.service;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface TempService {

	void init_grp_temp();
}
