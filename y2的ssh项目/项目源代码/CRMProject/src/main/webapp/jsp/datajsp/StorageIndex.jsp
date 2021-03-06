<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询库存</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/js/datajs/StorageIndex.js"></script>
</head>
<body>
	<!-- path传值 -->
	
	<input type ="hidden" id="path" value="${pageContext.request.contextPath }" >

	<!-- 查询条件	 -->
	
    <div class="layui-inline">
		    <blockquote class="layui-elem-quote">
			<!-- 搜索框 -->
				<div class="layui-form">
					<div class="layui-inline" >
				   			<h2 class="layui-font">查询产品信息</h2>
					  </div>
				    <div class="layui-form-item">
				        <label class="layui-form-label">产品名字</label>
				        <div class="layui-input-inline">
				            <input type="text" id='prod_name' name="prod_name"
				                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
				                   class="layui-input">
				        </div>
				        <label class="layui-form-label">ID</label>
				        <div class="layui-input-inline">
				            <input type="text" id='stk_id' name="stk_id"
				                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
				                   class="layui-input">
				        </div>
				         <label class="layui-form-label">仓库</label>
				        <div class="layui-input-inline">
				            <input type="text" id='stk_warehouse' name="stk_warehouse"
				                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
				                   class="layui-input">
				        </div>
				        <button id="ref" class="layui-btn layui-btn-normal layui-btn-radius" ><i class="layui-icon">&#xe669;</i>刷新</button>
				        <button id="search" class="layui-btn layui-btn-normal layui-btn-radius" ><i class="layui-icon">&#xe615;</i>查询</button>
				    </div>
				</div>
			
			</blockquote> 
	    
	    
	   
	   
	   <!-- table -->
	    <table id="demo" lay-filter="test" style="text-align: center;"></table>
    </div>
  
</body>
</html>