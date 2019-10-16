package com.crm.role.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface RoleMenuBiz {
	
	//获取多种角色的菜单集合
	public List<Map<String, Object>> getRoleMenulist(String roleid,String menuid) throws InstantiationException, IllegalAccessException, SQLException;
	
	
	//判断每个角色的权限是什么
	public boolean getState(String roleid,String menuid);
	
	/**
	 * 增加方法
	 * 
	 * 根据角色进行增加
	 * @return
	 */
	public int addRoleMenu(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	
	
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
	public int delRoleMenu(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	
	
	/**
	 * ztree的获取相对应的menu表
	 * @param roleid
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> ztreeGetList(String roleid) throws InstantiationException, IllegalAccessException, SQLException;
	
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
	public int editRoleMenuState(String roleid ,String menu_id) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
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
	public int editRoleMenuState2(String role_id ,String menu_id) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
}
