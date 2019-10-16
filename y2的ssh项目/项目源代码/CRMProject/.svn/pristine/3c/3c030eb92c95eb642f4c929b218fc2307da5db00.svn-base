package com.crm.role.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class UserRoleDao extends JsonBaseDao {
	
	//获取用户的角色
	public List<Map<String, Object>> getUserRole(String userid,String roleid) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from sys_user_role where true ";
		if(StringUtils.isNotBlank(userid)) {
			sql += " and user_id =  "+userid;
		}
		if(StringUtils.isNotBlank(roleid)) {
			sql += " and role_id = '"+roleid+"' ";
		}
		return super.executeQuery(sql, null);
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
	public int addUser(String user_id,String role_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "insert into sys_user_role(user_id,role_id) values("+user_id+",'"+role_id+"') ";
		
		return super.executeUpdate(sql, new String [] {}, null);
	}
	
	
	/**
	 * 删除
	 */
	public int delUser(String user_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "delete from sys_user_role where user_id = "+user_id+" ";
		
		return super.executeUpdate(sql, new String [] {}, null);
	}
	

}
