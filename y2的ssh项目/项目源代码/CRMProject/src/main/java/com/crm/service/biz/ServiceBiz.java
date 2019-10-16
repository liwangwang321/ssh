package com.crm.service.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;

public interface ServiceBiz {
	public List<Map<String, Object>> querygd(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException;
	public List<Map<String, Object>> cxkh(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	public List<Map<String, Object>> queryfp(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException;
	public List<Map<String, Object>> listFk(Map<String, String[]> paMap,PageBean pb) throws Exception;
	public int editsvrStatus4(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException ;
	public List<Map<String, Object>> queryfk(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException;
	
	
	
	
	/**
	 * 查
	 */
	public List<Map<String, Object>> query(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException;
	/**
	 * 返回主管r005
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String,Object>> selectfp(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	/**
	 * 修改
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editService(Map<String, String[]> pamap ) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	/**
	 * 增加
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws InstantiationException
	 */
	public int addService(Map<String, String[]> pamap ) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException, InstantiationException;
	/**
	 * 删
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws InstantiationException 
	 */
	public int delService(Map<String, String[]> pamap ) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException, InstantiationException;
	/**
	 * 修改服务状态为2-->已分配
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editsvrStatus(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	/**
	 * 修改服务状态为3-->已处理
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editsvrStatus2(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	/**
	 * 修改服务状态为4-->已归档
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editsvrStatus3(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	
	
	
	public List<Map<String, Object>> listZd(Map<String, String[]> paMap,PageBean pb) throws Exception;
	
	/**
	 * 总的
	 * @param svr_type
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> listDict(String svr_type) throws Exception;
}

