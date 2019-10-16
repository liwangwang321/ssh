package com.crm.client.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.base.util.ResponseUtil;
import com.crm.base.web.BaseAction;
import com.crm.book.biz.impl.UserBizImpl;
import com.crm.client.biz.ClientBiz;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class OrderAction extends BaseAction {
	private ClientBiz clientBiz ;
	

	public ClientBiz getClientBiz() {
		return clientBiz;
	}


	public void setClientBiz(ClientBiz clientBiz) {
		this.clientBiz = clientBiz;
	}



	public String list() {
		try {
			PageBean p = new PageBean();
			p.setRequest(request);
			List<Map<String, Object>> list2 = clientBiz.list(request.getParameterMap(), p);
			Map<String, Object> ma = new HashMap<>();
			ma.put("code", 0);
			ma.put("msg", null);
			ma.put("count", p.getTotal());
			ma.put("data", list2);
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(ma));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public int edit() throws JsonProcessingException, Exception {
		int edit = clientBiz.edit(request.getParameterMap());
		ObjectMapper om=new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(edit));
		return edit;
	}
	

}
