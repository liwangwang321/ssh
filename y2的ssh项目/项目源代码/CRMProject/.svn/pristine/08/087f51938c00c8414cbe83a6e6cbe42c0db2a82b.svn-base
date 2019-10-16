package com.crm.data.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.data.biz.DataBiz;
import com.crm.data.dao.DataDao;
import com.crm.data.dao.SelectDao;

public class SelectBizImpl implements DataBiz {
	
	private SelectDao selectDao;
	

	public SelectDao getSelectDao() {
		return selectDao;
	}



	public void setSelectDao(SelectDao selectDao) {
		this.selectDao = selectDao;
	}



	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.selectDao.list(pamap, pageBean);
	}



	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.selectDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.selectDao.del(paMap);
	}



	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.selectDao.edit(paMap);
	}

}
