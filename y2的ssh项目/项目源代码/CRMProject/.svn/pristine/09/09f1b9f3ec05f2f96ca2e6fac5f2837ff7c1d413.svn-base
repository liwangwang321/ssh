package com.crm.role.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class RoleDao extends JsonBaseDao {
	

	/**
	 * 查询所有的角色
	 * @param mapMap jsp的参数
	 * @param pageBean 分页
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> getRole(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select role_id ,role_name,role_desc,role_flag ,(select count(*) from sys_user_role where role_id = a.role_id ) role_count ,(select count(*) from sys_user where user_id in (select user_id from sys_user_role where role_id = a.role_id  ) and user_flag = 1 ) role_th ,(select count(*) from sys_user where user_id in (select user_id from sys_user_role where role_id = a.role_id  ) and user_flag = 0 ) role_fh,(select count(*) from sys_role_menu where role_id = a.role_id and rolemenu_state = 1 ) role_new from sys_role a where true";
		String name = JsonUtils.getParamVal(mapMap, "role_name");
		String id = JsonUtils.getParamVal(mapMap, "role_id");
		String flag = JsonUtils.getParamVal(mapMap, "role_flag");
		if(StringUtils.isNotBlank(name)) {
			sql+=" and role_name like '%"+name+"%'";
		}
		if(StringUtils.isNotBlank(id)) {
			sql+=" and role_id = '"+id+"' ";
		}
		if(StringUtils.isNotBlank(flag)&& !"-1".equals(flag)) {
			sql+=" and role_flag = "+flag+" ";
		}
		return super.executeQuery(sql, pageBean);
	}
	
	public List<Map<String, Object>> list() throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from sys_role ";
		
		return super.executeQuery(sql, null);
	}
	
	
	/**
	 * 增加
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
	public int addRole(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "insert into sys_role(role_id,role_name,role_desc,role_flag) values(?,?,?,0) ";
		
		return super.executeUpdate(sql, new String [] {"role_id","role_name","role_desc"}, mapMap);
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
	public int delRole(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "delete from sys_role where role_id = ?";
		
		return super.executeUpdate(sql, new String [] {"role_id"}, mapMap);
	}
	/**
	 * 修改基本信息
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
	public int editRole(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "update sys_role set role_name = ?,role_desc = ? where role_id = ?";
		
		return super.executeUpdate(sql, new String [] {"role_name","role_desc","role_id"}, mapMap);
	}
	/**
	 * 修改基本信息
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
	public int editRoleState(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "update sys_role set role_flag = ? where role_id = ?";
		
		return super.executeUpdate(sql, new String [] {"state","role_id"}, mapMap);
	}
	
	
	

}
