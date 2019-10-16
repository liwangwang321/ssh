<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据字典管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/js/datajs/dictIndex.js"></script>
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
				   			<h2 class="layui-font">数据字典管理</h2>
					  </div>
				    <div class="layui-form-item">
				        <label class="layui-form-label">类别名</label>
				        <div class="layui-input-inline">
				            <input type="text" id='name' name="name"
				                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
				                   class="layui-input">
				        </div>
				        <label class="layui-form-label">类别号</label>
				        <div class="layui-input-inline">
				            <input type="text" id='type' name="type"
				                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
				                   class="layui-input">
				        </div>
				         <label class="layui-form-label">条目</label>
				        <div class="layui-input-inline">
				            <input type="text" id='item' name="item"
				                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
				                   class="layui-input">
				        </div>
				         <button class="layui-btn layui-btn-normal layui-btn-radius" id="search"><i class="layui-icon">&#xe615;</i>查询</button>
					
					<br>
					<br>	
				    <div style="float: right;margin-right: 50px">
				    <button class="layui-btn layui-btn-normal layui-btn-radius" id="add" ><i class="layui-icon">&#xe654;</i>新增</button>
				    <div style="float: right;margin-right: 10px">
		    <button id="ref" class="layui-btn layui-btn-normal layui-btn-radius" ><i class="layui-icon">&#xe669;</i>刷新</button>
	    </div>
				    </div>
						
				    </div>
				</div>
			</blockquote> 
	    <!-- 查询 增加 按钮 -->
	    
	   
	   <!-- table -->
	    <table id="demo" lay-filter="test" style="text-align: center;"></table>
    </div>
  
  
  
  <!-- 增加弹出框		 -->
  
  <div class="site-text" style="margin: 5%; display: none;" id="window" >	
	<form class="layui-form layui-form-pane"  style="width: 350px; height: 45%" id="dict" method="post" lay-filter="example">
	  <div class="layui-form-item" style="align: center">
	    <label class="layui-form-label">类别编号</label>
	    <div class="layui-input-inline">
	      <input type="text" id="dict_type" name="dict_type" lay-verify="" autocomplete="off" placeholder="请输入类别编号" class="layui-input">
	   		<br>
	    </div>
	     <div class="layui-form-item">
		    <label class="layui-form-label">类别名</label>
		    <div class="layui-input-inline">
		      <input type="text" id="dict_type_name" name="dict_type_name" lay-verify="pass" autocomplete="off" placeholder="请输入类别名称" class="layui-input">
		    <br>
		    </div>
	    </div>
	     <div class="layui-form-item">
	    <label class="layui-form-label">条目</label>
	    <div class="layui-input-inline">
	      <input type="text" id="dict_item" name="dict_item" lay-verify="title" autocomplete="off" placeholder="请输入条目" class="layui-input">
	    <br>
	    </div>
	    </div>
	    <div class="layui-form-item">
	    <label class="layui-form-label">值</label>
	    <div class="layui-input-inline">
	      <input type="text" id="dict_value" name="dict_value" lay-verify="title" autocomplete="off" placeholder="请输入值" class="layui-input">
	    <br>
	    </div>
	    </div>
	    <div class="layui-form-item">
	    <label class="layui-form-label">是否可编辑</label>
	     <div class="layui-input-block" id="editnum">
	       <input type="radio" name="dict_is_editable" value="1" title="可编辑" checked="checked">
      	   <input type="radio" name="dict_is_editable" value="0" title="不可编辑">
	     </div>
	    </div>
 	 </div>
	</form>
</div>


</body>
</html>