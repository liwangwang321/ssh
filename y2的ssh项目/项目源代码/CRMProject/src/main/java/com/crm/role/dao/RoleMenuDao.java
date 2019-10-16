package com.crm.role.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.util.JsonUtils;

public class RoleMenuDao extends JsonBaseDao {
	
	
	//获取多种角色的菜单集合
	public List<Map<String, Object>> getRoleMenulist(String roleid,String menuid) throws InstantiationException, IllegalAccessException, SQLException{
		
		
		
		String sql = "select * from sys_role_menu where role_id = '"+roleid+"' and menu_id = '"+menuid+"'  ";
	
		
		return super.executeQuery(sql, null);
	}
	
	//判断每个角色的权限是什么
	public boolean getState(String roleid,String menuid) {
		String[] roles = roleid.split(",");
		
		boolean f = false;
		for (String s : roles) {
			try {
				List<Map<String, Object>> roleMenulist = this.getRoleMenulist(s, menuid);
				for (Map<String, Object> map : roleMenulist) {
					if(Integer.parseInt(map.get("rolemenu_state")+"") ==1) {
						f = true;
					}
				}
				
			} catch (InstantiationException | IllegalAccessException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return f;
	}
	
	
//	public static void main(String[] args) {
//		
//		RoleMenuDao rd = new RoleMenuDao();
//		System.out.println(rd.getState("r001,r002", "001"));
//	}
	
	/**
	 * 增加方法
	 * 
	 * 根据角色进行增加
	 * @return
	 */
	public int addRoleMenu(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		
		String role_id = JsonUtils.getParamVal(mapMap, "role_id");
		MenuDao md = new MenuDao();
		List<Map<String, Object>> menuList = null;
		try {
			menuList = md.menuList(mapMap, null);
		} catch (InstantiationException e) {
			e.printStackTrace();
		}
		
		String sql = "insert into sys_role_menu(role_id,menu_id,rolemenu_state) " ;
		int a = 0;
		for (Map<String, Object> map : menuList) {
			a++;
			if(menuList.size()==a) {
				sql += " select  '"+role_id+"','"+map.get("menu_id")+"',0 from dual  ";
			}else {
				if("000".equals(map.get("menu_id")+"")) {
					sql += " select  '"+role_id+"','"+map.get("menu_id")+"',1 from dual union ";
				}else {
					sql += " select  '"+role_id+"','"+map.get("menu_id")+"',0 from dual union ";
				}
			}
		}
				

		
		return super.executeUpdate(sql, new String [] {}, null);
	}
	public int addRoleMenuDan(String role_id,String menu_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		
		
		String sql = "insert into sys_role_menu(role_id,menu_id,rolemenu_state) values('"+role_id+"','"+menu_id+"',0) " ;
		
		return super.executeUpdate(sql, new String [] {}, null);
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
	public int delRoleMenu(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "delete from sys_role_menu where role_id = ?";
		
		return super.executeUpdate(sql, new String [] {"role_id"}, mapMap);
	}
	public int delRoleMenuDan(String role_id,String menu_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "delete from sys_role_menu where role_id = '"+role_id+"' and menu_id = '"+menu_id+"' ";
		
		return super.executeUpdate(sql, new String [] {}, null);
	}
	
	/**
	 * ztree的获取相对应的menu表
	 * @param roleid
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> ztreeGetList(String roleid) throws InstantiationException, IllegalAccessException, SQLException{
			
			String sql = "select a.rolemenu_state , b.menu_id ,b.menu_pid,b.menu_name  from sys_role_menu a,sys_menu b where a.role_id = '"+roleid+"' and a.menu_id= b.menu_id";
			
			return super.executeQuery(sql, null);
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
	public int editRoleMenuState(String role_id ,String menu_id) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
			
			
			String sql = "update sys_role_menu set rolemenu_state = 1 where role_id = '"+role_id+"' and menu_id  in ("+menu_id+") ";
			
			return super.executeUpdate(sql, new String [] {}, null);
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
	public int editRoleMenuState2(String role_id ,String menu_id) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
			
			
			String sql = "update sys_role_menu set rolemenu_state = 0 where role_id = '"+role_id+"' and menu_id not in ("+menu_id+") ";
			
			return super.executeUpdate(sql, new String [] {}, null);
		}
	
	

}
