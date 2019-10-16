package com.crm.client.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.client.biz.ClientBiz;
import com.crm.client.dao.ClientDao;

public class ClientBizImpl implements ClientBiz{
	
	private ClientDao clientDao;
	
	
	
	public ClientDao getClientDao() {
		return clientDao;
	}



	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}



	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.clientDao.list(pamap, pageBean);
	}
	
	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.clientDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.clientDao.del(paMap);
	}


	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.clientDao.edit(paMap);
	}

}
