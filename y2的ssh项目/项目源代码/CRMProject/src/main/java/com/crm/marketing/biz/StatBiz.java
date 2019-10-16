package com.crm.marketing.biz;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;

public interface StatBiz {

	//服务
	public List<Map<String,Object>> serviceList(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	//构成
	public List<Map<String,Object>> formList(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	//流失
	public List<Map<String, Object>> lapsedList(Map<String, String[]> paMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;
	//贡献
	public List<Map<String, Object>> contributeList(Map<String, String[]> paMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException;

}
