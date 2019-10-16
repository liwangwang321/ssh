<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/rolejsp/layui/treetable-lay/treetable.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/rolejsp/layui/treetable-lay/treetable.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/rolejs/menuManger.js"></script>


</head>
<body>
<input type="hidden" id="lj" value="${pageContext.request.contextPath }">
<br/>
<button type="button" class="layui-btn" id="zk">全部展开</button>
<button type="button" class="layui-btn" id="zd">全部折叠</button>
	<button type="button" class="layui-btn layui-btn-radius btnys" id="add">增加菜单</button>
	<button type="button" class="layui-btn layui-btn-normal layui-icon-refreah"  id="refreah">刷新</button>
	<table class="layui-hidden" id="treetable" lay-filter="treeTable"></table>
	
	<script type="text/html" id="barDemo">
   			 <a class="operation" lay-event="edit" title="编辑"><i class="layui-icon layui-icon-edit"></i></a>

  			<a class="operation" lay-event="del"  title="删除"><i class="layui-icon layui-icon-delete" ></i></a>

		</script>
		
<!-- 增加弹出框		 -->
  
  <div class="site-text" style="margin: 5%; display: none; " id="box1" >	
	<form class="layui-form layui-form-pane" onsubmit="return false" style="width: 500px; height: 200px" id="menu" method="post" lay-filter="example">
	  	
	  	<div class="layui-form-item">
	    <label class="layui-form-label">节点ID</label>
	    <div class="layui-input-inline">
	      <input type="text" id="menu_id" name="menu_id" lay-verify="required"  autocomplete="off" placeholder="请输入节点ID" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">父节点ID</label>
	    <div class="layui-input-inline">
	      <input type="text" id="menu_pid" name="menu_pid" lay-verify="required"  autocomplete="off" placeholder="请输入父节点ID" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">节点名字</label>
	    <div class="layui-input-inline">
	      <input type="text" id="menu_name" name="menu_name" lay-verify="required"  autocomplete="off" placeholder="请输入节点名字" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">节点路径</label>
	    <div class="layui-input-inline">
	      <input type="text" id="menu_url" name="menu_url" lay-verify="required" autocomplete="off" placeholder="请输入节点路径" class="layui-input">
	    </div>
	  </div>
	  <br>
	 <label class="layui-form-label">节点的状态</label>
	    <div class="layui-input-block" id="menuT">
	      <input type="radio" name="menu_type" value="1" title="字节点"  checked>
	      <input type="radio" name="menu_type" value="0" title="父节点" >
	      
	    </div>
	  
	 
	</form>
</div>		
<!-- 增加弹出框		 -->
  
  <div class="site-text" style="margin: 5%; display: none; " id="box2" >	
	<form class="layui-form layui-form-pane" onsubmit="return false" style="width: 500px; height: 200px" id="menu2" method="post" lay-filter="example">
	  	<div class="layui-form-item">
	    <label class="layui-form-label">节点名字</label>
	    <div class="layui-input-inline">
	      <input type="text" id="menu_id2" name="menu_id" lay-verify="required"  autocomplete="off" readonly="readonly" class="layui-input">
	    </div>
	  </div>
	  
	  <div class="layui-form-item">
	    <label class="layui-form-label">节点名字</label>
	    <div class="layui-input-inline">
	      <input type="text" id="menu_name2" name="menu_name" lay-verify="required"  autocomplete="off" placeholder="请输入节点名字" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">节点路径</label>
	    <div class="layui-input-inline">
	      <input type="text" id="menu_url2" name="menu_url" lay-verify="required" autocomplete="off" placeholder="请输入节点路径" class="layui-input">
	    </div>
	  </div>
	  <br>

	  
	 
	</form>
</div>		



</body>
</html>