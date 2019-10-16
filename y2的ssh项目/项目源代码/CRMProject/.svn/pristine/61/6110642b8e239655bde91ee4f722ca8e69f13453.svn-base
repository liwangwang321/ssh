package com.crm.role.biz.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.base.entity.TreeNode;
import com.crm.role.biz.MenuBiz;
import com.crm.role.dao.MenuDao;

public class MenuBizImpl implements MenuBiz {
	private MenuDao menuDao ;
	

	public MenuDao getMenuDao() {
		return menuDao;
	}



	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}



	@Override
	public List<TreeNode> list(Map<String, String[]> map, PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return menuDao.list(map, pageBean);
	}


	/**
	 * 查询所有菜单
	 * @param map
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	@Override
	public List<Map<String, Object>> menuList(Map<String, String[]> map, PageBean pageBean)
			throws InstantiationException, IllegalAccessException, SQLException {
		// TODO Auto-generated method stub
		return menuDao.menuList(map, pageBean);
	}


	/**
	 * 增加方法，增加到菜单表，menu
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	@Override
	public int addMenu(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException,
			NoSuchFieldException, SecurityException, IllegalArgumentException {
		// TODO Auto-generated method stub
		return menuDao.addMenu(map);
	}


	/**
	 * 删除方法，根据menu_id删除相对应节点id
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	@Override
	public int delMenuId(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException,
			NoSuchFieldException, SecurityException, IllegalArgumentException {
		// TODO Auto-generated method stub
		return menuDao.delMenuId(map);
	}


	/**
	 * 删除方法，根据menu_pid删除相对应节点父id
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	@Override
	public int delMenuPid(Map<String, String[]> map) throws InstantiationException, IllegalAccessException,
			SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException {
		// TODO Auto-generated method stub
		return menuDao.delMenuPid(map);
	}



	@Override
	public int editMenu(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException,
			NoSuchFieldException, SecurityException, IllegalArgumentException {
		// TODO Auto-generated method stub
		return menuDao.editMenu(map);
	}
	

}
