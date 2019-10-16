package com.crm.role.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.base.entity.TreeNode;

public interface MenuBiz {
	public List<TreeNode> list(Map<String, String[]> map,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException ;
	
	/**
	 * 查询所有菜单
	 * @param map
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> menuList(Map<String, String[]> map,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	
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
	public int addMenu(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
	
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
	public int delMenuId(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
	
	
	
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
	public int delMenuPid(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
	
	
	/**
	 * 修改方法，根据menu_id传值
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	public int editMenu(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
	
	
	
}
