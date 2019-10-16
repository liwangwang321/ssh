package com.crm.role.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface UserRoleBiz {
	//获取用户的角色
		public List<Map<String, Object>> getUserRole(String userid ,String roleid) throws InstantiationException, IllegalAccessException, SQLException;
		
		
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
		public int addUser(String user_id,String role_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
		
		/**
		 * 删除
		 */
		public int delUser(String user_id) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
		
		
}
