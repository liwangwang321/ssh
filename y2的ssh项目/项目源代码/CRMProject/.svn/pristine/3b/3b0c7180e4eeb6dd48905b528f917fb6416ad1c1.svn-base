package com.crm.data.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.data.biz.DataBiz;
import com.crm.data.dao.ProductDao;

public class ProductBizImpl implements DataBiz {
	
	private ProductDao ProductDao;
	
	public ProductDao getProductDao() {
		return ProductDao;
	}

	public void setProductDao(ProductDao productDao) {
		ProductDao = productDao;
	}

	@Override
	public List<Map<String, Object>> list(Map<String, String[]> pamap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		return this.ProductDao.list(pamap, pageBean);
	}



	@Override
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.ProductDao.add(paMap);
	}



	@Override
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.ProductDao.del(paMap);
	}



	@Override
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return this.ProductDao.edit(paMap);
	}

}
