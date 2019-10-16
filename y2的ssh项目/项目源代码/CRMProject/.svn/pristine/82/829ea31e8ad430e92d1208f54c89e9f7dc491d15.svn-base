package com.crm.data.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class StorageDao extends JsonBaseDao{
	
	//查询
	public List<Map<String,Object>> list(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select a.prod_name,a.prod_type,b.* from product a ,storage b where a.prod_id = b.prod_id ";
		
		String prod_name = JsonUtils.getParamVal(pamap, "prod_name");
		String stk_id = JsonUtils.getParamVal(pamap, "stk_id");
		String stk_warehouse = JsonUtils.getParamVal(pamap, "stk_warehouse");
		
			if(StringUtils.isNotBlank(prod_name)) {
				sql += " and a.prod_name like '%"+prod_name+"%' or a.prod_type like '%"+prod_name+"%'";
			}
			if(StringUtils.isNotBlank(stk_id)) {
				sql += " and b.stk_id = "+stk_id;
			}
			if(StringUtils.isNotBlank(stk_warehouse)) {
				sql += " and stk_warehouse like '%"+stk_warehouse+"%'";
			}
		return super.executeQuery(sql, pageBean);
	}
	
	//增加
	public int add(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="insert into bas_dict(dict_type_name,dict_item,dict_value,dict_is_editable,dict_type) values(?,?,?,?,?)";
		return super.executeUpdate(sql, new String[] {"dict_type_name","dict_item","dict_value","dict_is_editable","dict_type"}, paMap);
	}
	
	//	  根据ID	删除方法
	public int del(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="delete from bas_dict where dict_id=?";
		return super.executeUpdate(sql, new String[] {"dict_id"}, paMap);
	}
	
	//修改
	public int edit(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="update bas_dict set dict_type_name =?,dict_item=?,dict_value=?,dict_is_editable=?,dict_type=? where dict_id=?";
		return super.executeUpdate(sql, new String[] {"dict_type_name","dict_item","dict_value","dict_is_editable","dict_type","dict_id"}, paMap);
	}
}
