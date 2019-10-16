package com.crm.marketing.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.marketing.biz.StatBiz;
import com.crm.marketing.dao.StatDao;

public class StatBizImpl implements StatBiz{
	
	private StatDao staDao;
	

	public StatDao getStaDao() {
		return staDao;
	}


	public void setStaDao(StatDao staDao) {
		this.staDao = staDao;
	}


	@Override
	public List<Map<String, Object>> serviceList(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return staDao.serviceList(pamap, pageBean);
	}


	@Override
	public List<Map<String, Object>> formList(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return staDao.formList(pamap, pageBean);
	}


	@Override
	public List<Map<String, Object>> lapsedList(Map<String, String[]> paMap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return staDao.lapsedList(paMap, pageBean);
	}


	@Override
	public List<Map<String, Object>> contributeList(Map<String, String[]> paMap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return staDao.contributeList(paMap, pageBean);
	}

}
