package com.crm.data.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.data.biz.DataBiz;
import com.crm.data.dao.ProductDao;
import com.crm.data.dao.StorageDao;

public class StorageBizImpl implements DataBiz {
	
	private StorageDao storageDao;
	
	

	public StorageDao getStorageDao() {
		return storageDao;
	}



	public void setStorageDao(StorageDao storageDao) {
		this.storageDao = storageDao;
	}



	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.storageDao.list(pamap, pageBean);
	}



	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.storageDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.storageDao.del(paMap);
	}



	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.storageDao.edit(paMap);
	}

}
