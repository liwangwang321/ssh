package com.crm.base.web;

import java.io.Serializable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

public class BaseAction implements ServletRequestAware, ServletResponseAware,Serializable{
	private static final long serialVersionUID = -7110462505161900879L;
	/**
	 * 为了传值使用
	 */
	protected HttpServletResponse response;
	protected HttpServletRequest request;
	protected HttpSession session;
	protected ServletContext application;
	
	/**
	 * 为了配置跳转页面所用
	 */
	protected final static String SUCCESS = "success";
	protected final static String FAIL = "fail";
	protected final static String LIST = "list";
	protected final static String ADD = "add";
	protected final static String EDIT = "edit";
	protected final static String DETAIL = "detail";
	
	/**
	 * 具体传值字段	后端向jsp页面传值所用字段
	 */
	protected Object result;
	protected Object msg;
	protected int code;

	public Object getResult() {
		return result;
	}

	public Object getMsg() {
		return msg;
	}

	public int getCode() {
		return code;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
		this.session = arg0.getSession();
		this.application = arg0.getServletContext();
	}

}
