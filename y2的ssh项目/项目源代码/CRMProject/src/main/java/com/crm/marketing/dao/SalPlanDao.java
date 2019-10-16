package com.crm.marketing.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class SalPlanDao extends JsonBaseDao{
	
	/**
	 * 联表查
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String,Object>> PlanList(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from sal_plan where true ";
		String id = JsonUtils.getParamVal(pamap, "chc_id");
		if (StringUtils.isNotBlank(id)) {
			sql+=" and chc_id = "+id+" " ;//根据客户id搜索
		}
		return super.executeQuery(sql, pageBean);
	}
	
	/**
	 * 增加执行计划
	 * @param pamap
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	public int addPlan(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		String date = new Date().toLocaleString();
		String sql ="insert into sal_plan(chc_id,pla_date,pla_todo) values(?,str_to_date('"+date+"','%Y-%c-%e %H:%i:%S'),?)";
		return super.executeUpdate(sql, new String[] {"chc_id","pla_todo"}, pamap);
	}
	
	/**
	 * 修改
	 * @param paMap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editPlan(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
			String sql = "update sal_plan set pla_date=?,pla_result=? where chc_id=? and pla_id=?";
			return super.executeUpdate(sql, new String[] {"pla_date","pla_result","chc_id","pla_id"}, paMap);
	}
	
	/**
	 * 删除
	 * @param paMap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int delPlan(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "delete from sal_plan where pla_id=?";
		return super.executeUpdate(sql, new String[] {"pla_id"}, paMap);
	}
	
	/**
	 * 修改状态
	 */
	public int editState(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
//		int n = 0;//默认状态为未指派
//		if(paMap.get("chc_status")!=null && n ==1) {
//			n = 3;//开发成功
//		}
//		if(paMap.get("chc_status")!=null && n ==2) {
//			n = 4;//开发失败
//		}
		String sql = "update sal_chance set chc_status= ? where chc_id=?";
		return super.executeUpdate(sql, new String[] {"chc_status","chc_id"}, paMap);
	}
	

	


}
