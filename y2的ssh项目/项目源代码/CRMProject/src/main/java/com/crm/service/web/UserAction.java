package com.crm.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.ResponseUtil;
import com.crm.base.util.StringUtils;
import com.crm.base.web.BaseAction;
import com.crm.service.biz.ServiceBiz;
import com.fasterxml.jackson.databind.ObjectMapper;

public class UserAction extends BaseAction {
private ServiceBiz serviceBiz ;
	
	




	public ServiceBiz getServiceBiz() {
		return serviceBiz;
	}










	public void setServiceBiz(ServiceBiz serviceBiz) {
		this.serviceBiz = serviceBiz;
	}
	
	public String cxkh() {
		try {
			List<Map<String, Object>> listkh = serviceBiz.cxkh(request.getParameterMap(), null);
			
		
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(listkh));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public String querygd() {
		try {
			PageBean pageBean = new PageBean();
			pageBean.setRequest(request);
			pageBean.setRows(10);
			
			
			List<Map<String, Object>> query = serviceBiz.querygd(request.getParameterMap(), pageBean,null);
			for (Map<String, Object> map : query) {
				String type =  map.get("svr_type")+"";
				List<Map<String, Object>> listDict = serviceBiz.listDict(type);
				Object svr_type_name = null;
				if(listDict!=null&&listDict.size()>0) {
					Map<String, Object> map2 = listDict.get(0);
					svr_type_name = map2.get("dict_item");
					
					
				}
				
				map.put("svr_type_name", svr_type_name+"");
				
				
			}
			Map<String, Object> ma = new HashMap<>();
			ma.put("code", 0);
			ma.put("msg", null);
			ma.put("count", pageBean.getTotal());
			ma.put("data", query);
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(ma));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
/**
 * cha
 * @return
 */
public String query() {
		try {
			PageBean pageBean = new PageBean();
			pageBean.setRequest(request);
			pageBean.setRows(10);
			Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
			
			
			List<Map<String, Object>> query = serviceBiz.query(request.getParameterMap(), pageBean,user.get("user_id")+"");
			for (Map<String, Object> map : query) {
				String type =  map.get("svr_type")+"";
				List<Map<String, Object>> listDict = serviceBiz.listDict(type);
				Object svr_type_name = null;
				if(listDict!=null&&listDict.size()>0) {
					Map<String, Object> map2 = listDict.get(0);
					svr_type_name = map2.get("dict_item");
					
					
				}
				
				map.put("svr_type_name", svr_type_name+"");
				
				
			}
			Map<String, Object> ma = new HashMap<>();
			ma.put("code", 0);
			ma.put("msg", null);
			ma.put("count", pageBean.getTotal());
			ma.put("data", query);
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(ma));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

public String queryfk() {
	try {
		PageBean pageBean = new PageBean();
		pageBean.setRequest(request);
		pageBean.setRows(10);
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		
		
		List<Map<String, Object>> query = serviceBiz.queryfk(request.getParameterMap(), pageBean,user.get("user_id")+"");
		for (Map<String, Object> map : query) {
			String type =  map.get("svr_type")+"";
			List<Map<String, Object>> listDict = serviceBiz.listDict(type);
			Object svr_type_name = null;
			if(listDict!=null&&listDict.size()>0) {
				Map<String, Object> map2 = listDict.get(0);
				svr_type_name = map2.get("dict_item");
				
				
			}
			
			map.put("svr_type_name", svr_type_name+"");
			
			
		}
		Map<String, Object> ma = new HashMap<>();
		ma.put("code", 0);
		ma.put("msg", null);
		ma.put("count", pageBean.getTotal());
		ma.put("data", query);
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(ma));
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
}
public String queryfp() {
	try {
		PageBean pageBean = new PageBean();
		pageBean.setRequest(request);
		pageBean.setRows(10);
		Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		
		
		List<Map<String, Object>> query = serviceBiz.queryfp(request.getParameterMap(), pageBean,user.get("user_id")+"");
		for (Map<String, Object> map : query) {
			String type =  map.get("svr_type")+"";
			List<Map<String, Object>> listDict = serviceBiz.listDict(type);
			Object svr_type_name = null;
			if(listDict!=null&&listDict.size()>0) {
				Map<String, Object> map2 = listDict.get(0);
				svr_type_name = map2.get("dict_item");
				
				
			}
			
			map.put("svr_type_name", svr_type_name+"");
			
			
		}
		Map<String, Object> ma = new HashMap<>();
		ma.put("code", 0);
		ma.put("msg", null);
		ma.put("count", pageBean.getTotal());
		ma.put("data", query);
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(ma));
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
}
	/**
	 * 创建服务
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String addService() throws Exception{
		int a = 0;
		String svr_type = JsonUtils.getParamVal(request.getParameterMap(), "svr_type");
		if(StringUtils.isNotBlank(svr_type)&& !"-1".equals(svr_type)) {
			a = this.serviceBiz.addService(request.getParameterMap());
			
		}
		if("-1".equals(svr_type)) {
			a = -1;
		}
		
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(a));
		return null;
	}
	
	/**
	 * 修改
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String editService() throws  Exception {
		   int editService = this.serviceBiz.editService(request.getParameterMap());
		   ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(editService));
		return null;
	}
	
	/**
	 * 删除
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String delService() {
		try {
			int del = this.serviceBiz.delService(request.getParameterMap());
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(del));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/*int a= 0;
	String role_id = JsonUtils.getParamVal(request.getParameterMap(), "role_id");
	String menu_id = JsonUtils.getParamVal(request.getParameterMap(), "menu_id");
	//判断是否传了过来
	if(StringUtils.isNotBlank(role_id) && StringUtils.isNotBlank(menu_id) ) {
		
		a = roleMenuBiz.editRoleMenuState(role_id, menu_id);
		 roleMenuBiz.editRoleMenuState2(role_id, menu_id);
	
	}
	if(!StringUtils.isNotBlank(menu_id)) {
		a = -1;
	}
	ObjectMapper om = new ObjectMapper();
	ResponseUtil.write(response,*/// om.writeValueAsString(a));
	/**
	 * 修改服务状态为2-->已分配
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String editsvrStatus() throws  Exception {
		int a=0;
		String svr_deal_id = JsonUtils.getParamVal(request.getParameterMap(), "svr_deal_id");
		if(StringUtils.isNotBlank(svr_deal_id) && !svr_deal_id.equals("-1")) {
			a =serviceBiz.editsvrStatus(request.getParameterMap());
		}
		if("-1".equals(svr_deal_id)) {
			a = -1;
		}
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(a)); 
		return null;
	}
	/**
	 * 修改服务状态为3-->已处理
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String editsvrStatus2() throws  Exception {
		int a=0;
		String svr_deal = JsonUtils.getParamVal(request.getParameterMap(), "svr_deal");
		if(StringUtils.isNotBlank(svr_deal)) {
			a =serviceBiz.editsvrStatus2(request.getParameterMap());
		}
		else {
			a = -1;
		}
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(a)); 
		return null;
	}
	/**
	 * 修改服务状态为4-->已归档
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String editsvrStatus3() throws  Exception {
		int a = 0;
		String myd = JsonUtils.getParamVal(request.getParameterMap(), "svr_satisfy");
		String svr_result = JsonUtils.getParamVal(request.getParameterMap(), "svr_result");
		if(StringUtils.isNotBlank(svr_result) && !myd.equals("-1")) {
			if(Integer.parseInt(myd)>=3) {
				a = serviceBiz.editsvrStatus3(request.getParameterMap());
				
			}
			else {
				a = serviceBiz.editsvrStatus4(request.getParameterMap());
				
			}
		}
		 if(!StringUtils.isNotBlank(svr_result)&&myd.equals("-1")) {
			a=-1;
		} 
		
		
		
		
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(a)); 
		
		return null;
	}
	
	public String listZd() throws Exception {
		List<Map<String, Object>> query = serviceBiz.listZd(request.getParameterMap(), null);
		

		
		
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(query));
		return null;
	}
	
	
	public String listFk() throws Exception {
		List<Map<String, Object>> query = serviceBiz.listFk(request.getParameterMap(), null);
		

		
		
		ObjectMapper om = new ObjectMapper();
		ResponseUtil.write(response, om.writeValueAsString(query));
		return null;
	}
	/**
	 * 客户经理
	 * @return
	 */
	public String selectfp() {
		try {
			List<Map<String, Object>> list = this.serviceBiz.selectfp(request.getParameterMap(), null);

			
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
