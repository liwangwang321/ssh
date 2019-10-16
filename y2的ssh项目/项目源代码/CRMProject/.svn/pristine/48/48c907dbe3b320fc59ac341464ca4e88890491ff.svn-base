package com.crm.book.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.book.biz.UserBiz;
import com.crm.book.dao.UserDao;

public class UserBizImpl  implements UserBiz {
	private UserDao userDao ;
	
	

	public UserDao getUserDao() {
		return userDao;
	}



	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}



	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException {
		return userDao.list(pamap, pageBean);
	}
	
	
	
	

}
