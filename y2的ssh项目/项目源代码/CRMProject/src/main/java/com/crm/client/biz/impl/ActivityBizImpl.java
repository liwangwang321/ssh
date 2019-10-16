package com.crm.client.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.client.biz.ClientBiz;
import com.crm.client.dao.ActivityDao;
import com.crm.client.dao.ClientDao;

public class ActivityBizImpl implements ClientBiz{
	
	private ActivityDao activityDao;
	
	public ActivityDao getActivityDao() {
		return activityDao;
	}

	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.activityDao.list(pamap, pageBean);
	}
	
	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.activityDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.activityDao.del(paMap);
	}


	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.activityDao.edit(paMap);
	}

}
