package com.crm.role.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class UserDao extends JsonBaseDao {
	
	
	
	
	//登录时用到的查询所有方法
	public List<Map<String, Object>> getUser(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from sys_user where  true ";
		String name = JsonUtils.getParamVal(mapMap, "user_name");
		String pwd = JsonUtils.getParamVal(mapMap, "user_password");
		if(StringUtils.isNotBlank(name)) {
			sql+=" and user_name = '"+name+"'";
		}
		if(StringUtils.isNotBlank(pwd)) {
			sql+=" and user_password = '"+pwd+"'";
		}
		return super.executeQuery(sql, pageBean);
	}
	
	
	//查询所有用户的信息
	public List<Map<String,Object>> userList(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = " select * from sys_user where true ";
		String name = JsonUtils.getParamVal(mapMap, "user_name");
		String flag = JsonUtils.getParamVal(mapMap, "user_flag");
		String roleid = JsonUtils.getParamVal(mapMap, "role_id");
		if(StringUtils.isNotBlank(name)) {
			sql+=" and user_name like '%"+name+"%' ";
		}
		if(StringUtils.isNotBlank(flag) && !"-1".equals(flag)) {
			sql+=" and user_flag = '"+flag+"'";
		}
		if(StringUtils.isNotBlank(roleid)&& !"-1".equals(roleid)) {
			sql+=" and user_id in ( select user_id from  sys_user_role where role_id = '"+roleid+"' )";
		}
		
		return super.executeQuery(sql, pageBean);
	}
	
	
//	//根据角色id获取用户id
//	public List<Map<String,Object>> getUserid(String roleid) throws InstantiationException, IllegalAccessException, SQLException{
//		String sql = "select user_id from sys_user_role where role_id = '"+roleid+"' ";
//		
//		return super.executeQuery(sql, null);
//	}
//	
//	//操作成上面查询可以使用的字符串格式
//	public String setT(String roleid) throws InstantiationException, IllegalAccessException, SQLException {
//		List<Map<String, Object>> users = this.getUserid(roleid);
//		StringBuilder sb = new StringBuilder();
//		for (Map<String, Object> map : users) {
//			sb.append(","+map.get("user_id"));
//		}
//		return sb.substring(1).toString();
//	}
	
	
//	public static void main(String[] args) {
//		
//		UserDao ud = new UserDao();
//		
//		try {
//			System.out.println(ud.setT("r002"));
//			
//			
//		} catch (InstantiationException e) {
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		};
//		
//	}
	
	//把得到的用户列表进行一个转换。
	public List<Map<String, Object>> zhuan(List<Map<String, Object>> maplist) throws InstantiationException, IllegalAccessException, SQLException {
		UserRoleDao urd = new UserRoleDao();
		RoleDao rd = new RoleDao();
		List<Map<String, Object>> u;
		StringBuilder sb;
		for (Map<String, Object> map : maplist) {
			sb = new StringBuilder();
			u = urd.getUserRole(map.get("user_id")+"", null);
			
			for (Map<String, Object> map2 : u) {
				
				HashMap<String, String[]> hashMap = new HashMap<>();
				hashMap.put("role_id", new String [] {map2.get("role_id")+""});
				List<Map<String, Object>> role_name = rd.getRole(hashMap, null);
				
				
				sb.append(","+role_name.get(0).get("role_name"));
			}
			map.put("role_name", sb.substring(1));
			
		}
		
		
		return maplist;
	}
	
	

	/**
	 * 增加方法
	 * 
	 * 在增加用户表的同时，把用户角色表也加上
	 * @return
	 */
	public int addUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "insert into sys_user(user_name,user_password,user_flag) values(?,?,1) ";
		
		return super.executeUpdate(sql, new String [] {"user_name","user_password"}, mapMap);
	}
	
	
	/**
	 * 修改
	 * 
	 * 在修改用户表的同时，把用户角色表也修改
	 * @return
	 */
	public int editUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "update sys_user set user_name = ? ,user_password = ? where user_id = ?  ";
		
		return super.executeUpdate(sql, new String [] {"user_name","user_password","user_id"}, mapMap);
	}
	
	/**
	 * 删除
	 * 
	 * 在修改用户表的同时，把用户角色表也修改
	 * @return
	 */
	public int delUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "delete from sys_user where user_id = ?  ";
		
		return super.executeUpdate(sql, new String [] {"user_id"}, mapMap);
	}
	
	/**
	 * 修改用户状态
	 * 
	 * @return
	 */
	public int editUserState(String user_id,String state) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "update sys_user set user_flag = "+state+" where user_id = "+user_id+"  ";
		
		return super.executeUpdate(sql, new String [] {}, null);
	}
	
	
	
	 
	

}
