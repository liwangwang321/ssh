package com.crm.marketing.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.marketing.biz.MarketingBiz;
import com.crm.marketing.dao.MarketingDao;

public class MarketingBizImpl implements MarketingBiz {

	private MarketingDao markDao;
	
	
	public MarketingDao getMarkDao() {
		return markDao;
	}

	public void setMarkDao(MarketingDao markDao) {
		this.markDao = markDao;
	}

	@Override
	public List<Map<String, Object>> list(Map<String, String> pamap, PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException {
		return markDao.list(pamap, pageBean);
	}

	@Override
	public int addMark(Map<String, String[]> pamap) throws InstantiationException,
			IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException {
		return markDao.addMark(pamap);
	}


	@Override
	public int delMark(Map<String, String[]> pamap) throws InstantiationException,
			IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException {
		return markDao.delMark(pamap);
	}

	@Override
	public List<Map<String, Object>> selectClient(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return markDao.selectClient(pamap, pageBean);
	}

	@Override
	public int exitAssign(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException,
			SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException {
		return markDao.editMark(pamap);
	}

	@Override
	public List<Map<String, Object>> zhuan(List<Map<String, Object>> mapMap, Map<String, Object> user) {
		// TODO Auto-generated method stub
		return markDao.zhuan(mapMap, user);
	}

	

}
