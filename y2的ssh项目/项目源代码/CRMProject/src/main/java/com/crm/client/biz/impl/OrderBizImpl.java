package com.crm.client.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.client.biz.ClientBiz;
import com.crm.client.dao.ClientDao;
import com.crm.client.dao.LostDao;
import com.crm.client.dao.OrderDao;

public class OrderBizImpl implements ClientBiz{
	
	private OrderDao orderDao;
	
	

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.orderDao.list(pamap, pageBean);
	}
	
	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.orderDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.orderDao.del(paMap);
	}


	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.orderDao.edit(paMap);
	}

}
