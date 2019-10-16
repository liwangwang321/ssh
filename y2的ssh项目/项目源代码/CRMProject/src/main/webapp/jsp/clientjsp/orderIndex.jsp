<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史订单管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/js/clientjs/orderIndex.js"></script>
</head>

<body>
<input type="hidden" value="${pageContext.request.contextPath }" id="path">



<blockquote class="layui-elem-quote">
<!-- 搜索框 -->

<div class="layui-form">

    <div class="layui-form-item">
         <label class="layui-form-label">编号：</label>
        <div class="layui-input-inline">
            <input type="text" id='cxbh' 
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">客户名称：</label>
        <div class="layui-input-inline">
            <input type="text" id='cxmc' 
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">地址：</label>
        <div class="layui-input-inline">
            <input type="text" id='cxdz' 
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        
        <button id="cx" class="layui-btn layui-btn-normal layui-btn-radius" data-type="reload"><i class="layui-icon">&#xe615;</i>查询</button>
    	<div style="float: right;margin-right: 10px">
		    <button id="ref" class="layui-btn layui-btn-normal layui-btn-radius" ><i class="layui-icon">&#xe669;</i>刷新</button>
	    </div>
    </div>
</div>

</blockquote>

<table id="demo" lay-filter="bianji"></table>
</body>
</html>