	package com.crm.role.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.TreeNode;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.ResponseUtil;
import com.crm.base.web.BaseAction;
import com.crm.role.biz.MenuBiz;
import com.crm.role.biz.impl.MenuBizImpl;
import com.crm.role.dao.RoleDao;
import com.crm.role.dao.RoleMenuDao;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MenuAction extends BaseAction {
	
	private MenuBiz  menuBiz ;
	
	
	
	
	




	public MenuBiz getMenuBiz() {
		return menuBiz;
	}









	public void setMenuBiz(MenuBiz menuBiz) {
		this.menuBiz = menuBiz;
	}

	
	/**
	 * 获取所有的菜单集合,来完成菜单管理界面的铺垫
	 * @return
	 */
	public String menuList() {
		try {
			List<Map<String, Object>> menuList = menuBiz.menuList(request.getParameterMap(), null);
			
			Map<String, Object> ma = new HashMap<>();
			ma.put("code", 0);
			ma.put("msg", null);
			ma.put("count", null);
			ma.put("data", menuList);
			
			
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(ma));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	




	/**
	 * 调用了tree方法
	 * @return
	 * @throws Exception
	 */
	public String treeMenu() throws Exception {
		try {
			List<TreeNode> list = this.menuBiz.list(request.getParameterMap(), null);
			ObjectMapper om=new ObjectMapper();
			String jsonStr = om.writeValueAsString(list);
			ResponseUtil.write(response, jsonStr);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "success";
	} 
	
	/**
	 * 增加菜单管理
	 * @return
	 */
	public String addMenu() {
		
		try {
			int addMenu = menuBiz.addMenu(request.getParameterMap());
			String menu_id = JsonUtils.getParamVal(request.getParameterMap(), "menu_id");
			RoleDao rd = new RoleDao();
			RoleMenuDao rmd = new RoleMenuDao();
			List<Map<String, Object>> list2 = rd.list();
			
			for (Map<String, Object> map : list2) {
				rmd.addRoleMenuDan(map.get("role_id")+"", menu_id);
			}
			
			
			
			
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(addMenu));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 删除
	 */
	public String delMenu() {
		try {
			String menu_type = JsonUtils.getParamVal(request.getParameterMap(), "menu_type");
			
			int a = 0;
			if(1==Integer.parseInt(menu_type)) {
				a = menuBiz.delMenuId(request.getParameterMap());
			}
			else {
				int a1 = menuBiz.delMenuId(request.getParameterMap());
				int a2 = menuBiz.delMenuPid(request.getParameterMap());
				if((a1+a2)>=2) {
					a=1;
				}
			}
			String menu_id = JsonUtils.getParamVal(request.getParameterMap(), "menu_id");
			RoleDao rd = new RoleDao();
			RoleMenuDao rmd = new RoleMenuDao();
			List<Map<String, Object>> list2 = rd.list();
			
			for (Map<String, Object> map : list2) {
				rmd.delRoleMenuDan(map.get("role_id")+"", menu_id);
			}
			
		
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(a));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public String editMenu() {
		try {
			int a = 0;
			a = menuBiz.editMenu(request.getParameterMap());
			
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(a));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	

}
