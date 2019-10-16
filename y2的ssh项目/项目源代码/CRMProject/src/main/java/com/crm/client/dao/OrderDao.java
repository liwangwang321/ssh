package com.crm.client.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class OrderDao extends JsonBaseDao {
	
	public List<Map<String,Object>> list(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from orders where true ";
		String odr_id = JsonUtils.getParamVal(pamap, "odr_id");
		String odr_customer = JsonUtils.getParamVal(pamap, "odr_customer");
		String odr_addr = JsonUtils.getParamVal(pamap, "odr_addr");
		if(StringUtils.isNotBlank(odr_id)) {
			sql += " and odr_id = "+odr_id;
		}
		if(StringUtils.isNotBlank(odr_customer)) {
			sql += " and odr_customer like '%"+odr_customer+"%' ";
		}
		if(StringUtils.isNotBlank(odr_addr)) {
			sql += " and odr_addr like '%"+odr_addr+"%' ";
		}
		return super.executeQuery(sql, pageBean);
	}
	
	
	
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String odr_id = JsonUtils.getParamVal(paMap, "odr_id");
		String sql="update orders set odr_status=? where odr_id="+odr_id;
		return super.executeUpdate(sql, new String[] {"odr_status"}, paMap);
	}

	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="null";
		return super.executeUpdate(sql, new String[] {"odr_status","odr_id"}, paMap);
	}

	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="null";
		return super.executeUpdate(sql, new String[] {"odr_status","odr_id"}, paMap);
	}

}
