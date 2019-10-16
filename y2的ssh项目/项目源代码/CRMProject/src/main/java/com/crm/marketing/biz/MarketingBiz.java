package com.crm.marketing.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;

public interface MarketingBiz {
	public List<Map<String,Object>> list(Map<String, String> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException ;
	public int addMark(Map<String, String[]> pamap)throws InstantiationException, IllegalAccessException, SQLException , NoSuchFieldException, SecurityException, IllegalArgumentException;
	public int exitAssign(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException;
	public int delMark(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException , NoSuchFieldException, SecurityException, IllegalArgumentException;
	public List<Map<String,Object>> selectClient(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;//返回客户经理

	public  List<Map<String,Object>> zhuan( List<Map<String,Object>> mapMap ,Map<String, Object> user);
}
