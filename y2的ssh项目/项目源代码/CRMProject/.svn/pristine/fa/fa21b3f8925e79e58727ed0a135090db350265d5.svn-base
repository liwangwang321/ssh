package com.crm.client.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class LinkmanDao extends JsonBaseDao {
	
	public List<Map<String,Object>> list(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_linkman where true ";
		String cust_no = JsonUtils.getParamVal(pamap, "cust_no");
		if(StringUtils.isNotBlank(cust_no)) {
			sql = " and cust_no = '"+cust_no+"'";
		}
		return super.executeQuery(sql, pageBean);
	}

	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		System.out.println(JsonUtils.getParamVal(paMap, "lkm_sex")+","+JsonUtils.getParamVal(paMap, "lkm_cust_name"));
		String sql="insert into cst_linkman(cust_no,lkm_cust_name,lkm_name,lkm_sex,lkm_postion,lkm_tel,lkm_memo) values(?,?,?,?,?,?,?)";
		return super.executeUpdate(sql, new String[] {"cust_no","lkm_cust_name","lkm_name","lkm_sex","lkm_postion","lkm_tel","lkm_memo"}, paMap);
	}
	
	//	  根据ID	删除方法
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="delete from cst_linkman where lkm_id=?";
		return super.executeUpdate(sql, new String[] {"lkm_id"}, paMap);
	}
	
	
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="update cst_linkman set cust_no=?,lkm_cust_name=?,lkm_name=?,lkm_sex=?,lkm_postion=?,lkm_tel=?,lkm_memo=? where lkm_id=?";
		return super.executeUpdate(sql, new String[] {"cust_no","lkm_cust_name","lkm_name","lkm_sex","lkm_postion","lkm_tel","lkm_memo","lkm_id"}, paMap);
	}

}
