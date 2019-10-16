package com.crm.role.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.role.biz.RoleBiz;
import com.crm.role.dao.RoleDao;

public class RoleBizImpl implements RoleBiz {
	
	private RoleDao roleDao;

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public List<Map<String, Object>> getRole(Map<String, String[]> mapMap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleDao.getRole(mapMap, pageBean);
	}
	/**
	 * 增加
	 * @param mapMap jsp的参数
	 * @param pageBean 分页
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	@Override
	public int addRole(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleDao.addRole(mapMap);
	}
	/**
	 * 删除
	 * @param mapMap jsp的参数
	 *
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	@Override
	public int delRole(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleDao.delRole(mapMap);
	}
	/**
	 * 修改基本信息
	 * @param mapMap jsp的参数
	 *
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	@Override
	public int editRole(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleDao.editRole(mapMap);
	}
	/**
	 * 修改基本信息
	 * @param mapMap jsp的参数
	 *
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	@Override
	public int editRoleState(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleDao.editRoleState(mapMap);
	}
	
	

}
