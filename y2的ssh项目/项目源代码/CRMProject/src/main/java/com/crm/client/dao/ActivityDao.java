package com.crm.client.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class ActivityDao extends JsonBaseDao {
	
	public List<Map<String,Object>> list(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_activity where true ";
//		String dict_type_name = JsonUtils.getParamVal(pamap, "dict_type_name");
		return super.executeQuery(sql, pageBean);
	}
	
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String d = new Date().toLocaleString();
		String sql="insert into cst_activity(cust_no,atv_cust_name,atv_date,atv_place,atv_title,atv_remark,atv_desc) values(?,?,str_to_date('"+d+"','%Y-%c-%e %H:%i:%S'),?,?,?,?)";
		return super.executeUpdate(sql, new String[] {"cust_no","atv_cust_name","atv_place","atv_title","atv_remark","atv_desc"}, paMap);
	}
	
	//	  根据ID	删除方法
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="delete from cst_activity where atv_id=?";
		return super.executeUpdate(sql, new String[] {"atv_id"}, paMap);
	}
	
	
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="update cst_activity set cust_no=?,atv_cust_name=?,atv_place=?,atv_title=?,atv_remark=?,atv_desc=? where atv_id=?";
		return super.executeUpdate(sql, new String[] {"cust_no","atv_cust_name","atv_place","atv_title","atv_remark","atv_desc","atv_id"}, paMap);
	}

}
