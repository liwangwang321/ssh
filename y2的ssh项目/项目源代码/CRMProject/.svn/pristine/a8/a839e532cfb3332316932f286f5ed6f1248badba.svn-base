package com.crm.role.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.ResponseUtil;
import com.crm.base.util.StringUtils;
import com.crm.base.web.BaseAction;
import com.crm.role.biz.RoleBiz;
import com.crm.role.biz.RoleMenuBiz;
import com.crm.role.dao.MenuDao;
import com.fasterxml.jackson.databind.ObjectMapper;

public class RoleAction extends BaseAction {
	
	private RoleBiz roleBiz;
	private RoleMenuBiz roleMenuBiz;
	
	

	public RoleMenuBiz getRoleMenuBiz() {
		return roleMenuBiz;
	}

	public void setRoleMenuBiz(RoleMenuBiz roleMenuBiz) {
		this.roleMenuBiz = roleMenuBiz;
	}

	public RoleBiz getRoleBiz() {
		return roleBiz;
	}

	public void setRoleBiz(RoleBiz roleBiz) {
		this.roleBiz = roleBiz;
	}
	
	/**
	 *  查询所有角色
	 * @return
	 */
	public String roleList() {
		
		try {
			List<Map<String, Object>> role = roleBiz.getRole(request.getParameterMap(), null);
			
		
			
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(role));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	/**
	 *  查询所有角色,分页
	 * @return
	 */
	public String roleListBean() {
		
		try {
			PageBean pageBean = new PageBean();
			pageBean.setRequest(request);
			
			List<Map<String, Object>> role = roleBiz.getRole(request.getParameterMap(), pageBean);
			
			
			
			
			Map<String, Object> ma = new HashMap<>();
			ma.put("code", 0);
			ma.put("msg", "成功了");
			ma.put("count", pageBean.getTotal());
			ma.put("data", role);
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(ma));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	/**
	 * 增加角色，同时也为角色菜单表增加一个默认条例
	 * @return
	 */
	public String addRole() {
		try {
			int a= 0;
			String role_id = JsonUtils.getParamVal(request.getParameterMap(), "role_id");
			String role_name = JsonUtils.getParamVal(request.getParameterMap(), "role_name");
			String role_desc = JsonUtils.getParamVal(request.getParameterMap(), "role_desc");
			//判断是否传了过来
			if(StringUtils.isNotBlank(role_id) && StringUtils.isNotBlank(role_desc) && StringUtils.isNotBlank(role_name)) {
				
				//增加角色表
				int addRole = roleBiz.addRole(request.getParameterMap());
				//增加角色菜单表
				int addRoleMenu = roleMenuBiz.addRoleMenu(request.getParameterMap());
				
				if((addRole+addRoleMenu)>=2) {
					a = 1;
				}
			
			}
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(a));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	/**
	 * 删除角色，同时也为角色菜单删除角色id为这个角色的
	 * @return
	 */
	public String delRole() {
		try {
			int a= 0;
			String role_id = JsonUtils.getParamVal(request.getParameterMap(), "role_id");
			//判断是否传了过来
			if(StringUtils.isNotBlank(role_id)) {
				
				//删除角色表
				int delRole = roleBiz.delRole(request.getParameterMap());
				//增加角色菜单表
				int delRoleMenu = roleMenuBiz.delRoleMenu(request.getParameterMap());
				
				
				if((delRole+delRoleMenu)>=2) {
					a = 1;
				}
			
			}
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(a));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	/**
	 * 修改角色的基本信息
	 * @return
	 */
	public String editRole() {
		try {
			int a= 0;
			String role_id = JsonUtils.getParamVal(request.getParameterMap(), "role_id");
			String role_name = JsonUtils.getParamVal(request.getParameterMap(), "role_name");
			String role_desc = JsonUtils.getParamVal(request.getParameterMap(), "role_desc");
			//判断是否传了过来
			if(StringUtils.isNotBlank(role_id) && StringUtils.isNotBlank(role_desc) && StringUtils.isNotBlank(role_name)) {
				
				a = roleBiz.editRole(request.getParameterMap());
				
			
			}
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(a));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 修改角色的状态
	 * @return
	 */
	public String editRoleState() {
		try {
			int a= 0;
			String role_id = JsonUtils.getParamVal(request.getParameterMap(), "role_id");
			String state = JsonUtils.getParamVal(request.getParameterMap(), "state");
			//判断是否传了过来
			if(StringUtils.isNotBlank(role_id) && StringUtils.isNotBlank(state) ) {
				
				a = roleBiz.editRoleState(request.getParameterMap());
			
			}
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(a));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * ztree
	 * @return
	 */
	public String ztree() {
		try {
			MenuDao md = new MenuDao();
			String role_id = JsonUtils.getParamVal(request.getParameterMap(), "role_id");
			List<Map<String, Object>> menuList = null;
			if(StringUtils.isNotBlank(role_id)) {
				 menuList = roleMenuBiz.ztreeGetList(role_id);
				 menuList = md.menuZtree(menuList);
				
			}
			
			ObjectMapper om = new ObjectMapper();
			ResponseUtil.write(response, om.writeValueAsString(menuList));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	/**
	 * 修改选择过后的
	 * @return
	 */
	public String editRoleMenuState() {
		try {
			int a= 0;
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
			ResponseUtil.write(response, om.writeValueAsString(a));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	
	

}
