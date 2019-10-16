<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>、
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css" type="text/css">

 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
 



<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/js/rolejs/roleManger.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ztree/jquery.ztree.all.min.js"></script>
</head>
<body>
<blockquote class="layui-elem-quote">
<!-- 搜索框 -->

<div class="layui-form">

    <div class="layui-form-item">
        <label class="layui-form-label">角色名字</label>
        <div class="layui-input-inline">
            <input type="text" id='sel_role_name' name="role_name"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       <button class="layui-btn layui-btn-normal layui-btn-radius" id="sel" data-type="reload"><i class="layui-icon">&#xe615;</i>查询</button>
			<button class="layui-btn layui-btn-normal"  id="add" data-type="add">增加角色</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="layui-btn layui-btn-sm layui-btn-normal"  id="ref" data-type="ref">刷新</button>
	      <br>
	      <br>
         <label class="layui-form-label">用户状态</label>
	    <div class="layui-input-block" id="editFlag">
	   	  <input type="radio" name="role_flag" value="-1" title="全部" checked>
	      <input type="radio" name="role_flag" value="1" title="可用" >
	      <input type="radio" name="role_flag" value="0" title="不可用" >
	      
	    </div>
       
    </div>
</div>


</blockquote>

<!--隐藏域传值  -->
<input type="hidden"  id="path" value="${pageContext.request.contextPath}" >
<!--根据table id 来展示表格数据  -->
<table class="layui-hide" id="test" lay-filter="test"></table>

<!-- 表格 编辑 删除 绑定按钮 -->

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="editRole"><i class="layui-icon">&#xe642;</i>角色授权</a>
  <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

 <!-- 增加弹出框		 -->
  
  <div class="site-text" style="margin: 5%; display: none; " id="box1" >	
	<form class="layui-form layui-form-pane" onsubmit="return false" style="width: 500px; height: 200px" id="userRole" method="post" lay-filter="example">
	  	
	  	<div class="layui-form-item">
	    <label class="layui-form-label">角色ID</label>
	    <div class="layui-input-inline">
	      <input type="text" id="role_id" name="role_id" lay-verify="required"  autocomplete="off" placeholder="请输入角色ID" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">角色名称</label>
	    <div class="layui-input-inline">
	      <input type="text" id="role_name" name="role_name" lay-verify="required" autocomplete="off" placeholder="请输入角色名称" class="layui-input">
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">角色备注</label>
	    <div class="layui-input-inline">
	      <textarea placeholder="请输入内容" class="layui-textarea" id="role_desc" name="role_desc" lay-verify="required"  placeholder="请为这个角色代言"></textarea>
	    </div>
	  </div>
	  
	 
	</form>
</div>

 <div class="site-text" style="margin: 5%; display: none; " id="box2" >	
	<form class="layui-form layui-form-pane" onsubmit="return false" style="width: 500px; height: 200px" id="userRole2" method="post" lay-filter="example">
	  <div class="layui-form-item">
	    <label class="layui-form-label">授权角色</label>
	     <div class="layui-input-inline">
	      <input type="text" id="role_id2" readonly="readonly" name="role_id" lay-verify="required" autocomplete="off"  class="layui-input">
	    </div>
	  </div>	 
	 	<div>
		    <ul id="treeDemo" class="ztree"></ul>
		</div>
	 
	</form>
</div>















</body>
</html>