package com.spring.admin.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.admin.dao.AdminAdminDao;
import com.spring.admin.admin.vo.AdminAdminVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminAdminServiceImpl implements AdminAdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminAdminDao adminAdminDao;
	
	@Override
	public List<AdminAdminVO> adminList() {
		List<AdminAdminVO> list = null;
		list = adminAdminDao.adminList();
		return list;
	}

}
