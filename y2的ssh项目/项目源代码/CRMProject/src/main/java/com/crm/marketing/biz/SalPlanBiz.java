package com.crm.marketing.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;

public interface SalPlanBiz {
	
	public List<Map<String,Object>> PlanList(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	
	public int addPlan(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
	
	public int editPlan(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
	
	public int delPlan(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException; 

	public int editState(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException ;
}
