package com.crm.marketing.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.base.util.ResponseUtil;
import com.crm.base.web.BaseAction;
import com.crm.client.biz.ClientBiz;
import com.crm.client.biz.impl.ClientBizImpl;
import com.crm.marketing.biz.SalPlanBiz;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SalPlanAction extends BaseAction{

	private SalPlanBiz planBiz;

	public SalPlanBiz getplanBiz() {
		return planBiz;
	}

	public void setplanBiz(SalPlanBiz planBiz) {
		this.planBiz = planBiz;
	}
	
	
	/**
	 * 查看所有
	 * @return
	 */
	public String PlanList() {
		try {
			PageBean p = new PageBean();
			p.setRequest(request);
			List<Map<String, Object>> list = this.planBiz.PlanList(request.getParameterMap(), p);
			
			Map<String, Object> map = new HashMap<>();
			map.put("code", 0);
			map.put("msg", null);
			map.put("count", p.getTotal());
			map.put("data", list);
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 增加
	 * @param req
	 * @param resp
	 * @return
	 */
	public String addPlan() {
		try {
			int add = this.planBiz.addPlan(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(add));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 修改
	 * @return
	 */
	public String editPlan() {
		try {
			int add = this.planBiz.editPlan(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(add));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delPlan() {
		try {
			int add = this.planBiz.delPlan(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(add));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 修改状态
	 * @return
	 */
	public String editState() {
		try {
			int add = this.planBiz.editState(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(add));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
}
