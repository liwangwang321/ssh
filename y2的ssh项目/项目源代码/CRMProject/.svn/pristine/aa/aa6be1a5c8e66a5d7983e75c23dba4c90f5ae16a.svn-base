package com.crm.service.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.service.dao.ServiceDao;
import com.crm.service.biz.ServiceBiz;

public class ServiceBizImpl implements ServiceBiz{
	
	private ServiceDao serviceDao;
	
	
	
	public ServiceDao getServiceDao() {
		return serviceDao;
	}



	public void setServiceDao(ServiceDao serviceDao) {
		this.serviceDao = serviceDao;
	}
	@Override
	public List<Map<String, Object>> queryfp(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException{
		return serviceDao.queryfp(mapMap, pageBean, user_id);
	}
	@Override
	public List<Map<String, Object>> querygd(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException{
		return serviceDao.querygd(mapMap, pageBean, user_id);
	}
	@Override
	public List<Map<String,Object>> selectfp(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		return serviceDao.selectfp(pamap, pageBean);
	}
	@Override
	public List<Map<String, Object>> cxkh(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		return serviceDao.cxkh(mapMap, pageBean);
	}
	@Override
	public int editService(Map<String, String[]> pamap ) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException{
		return serviceDao.editService(pamap);
	}
	@Override
	public int addService(Map<String, String[]> pamap ) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException, InstantiationException{
		return serviceDao.addService(pamap);
	}
	@Override
	public int delService(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		return serviceDao.delService(pamap);
	}
	@Override
	public int editsvrStatus(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException{
		return serviceDao.editsvrStatus(pamap);
	}
	@Override
	public int editsvrStatus2(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException{
		return serviceDao.editsvrStatus2(pamap);
	}
	@Override
	public int editsvrStatus3(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException{
		return serviceDao.editsvrStatus3(pamap);
	}
	@Override
	public List<Map<String, Object>> query(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException{
		return serviceDao.query(mapMap, pageBean ,user_id);
	}



	@Override
	public List<Map<String, Object>> listZd(Map<String, String[]> paMap, PageBean pb) throws Exception {
		// TODO Auto-generated method stub
		return serviceDao.listZd(paMap, pb);
	}



	@Override
	public List<Map<String, Object>> listDict(String svr_type) throws Exception {
		// TODO Auto-generated method stub
		return serviceDao.listDict(svr_type);
	}



	@Override
	public List<Map<String, Object>> listFk(Map<String, String[]> paMap, PageBean pb) throws Exception {
		return serviceDao.listFk(paMap, pb);
	}



	@Override
	public int editsvrStatus4(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		return serviceDao.editsvrStatus4(pamap);
	}



	@Override
	public List<Map<String, Object>> queryfk(Map<String, String[]> mapMap, PageBean pageBean, String user_id)
			throws InstantiationException, IllegalAccessException, SQLException {
		return serviceDao.queryfk(mapMap, pageBean, user_id);
	}
}
