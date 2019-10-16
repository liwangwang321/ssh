package com.crm.role.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.role.biz.UserRoleBiz;
import com.crm.role.dao.UserRoleDao;

public class UserRoleBizImpl implements UserRoleBiz {
	
	private UserRoleDao userRoleDao;

	public UserRoleDao getUserRoleDao() {
		return userRoleDao;
	}

	public void setUserRoleDao(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}

	@Override
	public List<Map<String, Object>> getUserRole(String userid ,String roleid)
			throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userRoleDao.getUserRole(userid,roleid);
	}
	
	/**
	 * 增加用户角色表里的默认角色
	 * @param user_id
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	@Override
	public int addUser(String user_id,String role_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException,
			IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userRoleDao.addUser(user_id,role_id);
	}
	/**
	 * 删除
	 */
	@Override
	public int delUser(String user_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException,
			IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userRoleDao.delUser(user_id);
	}
	
	
	

}
