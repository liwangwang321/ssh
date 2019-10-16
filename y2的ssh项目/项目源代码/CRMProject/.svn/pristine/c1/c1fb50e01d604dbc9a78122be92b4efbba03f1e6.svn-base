package com.crm.client.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.client.biz.ClientBiz;
import com.crm.client.dao.ClientDao;
import com.crm.client.dao.LostDao;

public class LostBizImpl implements ClientBiz{
	
	private LostDao lostDao;
	
	
	public LostDao getLostDao() {
		return lostDao;
	}

	public void setLostDao(LostDao lostDao) {
		this.lostDao = lostDao;
	}

	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.lostDao.list(pamap, pageBean);
	}
	
	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.lostDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.lostDao.del(paMap);
	}


	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.lostDao.edit(paMap);
	}

}
