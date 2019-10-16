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

public class SelectAction extends BaseAction {
	
	private DataBiz dataBiz;

	public DataBiz getDataBiz() {
		return dataBiz;
	}

	public void setDataBiz(DataBiz dataBiz) {
		this.dataBiz = dataBiz;
	}
	
	public String list() throws JsonProcessingException, Exception {
		try {
			List<Map<String, Object>> list2 = dataBiz.list(request.getParameterMap(), null);
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(list2));
			
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
