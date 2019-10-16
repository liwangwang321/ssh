<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<title>服务分配</title>
</head>
<body class="child-body">
<div class="child-nav">
    <span class="layui-breadcrumb">
         <a>服务分配</a>
         <a><cite>分配列表</cite></a>
    </span>
</div>

<input type="hidden" id = "user_id" value = "${user.user_id }">
<input type="hidden" id = "user_name" value = "${user.user_name }">

<blockquote class="layui-elem-quote">
 <!--搜索维度-->
 
   <div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">客户名称</label>
        <div class="layui-input-inline">
            <input type="text" id='svr_cust_name8' name="svr_cust_name"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">概要</label>
        <div class="layui-input-inline">
            <input type="text" id='svr_title8' name="svr_title"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">服务类型</label>
	            <div class="layui-input-inline" lay-filter="svr">
					<select name="svr_type" id="svr_type8">
					<option value="-1">全部服务类型</option>
					</select>
				</div>
          <button class="layui-btn layui-btn-normal layui-btn-radius" data-type="reload"><i class="layui-icon">&#xe615;</i>查询</button>
		  <button class="layui-btn layui-btn-normal layui-btn-radius" id="ref">刷新</button>
         
				 <br>
				<div class="layui-input-block" id="dx_status">
         		<label class="layui-form-label">服务状态</label>
         		<input type="radio" name="svr_status"  value="-1" title="全部"  checked>
	            <input type="radio" name="svr_status"  value="2" title="已分配" >
				<input type="radio" name="svr_status"  value="1" title="待分配" >
				</div>
      
    </div>
</div>


</blockquote>



<!--隐藏域传值  -->
<input type="hidden"  id="sj" value="${pageContext.request.contextPath}" >
<!--根据table id 来展示表格数据  -->
<table class="layui-hide" id="test" lay-filter="test" ></table>




	 <!-- 分配弹出层  -->
	 <div class="site-text" style="margin: 5%; display: none" id="box2"  target="test123">
	    <form class="layui-form layui-form-pane"  onsubmit="return false" id="sal2">
	         <div class="layui-form-item">
	         	 
        	      <label class="layui-form-label">指派客户经理</label>
			      <div class="layui-input-inline">
			         <select class="seloption" name="svr_deal_id" id="svr_deal_id1" lay-verify="required" lay-filter="xmFilter">
	                    <option value="-1">选择客户经理</option>
	                </select>
			      </div>
	        </div>
	    </form>
	</div> 
	
	
	<!-- 查看弹出层  -->
	 <div class="site-text" style="margin: 5%; display: none" id="box3"  target="test123">
	    <form class="layui-form layui-form-pane" readonly="readonly" onsubmit="return false" id="sal3">
	         <div class="layui-form-item">
	             <label class="layui-form-label">被指派人</label>
			    <div class="layui-input-inline">
	                <input type="text" class="layui-input"  readonly="readonly" id="svr_deal_name2" placeholder="请输入" name=svr_deal_name><br>
			    </div>
			    <label class="layui-form-label">指派时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="svr_due_date2" readonly="readonly" name=svr_due_date><br>
	            </div>
			    
	            
	        </div>
	    </form>
	</div> 

</body>
<script src="${pageContext.request.contextPath }/js/servicejs/distributionservice.js"> </script>



</html>