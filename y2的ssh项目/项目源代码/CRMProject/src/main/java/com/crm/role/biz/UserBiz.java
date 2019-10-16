package com.crm.role.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;

public interface UserBiz {
	public List<Map<String, Object>> getUser(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	
	//查询所有用户的信息
	public List<Map<String,Object>> userList(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	
	
//	//根据角色id获取用户id
//	public List<Map<String,Object>> getUserid(String roleid) throws InstantiationException, IllegalAccessException, SQLException;
//	
//	//操作成上面查询可以使用的字符串格式
//	public String setT(String roleid) throws InstantiationException, IllegalAccessException, SQLException;
	
	//把得到的用户列表进行一个转换。
	public List<Map<String, Object>> zhuan(List<Map<String, Object>> maplist) throws InstantiationException, IllegalAccessException, SQLException;
	
	//增加
	public int addUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	
	
	/**
	 * 修改
	 * 
	 * 在修改用户表的同时，把用户角色表也修改
	 * @return
	 */
	public int editUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	
	/**
	 * 删除
	 * 
	 * 在修改用户表的同时，把用户角色表也修改
	 * @return
	 */
	public int delUser(Map<String, String[]> mapMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	
	
	/**
	 * 修改用户状态
	 * 
	 * @return
	 */
	public int editUserState(String user_id,String state) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException;
	
}
