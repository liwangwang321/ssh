package com.crm.marketing.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.base.util.ResponseUtil;
import com.crm.base.web.BaseAction;
import com.crm.marketing.biz.StatBiz;
import com.fasterxml.jackson.databind.ObjectMapper;

public class StatAction extends BaseAction{
	
	private StatBiz staBiz;

	public StatBiz getStaBiz() {
		return staBiz;
	}

	public void setStaBiz(StatBiz staBiz) {
		this.staBiz = staBiz;
	}
	
	/**
	 * 客户服务
	 * @return
	 */
	public String serviceList() {
		try {
			List<Map<String, Object>> list = this.staBiz.serviceList(request.getParameterMap(), null);
			for (Map<String, Object> map : list) {
				map.put("name", map.get("dict_item"));
			}
			ObjectMapper om = new ObjectMapper();
			
			Map map = new HashMap();
	        List names = new ArrayList();
	        list.forEach(m -> {
	        	names.add(m.get("name"));
	        });
	        map.put("name", names);
	        map.put("data", list);

			
			ResponseUtil.write(response, om.writeValueAsString(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 客户构成
	 * @return
	 */
	public String formList() {
		try {
			List<Map<String, Object>> list = this.staBiz.formList(request.getParameterMap(), null);
			for (Map<String, Object> map : list) {
				map.put("name", map.get("dict_item"));
			}
			ObjectMapper om = new ObjectMapper();
			
			Map map = new HashMap();
	        List names = new ArrayList();
	        list.forEach(m -> {
	        	names.add(m.get("name"));
	        });
	        map.put("name", names);
	        map.put("data", list);

			
			ResponseUtil.write(response, om.writeValueAsString(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 客户流失
	 * @return
	 */
	public String lapsedList() {
		try {
			PageBean p = new PageBean();
			p.setRequest(request);
			List<Map<String, Object>> list = this.staBiz.lapsedList(request.getParameterMap(), p);
			
			ObjectMapper om = new ObjectMapper();
			Map<String, Object> map = new HashMap<>();
			map.put("code", 0);
			map.put("msg", null);
			map.put("count", p.getTotal());
			map.put("data", list);
			ResponseUtil.write(response, om.writeValueAsString(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
public String contributeList() {
	try {
//		 List alist = new ArrayList();  
//		 List blist = new ArrayList();
		List<Map<String, Object>> list = this.staBiz.contributeList(request.getParameterMap(), null);
		Map<String, String[]> paMap = request.getParameterMap();
		
//		for (Map<String, Object> map : list) {
//			String sums = map.get("sum").toString();
//			blist.add(sums);
//			String names = map.get("name").toString();
//			alist.add(names);
//		}
		
//		List<List> merge = new ArrayList();
//		 merge.add(alist);  
//		 merge.add(blist);
		ObjectMapper om = new ObjectMapper();
		//将list集合转换成json串
//		String jsonStr = om.writeValueAsString(merge);
		String jsonStr = om.writeValueAsString(list);
		
		ResponseUtil.write(response, jsonStr);
	}  catch (Exception e) {
		e.printStackTrace();
	}

		return null;
	}

}
