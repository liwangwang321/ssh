package com.crm.marketing.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class StatDao extends JsonBaseDao{
	
	/**
	 * 分别统计服务类型有多少条
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String,Object>> serviceList(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select a.dict_item as name ,(select count(*) from cst_service where  svr_type = a.dict_value   ) as value from bas_dict a where a.dict_type = 7";
		return super.executeQuery(sql, pageBean);
	}
	
	
	/**
	 * 客户构成等级
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String,Object>> formList(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select  a.dict_item  as name, (select count(*) from cst_customer where cust_level = a.dict_value )  as value from bas_dict  a where a.dict_type = 3";
		return super.executeQuery(sql, pageBean);
	}
	
	/**
	 * 确认客户流失
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> lapsedList(Map<String, String[]> paMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql="select * from cst_lost where true";
		
		String cname=JsonUtils.getParamVal(paMap, "lst_cust_name");
		String cmanager=JsonUtils.getParamVal(paMap, "lst_cust_manager_name");
		if(StringUtils.isNotBlank(cname)) {
			sql=sql+" and lst_cust_name like '%"+cname+"%'";
		}
		if(StringUtils.isNotBlank(cmanager)) {
			sql=sql+" and lst_cust_manager_name like '%"+cmanager+"%'";
		}
		return super.executeQuery(sql, pageBean);
	}
	
	/**
	 * 客户贡献
	 * @param paMap
	 * @param pb
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> contributeList(Map<String, String[]> paMap,PageBean pb) throws InstantiationException, IllegalAccessException, SQLException{
		
		String lieming = JsonUtils.getParamVal(paMap, "lieming");
		
		String name = JsonUtils.getParamVal(paMap, "name");
		
		String sql="select "+lieming+" AS name ,sum(odr_price) as sum from orders where odr_customer like '%"+name+"%' group by odr_customer";
		
		return super.executeQuery(sql, pb);
	}
	
	
	
	

}
