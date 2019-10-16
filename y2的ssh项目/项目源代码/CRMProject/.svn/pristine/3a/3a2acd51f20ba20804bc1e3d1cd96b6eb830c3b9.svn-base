package com.crm.role.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.role.biz.RoleMenuBiz;
import com.crm.role.dao.RoleMenuDao;

public class RoleMenuBizImpl implements RoleMenuBiz {
	
	private RoleMenuDao roleMenuDao;

	public RoleMenuDao getRoleMenuDao() {
		return roleMenuDao;
	}

	public void setRoleMenuDao(RoleMenuDao roleMenuDao) {
		this.roleMenuDao = roleMenuDao;
	}

	@Override
	public List<Map<String, Object>> getRoleMenulist(String roleid, String menuid)
			throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleMenuDao.getRoleMenulist(roleid, menuid);
	}

	@Override
	public boolean getState(String roleid, String menuid) {
		// TODO Auto-generated method stub
		return roleMenuDao.getState(roleid, menuid);
	}
	/**
	 * 增加方法
	 * 
	 * 根据角色进行增加
	 * @return
	 */
	@Override
	public int addRoleMenu(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException,
			IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleMenuDao.addRoleMenu(mapMap);
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
	public int delRoleMenu(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleMenuDao.delRoleMenu(mapMap);
	}

	@Override
	public List<Map<String, Object>> ztreeGetList(String roleid)
			throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return roleMenuDao.ztreeGetList(roleid);
	}
	/**
	 * 修改所有相对应的roleMenuDao
	 * @param roleid
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	@Override
	public int editRoleMenuState(String roleid, String menu_id) throws InstantiationException, IllegalAccessException,
			SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException {
		// TODO Auto-generated method stub
		return roleMenuDao.editRoleMenuState(roleid, menu_id);
	}
	/**
	 * 修改所有相对应的roleMenuDao
	 * @param roleid
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	@Override
	public int editRoleMenuState2(String role_id, String menu_id) throws InstantiationException, IllegalAccessException,
			SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException {
		// TODO Auto-generated method stub
		return roleMenuDao.editRoleMenuState2(role_id, menu_id);
	}
	
	

}
