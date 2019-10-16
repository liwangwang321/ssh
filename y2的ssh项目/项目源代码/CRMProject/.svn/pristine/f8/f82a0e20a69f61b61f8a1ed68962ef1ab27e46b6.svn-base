package com.crm.client.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class LostDao extends JsonBaseDao {
	
	public List<Map<String,Object>> list(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_lost where true ";
		String lst_id = JsonUtils.getParamVal(pamap, "lst_id");
		String lst_cust_name = JsonUtils.getParamVal(pamap, "lst_cust_name");
		String lst_cust_manager_name = JsonUtils.getParamVal(pamap, "lst_cust_manager_name");
		if(StringUtils.isNotBlank(lst_id)) {
			sql += " and lst_id = "+lst_id;
		}
		if(StringUtils.isNotBlank(lst_cust_name)) {
			sql += " and lst_cust_name like '%"+lst_cust_name+"%' ";
		}
		if(StringUtils.isNotBlank(lst_cust_manager_name)) {
			sql += " and lst_cust_manager_name like '%"+lst_cust_manager_name+"%' ";
		}
		return super.executeQuery(sql, pageBean);
	}
	
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="insert into cst_lost(cust_no,lst_cust_name,user_id,lst_cust_manager_name,lst_last_order_date,lst_lost_date,lst_delay,lst_reason,lst_status) values(?,?,?,?,?,?,?,?,?)";
		return super.executeUpdate(sql, new String[] {"cust_no","lst_cust_name","user_id","lst_cust_manager_name","lst_last_order_date","lst_lost_date","lst_delay","lst_reason","lst_status"}, paMap);
	}
	
	//	  根据ID	删除方法
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="delete from cst_lost where lst_id=?";
		return super.executeUpdate(sql, new String[] {"lst_id"}, paMap);
	}
	
	
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String zj = JsonUtils.getParamVal(paMap, "zj");
		String lst_reason = JsonUtils.getParamVal(paMap, "lst_reason");
		int lst_id = Integer.parseInt(JsonUtils.getParamVal(paMap, "lst_id"));
		String sql = "";
		String d = new Date().toLocaleString();
		if(StringUtils.isNotBlank(zj)) {
			sql = "update cst_lost set lst_delay = CONCAT(lst_delay,'\n"+zj+"\n\t\t\t\t\t\t---"+d+"'),lst_status=2 where lst_id="+lst_id;
		}
		if(StringUtils.isNotBlank(lst_reason)) {
			sql = "update cst_lost set lst_reason ='"+lst_reason+"',lst_status=3,lst_lost_date=str_to_date('"+d+"','%Y-%c-%e %H:%i:%S') where lst_id="+lst_id;
		}
		return super.executeUpdate(sql, new String[] {}, paMap);
	}

}
