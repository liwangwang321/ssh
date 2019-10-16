<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath }/js/marketingjs/plan.js"></script>

<title>计划</title>
</head>
<body class="child-body">
<div class="child-nav">
    <span class="layui-breadcrumb">
         <a>营销管理</a>
         <a><cite>分类列表</cite></a>
    </span>
</div>


<blockquote class="layui-elem-quote">
<!-- 搜索框 -->

<div class="layui-form">
关键词:
    <div class="layui-form-item">
        <label class="layui-form-label">联系人</label>
        <div class="layui-input-inline">
            <input type="text" id='chc_linkman' 
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
         <label class="layui-form-label">客户经理</label>
        <div class="layui-input-inline">
            <input type="text" id='chc_due_to' 
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        
        <button class="layui-btn layui-btn-normal layui-btn-radius" data-type="reload"><i class="layui-icon">&#xe615;</i>查询</button>
		<button class="layui-btn layui-btn-normal layui-btn-radius" id="ref" ><i class="layui-icon layui-icon-refresh"></i>刷新</button>
		
    </div>
</div>

</blockquote>



<!--隐藏域传值  -->
<input type="hidden"  id="plan" value="${pageContext.request.contextPath}" >
<!--根据table id 来展示表格数据  -->
<table id="test" lay-filter="test" ></table>
<!-- 查看弹出层  -->
	 <div class="site-text" style="margin: 5%; display: none" id="box1"  target="test123">
	 	<button type="button" class="layui-btn" id="hh" ><i class="layui-icon layui-icon-release"></i>制定计划</button>
	 	<button type="button" class="layui-btn" id="h1" ><i class="layui-icon layui-icon-tips"></i>计划跟进详情</button>
	    <br>
	    <br>
	    <form class="layui-form layui-form-pane" disabled="disabled" onsubmit="return false" id="sal1">
	         <div class="layui-form-item">
	         	 <label class="layui-form-label">客户编号</label>
		         <div class="layui-input-inline">
		             <input type="text" class="layui-input layui-disabled text_add " readonly="readonly" id="chc_id3"  ><br>
		          </div>
		         <label class="layui-form-label">机会来源</label>
		         <div class="layui-input-inline">
		             <input type="text" class="layui-input"  id="chc_source3" readonly="readonly"  ><br>
		          </div>
	          
	            <label class="layui-form-label">客户名称</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_cust_name3" readonly="readonly" ><br>
	            </div>
	            
	             <label class="layui-form-label">成功机率</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_rate3" readonly="readonly"><br>
	            </div>
	             <label class="layui-form-label">联系人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"   id="chc_linkman3" readonly="readonly"><br>
	            </div>
	             <label class="layui-form-label">联系人电话</label>
	            <div class="layui-input-inline">
	                <input type="tel" class="layui-input" id="chc_tel3"  readonly="readonly"><br>
	            </div>
	             <label class="layui-form-label">概要</label>
	            <div class="layui-input-block">
	                 <input type="text" name="title" autocomplete="off" id="chc_title3" readonly="readonly" class="layui-input"><br>
	            </div>
	            
	             <label class="layui-form-label">创建人</label>
	            <div class="layui-input-inline">
	            	<input type="hidden"  id="user_id3" name="user_id" ><!-- 创建人id -->
	                <input type="text" class="layui-input" readonly="readonly" id="chc_create_by3" ><br>
	            </div>
	            
	             <label class="layui-form-label">创建时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_create_date3" readonly="readonly"><br>
	            </div>
	            <hr>
	             <label class="layui-form-label">指派给</label>
			    <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_due_id3"  readonly="readonly"><br>
			    </div>
			    <label class="layui-form-label">指派时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_due_date3" readonly="readonly"><br>
	            </div>
	            <hr>
			    <label class="layui-form-label">机会描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容"  disabled="disabled" class="layui-textarea" id="chc_desc3" readonly="readonly"></textarea>
			   </div>
	            
	        </div>
	    </form>
	</div> 
	
	<!-- 开发成功/失败 -->
	 <div class="site-text" style="margin: 5%; display: none" id="xq"  target="test123">
	 	<button type="button" class="layui-btn" id="kfxq" ><i class="layui-icon layui-icon-tips"></i>计划跟进详情</button>
	    <br>
	    <br>
	    <form class="layui-form layui-form-pane" disabled="disabled" onsubmit="return false" id="dd">
	         <div class="layui-form-item">
	         	 <label class="layui-form-label">客户编号</label>
		         <div class="layui-input-inline">
		             <input type="text" class="layui-input layui-disabled text_add " readonly="readonly" id="chc_id4"  ><br>
		          </div>
		         <label class="layui-form-label">机会来源</label>
		         <div class="layui-input-inline">
		             <input type="text" class="layui-input"  id="chc_source4" readonly="readonly"  ><br>
		          </div>
	          
	            <label class="layui-form-label">客户名称</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_cust_name4" readonly="readonly" ><br>
	            </div>
	            
	             <label class="layui-form-label">成功机率</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_rate4" readonly="readonly"><br>
	            </div>
	             <label class="layui-form-label">联系人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"   id="chc_linkman4" readonly="readonly"><br>
	            </div>
	             <label class="layui-form-label">联系人电话</label>
	            <div class="layui-input-inline">
	                <input type="tel" class="layui-input" id="chc_tel4"  readonly="readonly"><br>
	            </div>
	             <label class="layui-form-label">概要</label>
	            <div class="layui-input-block">
	                 <input type="text" name="title" autocomplete="off" id="chc_title4" readonly="readonly" class="layui-input"><br>
	            </div>
	            
	             <label class="layui-form-label">创建人</label>
	            <div class="layui-input-inline">
	            	<input type="hidden"  id="user_id3" name="user_id4" ><!-- 创建人id -->
	                <input type="text" class="layui-input" readonly="readonly" id="chc_create_by4" ><br>
	            </div>
	            
	             <label class="layui-form-label">创建时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_create_date4" readonly="readonly"><br>
	            </div>
	            <hr>
	             <label class="layui-form-label">指派给</label>
			    <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_due_id4"  readonly="readonly"><br>
			    </div>
			    <label class="layui-form-label">指派时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="chc_due_date4" readonly="readonly"><br>
	            </div>
	            <hr>
			    <label class="layui-form-label">机会描述</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" readonly="readonly" class="layui-textarea" id="chc_desc4" readonly="readonly"></textarea>
			   </div>
	            
	        </div>
	    </form>
	</div> 
	<!-- 计划详情 -->
	<div class="site-text" style="margin: 5%; display: none" id="box3"  target="test123">
	    <table class="layui-table" lay-size="lg" id="sal" lay-filter="sal" ></table>
	</div> 
	 <script type="text/html" id="Btn">
	    <a class="layui-btn layui-btn-normal layui-btn-sm"  lay-event="edit"><i class="layui-icon"></i></a>
		<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del"><i class="layui-icon"></i></a>
	 </script>
	<!-- 开发成功/详情 -->
	
	<!-- 制定计划弹框 -->
	<div class="site-text" style="margin: 5%; display: none" id="box2"  target="test123">
	    <form class="layui-form layui-form-pane" disabled="disabled" onsubmit="return false" id="sal2">
	         <div class="layui-form-item">
	             <label class="layui-form-label">日期</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  id="pla_date"  readonly="readonly"><br>
	            </div>
	            <hr>
			    <label class="layui-form-label">机会内容</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容"  class="layui-textarea" id="pla_todo" placeholder="请输入"></textarea>
			   </div>
	            
	        </div>
	    </form>
	</div> 
	
	<!-- 计划跟进详情框 -->
	<div class="site-text" style="margin: 5%; display: none" id="box3"  target="test123">
	    <table class="layui-table" lay-size="lg" id="sal" lay-filter="sal" ></table>
	</div> 
	 <script type="text/html" id="Btn">
	    <a class="layui-btn layui-btn-normal layui-btn-sm"  lay-event="edit"><i class="layui-icon"></i></a>
		<a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del"><i class="layui-icon"></i></a>
	 </script>
		                 
</body>




</html>