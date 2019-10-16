package com.crm.role.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.role.biz.UserBiz;
import com.crm.role.dao.UserDao;

public class UserBizImpl implements UserBiz {
	
	private UserDao userDao ;
	
	

	public UserDao getUserDao() {
		return userDao;
	}



	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}



	@Override
	public List<Map<String, Object>> getUser(Map<String, String[]> mapMap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userDao.getUser(mapMap, pageBean);
	}



	@Override
	public List<Map<String, Object>> userList(Map<String, String[]> mapMap, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userDao.userList(mapMap, pageBean);
	}


//
//	@Override
//	public List<Map<String, Object>> getUserid(String roleid)
//			throws InstantiationException, IllegalAccessException, SQLException {
//		// TODO Auto-generated method stub
//		return userDao.getUserid(roleid);
//	}
//
//
//
//	@Override
//	public String setT(String roleid) throws InstantiationException, IllegalAccessException, SQLException {
//		// TODO Auto-generated method stub
//		return userDao.setT(roleid);
//	}



	@Override
	public List<Map<String, Object>> zhuan(List<Map<String, Object>> maplist) throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userDao.zhuan(maplist);
	}



	@Override
	public int addUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userDao.addUser(mapMap);
	}


	/**
	 * 修改
	 * 
	 * 在修改用户表的同时，把用户角色表也修改
	 * @return
	 */
	@Override
	public int editUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userDao.editUser(mapMap);
	}


	/**
	 * 删除
	 * 
	 * 在修改用户表的同时，把用户角色表也修改
	 * @return
	 */
	@Override
	public int delUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userDao.delUser(mapMap);
	}


	/**
	 * 修改用户状态
	 * 
	 * @return
	 */
	@Override
	public int editUserState(String user_id, String state) throws NoSuchFieldException, SecurityException,
			IllegalArgumentException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return userDao.editUserState(user_id, state);
	}



//	@Override
//	public List<Map<String, Object>> getUserid(String roleid)
//			throws InstantiationException, IllegalAccessException, SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//
//	@Override
//	public String setT(String roleid) throws InstantiationException, IllegalAccessException, SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
