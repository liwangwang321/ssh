package com.crm.client.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class ClientDao extends JsonBaseDao {
	
	
	
	public List<Map<String,Object>> list(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_customer where true ";
		String cust_id = JsonUtils.getParamVal(pamap, "cust_id");
		String cust_name = JsonUtils.getParamVal(pamap, "cust_name");
		String cust_region = JsonUtils.getParamVal(pamap, "cust_region");
		String cust_no = JsonUtils.getParamVal(pamap, "cust_no");
		String method = JsonUtils.getParamVal(pamap, "method");
		if(StringUtils.isNotBlank(cust_id)) {
			sql += " and cust_no = '"+cust_id+"' ";
		}
		if(StringUtils.isNotBlank(cust_name)) {
			sql += " and cust_name like '%"+cust_name+"%' ";
		}
		if(StringUtils.isNotBlank(cust_region)) {
			sql += " and cust_region like '%"+cust_region+"%' ";
		}
		if(StringUtils.isNotBlank(cust_no)) {
			sql = "select b.* from cst_customer a,"+method+" b where a.cust_no=b.cust_no and b.cust_no='"+cust_no+"'";
		}
		
		return super.executeQuery(sql, pageBean);
	}
	
	
	
	
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		Random r = new Random();
		int n1 = r.nextInt(10);
		int n2 = r.nextInt(10);
		int n3 = r.nextInt(10);
		int n4 = r.nextInt(10);
		String id = "MK"+n1+n2+n3+n4;
		String sql = "insert into cst_customer(cust_no,cust_name,user_id,cust_manager_name,cust_tel) values('"+id+"',?,?,?,?)";
		return super.executeUpdate(sql, new String[] {"cust_name","user_id","cust_manager_name","cust_tel"}, paMap);
	}
	
	//	  根据ID	删除方法
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="delete from cst_customer where cust_no=?";
		return super.executeUpdate(sql, new String[] {"cust_no"}, paMap);
	}
	
	
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="update cst_customer set cust_name=?,cust_region=?,user_id=?,cust_manager_name=?,cust_level=?,cust_satisfy=?,cust_credit=?,cust_addr=?,cust_tel=?,cust_website=?,cust_bankroll=?,cust_status=? where cust_no=?";
		return super.executeUpdate(sql, new String[] {"cust_name","cust_region","user_id","cust_manager_name","cust_level","cust_satisfy","cust_credit","cust_addr","cust_tel","cust_website","cust_bankroll","cust_status","cust_no"}, paMap);
	}

}
