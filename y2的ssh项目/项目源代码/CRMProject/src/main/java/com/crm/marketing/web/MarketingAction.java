package com.crm.marketing.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.ResponseUtil;
import com.crm.base.web.BaseAction;
import com.crm.marketing.biz.MarketingBiz;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MarketingAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private MarketingBiz markBiz;
		
	public MarketingBiz getMarkBiz() {
		return markBiz;
	}

	public void setMarkBiz(MarketingBiz markBiz) {
		this.markBiz = markBiz;
	}

	
	
	
	/**
	 * 返回客户经理
	 * @param req
	 * @param resp
	 * @return
	 */
	public String selectClient() {
		try {
			List<Map<String, Object>> list = this.markBiz.selectClient(request.getParameterMap(), null);
			ObjectMapper om = new ObjectMapper();
			Map<String, Object> map = new HashMap<>();
			map.put("code", 0);
			map.put("count", null);
			map.put("data", list);
			ResponseUtil.write(response, om.writeValueAsString(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 查看
	 * @return
	 */
	public String list() {
		try {
			PageBean p = new PageBean();
			p.setRequest(request);
			
			Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
			Map<String, String[]> pamap = request.getParameterMap();
			Map<String, String> ma =  new HashMap<>();
			String name = JsonUtils.getParamVal(pamap, "chc_cust_name");
			String title = JsonUtils.getParamVal(pamap, "chc_title");
			String lname = JsonUtils.getParamVal(pamap, "chc_linkman");
			String jlname = JsonUtils.getParamVal(pamap, "chc_due_to");
			String type = JsonUtils.getParamVal(pamap, "type");
			ma.put("name", name );
			ma.put("title", title);
			ma.put("lname", lname);
			ma.put("jlname", jlname);
			ma.put("type", type);
			
			Object obj = user.get("role_id");//r001,r002
			String role_id = obj+"";
			String[] split = role_id.split(",");
			boolean f = false;
			for (String s : split) {
				if("r003".equals(s) ) {
					f = true;
				}
			}
			ma.put("role_id", f+"");
			
			
			ma.put("user_id", user.get("user_id")+"");
			
			
			List<Map<String, Object>> list = this.markBiz.list(ma, p);
			
			
			
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
	
	
	/**
	 * 增加
	 * @param req
	 * @param resp
	 * @return
	 */
	public String addMark() {
		try {
			int add = this.markBiz.addMark(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(add));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 修改
	 * @param req
	 * @param resp
	 * @return
	 */
	public String exitMark() {
		try {
			int exit = this.markBiz.exitAssign(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(exit));
//			if(sal.getChc_due_id()==0) {
//				sal.setChc_status(1);
//			}
//			else {
//				sal.setChc_status(0);
//			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除
	 * @param req
	 * @param resp
	 * @return
	 */
	public String delMark() {
		try {
			int del = this.markBiz.delMark(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(del));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

	
	
	
	
	
}
