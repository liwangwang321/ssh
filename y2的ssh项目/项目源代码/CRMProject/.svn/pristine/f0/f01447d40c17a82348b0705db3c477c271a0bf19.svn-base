package com.crm.book.web;

import java.util.List;
import java.util.Map;

import com.crm.base.web.BaseAction;
import com.crm.book.biz.impl.UserBizImpl;

public class UserAction extends BaseAction {
	private UserBizImpl userBiz  ;
	
	
	


	public UserBizImpl getUserBiz() {
		return userBiz;
	}





	public void setUserBiz(UserBizImpl userBiz) {
		this.userBiz = userBiz;
	}





	public String list() {
		try {
			List<Map<String, Object>> list2 = userBiz.list(request.getParameterMap(), null);
			for (Map<String, Object> map : list2) {
				System.out.println(map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	

}
