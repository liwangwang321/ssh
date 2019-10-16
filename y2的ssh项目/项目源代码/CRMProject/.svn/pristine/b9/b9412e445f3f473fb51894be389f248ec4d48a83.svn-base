package com.crm.data.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.base.entity.PageBean;
import com.crm.base.util.ResponseUtil;
import com.crm.base.web.BaseAction;
import com.crm.data.biz.DataBiz;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class DictAction extends BaseAction {
	
	private DataBiz dataBiz;

	public DataBiz getDataBiz() {
		return dataBiz;
	}

	public void setDataBiz(DataBiz dataBiz) {
		this.dataBiz = dataBiz;
	}
	
	public String list() throws JsonProcessingException, Exception {
		PageBean pageBean = new PageBean();
		pageBean.setRequest(request);
		try {
			List<Map<String, Object>> list2 = dataBiz.list(request.getParameterMap(), pageBean);
			Map<String, Object> ma = new HashMap<>();
			ma.put("code", 0);
			ma.put("msg", null);
			ma.put("count", pageBean.getTotal());
			ma.put("data", list2);
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(ma));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int add() throws JsonProcessingException, Exception {
		int add = dataBiz.add(request.getParameterMap());
		ObjectMapper om=new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(add));
		return add;
	}
	
	
	public int del() throws JsonProcessingException, Exception {
		int del = dataBiz.del(request.getParameterMap());
		ObjectMapper om=new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(del));
		return del;
	}
	
	
	public int edit() throws JsonProcessingException, Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("html/text;charset=utf-8");
		int edit = dataBiz.edit(request.getParameterMap());
		ObjectMapper om=new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(edit));
		return edit;
	}
}
