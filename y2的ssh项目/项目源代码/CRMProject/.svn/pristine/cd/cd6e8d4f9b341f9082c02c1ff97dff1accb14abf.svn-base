package com.crm.data.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.data.biz.DataBiz;
import com.crm.data.dao.DataDao;

public class DataBizImpl implements DataBiz {
	
	private DataDao dataDao;
	

	public DataDao getDataDao() {
		return dataDao;
	}



	public void setDataDao(DataDao dataDao) {
		this.dataDao = dataDao;
	}



	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.dataDao.list(pamap, pageBean);
	}



	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.dataDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.dataDao.del(paMap);
	}



	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.dataDao.edit(paMap);
	}

}
