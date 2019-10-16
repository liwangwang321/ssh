<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户信息管理</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/js/clientjs/clientIndex.js"></script>
</head>

<body>
<input type="hidden" value="${pageContext.request.contextPath }" id="path">


<blockquote class="layui-elem-quote">
<!-- 搜索框 -->

<div class="layui-form">
    <div class="layui-form-item">
         <label class="layui-form-label">客户编号：</label>
        <div class="layui-input-inline">
            <input type="text" id='cxcust_id' name="chc_linkman"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">客户名称：</label>
        <div class="layui-input-inline">
            <input type="text" id='cxcust_name' name="chc_cust_name"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">地区：</label>
        <div class="layui-input-inline">
            <input type="text" id='cxcust_region' name="chc_linkman"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <button id="cx" class="layui-btn layui-btn-normal layui-btn-radius" data-type="reload"><i class="layui-icon">&#xe615;</i>查询</button>
    	<br>
		<br>	
	    <div style="float: right;margin-right: 10px">
		    <button id="ref" class="layui-btn layui-btn-normal layui-btn-radius" ><i class="layui-icon">&#xe669;</i>刷新</button>
	    </div>
    </div>
</div>

</blockquote>


<table id="demo" lay-filter="test"></table>


<!-- 联系人弹出框 -->
<div class="site-text" style="margin: 5%; display: none;" id="lxrtk" >	

	<button type="button" class="layui-btn" id="xzlxr">新增联系人</button>
	    <label class="layui-form-label">客户编号</label>
	    <div class="layui-input-block">
	      <input readonly="readonly" type="text" id="lxr_cust_no" class="layui-input">
	    </div>
	    <label class="layui-form-label">客户名称</label>
	    <div class="layui-input-block">
	      <input readonly="readonly" type="text" id="lxr_cust_name" class="layui-input">
	    </div>
		<table id="lxrtab" lay-filter="lxrcz"></table>
</div>



<!-- 联系人新增弹框 -->
<div class="site-text" style="margin: 5%; display: none;" id="xzlxrtk" >	
	<form class="layui-form layui-form-pane"  style="width: 500px; height: 900px" id="xzlxrbd" method="post" lay-filter="example">
		<label class="layui-form-label">联系人名字</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzlxrlkm_name" class="layui-input">
	    </div>
	    <label class="layui-form-label">性别</label>
	    <div class="layui-input-block" id="xzlxrlkm_sex">
	      <input type="radio" name="xz_sex" value="男" title="男" checked>
	      <input type="radio" name="xz_sex" value="女" title="女" >
	    </div>
	    <label class="layui-form-label">职位</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzlxrlkm_postion" class="layui-input">
	    </div>
	    <label class="layui-form-label">办公电话</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzlxrlkm_tel" class="layui-input">
	    </div>
	    
	    <input type="hidden" id="xzlxrlkm_id">
	    
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzlxrlkm_memo" class="layui-input">
	    </div>
    </form>
</div>



<!-- 交往记录弹出框 -->
<div class="site-text" style="margin: 5%; display: none;" id="jwjltk" >	
	<button type="button" class="layui-btn" id="jwjlxz">新增交往记录</button>
	<label class="layui-form-label">客户编号</label>
	    <div class="layui-input-block">
	      <input readonly="readonly" type="text" id="jwjl_cust_no" class="layui-input">
	    </div>
	    <label class="layui-form-label">客户名称</label>
	    <div class="layui-input-block">
	      <input readonly="readonly" type="text" id="jwjl_cust_name" class="layui-input">
	    </div>
		<table id="jwjltab" lay-filter="jwjlcz"></table>
</div>



<!-- 交往记录新增弹框 -->
<div class="site-text" style="margin: 5%; display: none;" id="xzjwjltk" >	
	<form class="layui-form layui-form-pane"  style="width: 500px; height: 900px" id="xzjwjlrbd" method="post" lay-filter="example">
		<label class="layui-form-label">交往地点</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzjwjlatv_place" class="layui-input">
	    </div>
	    <label class="layui-form-label">概要</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzjwjlatv_title" class="layui-input">
	    </div>
	    <label class="layui-form-label">备注</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzjwjlatv_remark" class="layui-input">
	    </div>
	    
	    <input type="hidden" id="xzjwjlatv_id">
	    
	    <label class="layui-form-label">详细</label>
	    <div class="layui-input-block">
	      <input type="text" id="xzjwjlatv_desc" class="layui-input">
	    </div>
    </form>
</div>



<!-- 查看弹出框 -->
<div class="site-text" style="margin: 5%; display: none;" id="window1" >	
	 <p>
        <button type="button" class="layui-btn" id="lxr">联系人</button>
        <button type="button" class="layui-btn" id="jwjl">交往记录</button>
      </p>
      <br>
	<form class="layui-form layui-form-pane"  style="width: 500px; height: 50%" id="dict2" method="post" lay-filter="example">
	   <div class="layui-form-item">
				    <label class="layui-form-label">客户编号</label>
				    <div class="layui-input-inline grid-demo">
				      <input readonly="readonly" type="text" id="cust_no1" name="cust_no1" lay-verify=""  placeholder="请输入类别编号" class="layui-input">
				    </div>
			
			    <div class="layui-col-md4">
				    <div class="layui-input-inline grid-demo">
				    <label class="layui-form-label">客户名称</label>
				      <input readonly="readonly" type="text" id="cust_name1" name="cust_name1" lay-verify="" autocomplete="off" placeholder="请输入类别编号" class="layui-input">
				    </div>
			    </div>
			    <div class="layui-col-md4">
				    <div class="layui-input-inline grid-demo">
				    <label class="layui-form-label">地区</label>
				      <input readonly="readonly" type="text" id="cust_region1" name="cust_region1" lay-verify=""  class="layui-input">
				    </div>
			    </div>
	    	<div class="layui-col-md4">
			    <div class="layui-input-inline grid-demo">
			    <label class="layui-form-label">客户经理ID</label>
			      <input readonly="readonly" type="text" id="user_id1" name="user_id1" lay-verify=""  class="layui-input">
			    </div>
		    </div>
		    <div class="layui-col-md4">
			    <div class="layui-input-inline grid-demo">
			     <label class="layui-form-label">客户经理名字</label>
			      <input readonly="readonly" type="text" id="cust_manager_name1" name="cust_manager_name1" lay-verify=""  class="layui-input">
			    </div>
		    </div>
		    <div class="layui-col-md4">
			    <div class="layui-input-inline grid-demo">
			     <label class="layui-form-label">客户级别</label>
			      <input type="text" readonly="readonly" id="cust_level1" name="cust_level1" lay-verify=""  class="layui-input">
			    </div>
		    </div>
	    	<div class="layui-form-item">
		    <label class="layui-form-label">客户满意度</label>
		    <div class="layui-input-block">
	     		 <div id="test3"></div>
		    </div>
		    <label class="layui-form-label">客户信用度</label>
		    <div class="layui-input-block">
		     	 <div id="test4"></div>
		    </div>
	    </div>
	   		 <div class="layui-col-md6">
			    <div class="layui-input-block grid-demo">
			    <label class="layui-form-label">地址</label>
			      <input type="text" readonly="readonly" id="cust_addr1" name="cust_addr1" lay-verify=""   class="layui-input">
			    </div>
		    </div>
		    <div class="layui-col-md6">
			    <div class="layui-input-inline grid-demo">
			    <label class="layui-form-label">电话</label>
			      <input type="text" readonly="readonly" id="cust_tel1" name="cust_tel1" lay-verify=""  class="layui-input">
			    </div>
		    </div>
		    <div class="layui-col-md6">
			    <div class="layui-input-inline grid-demo">
			    <label class="layui-form-label">网站</label>
			      <input type="text" readonly="readonly" id="cust_website1" name="cust_website1" lay-verify=""  class="layui-input">
			    </div>
		    </div>
	   		 <div class="layui-col-md6">
			    <div class="layui-input-inline grid-demo">
			    <label class="layui-form-label">注册资金/元</label>
			      <input type="text" readonly="readonly" id="cust_bankroll1" name="cust_bankroll1" lay-verify=""   class="layui-input">
			    </div>
		    </div>
		    <div class="layui-col-md6">
			    <div class="layui-input-inline grid-demo">
			    <label class="layui-form-label">客户状态</label>
			      <input type="text" readonly="readonly" id="cust_status1" name="cust_status1" lay-verify=""   class="layui-input">
			    </div>
		    </div>
	   </div>
	</form>
</div>

<!-- 编辑弹出框 -->
<div class="site-text" style="margin: 5%; display: none;" id="window" >	
	<form class="layui-form layui-form-pane"  style="width: 500px; height: 900px" id="dict" method="post" lay-filter="example">
	    <div class="layui-form-item">
		    <label class="layui-form-label">客户编号</label>
		    <div class="layui-input-block">
		      <input type="text" id="cust_no" name="cust_no" lay-verify=""   class="layui-input">
		    </div>
		    <label class="layui-form-label">客户名称</label>
		    <div class="layui-input-block">
		      <input type="text" id="cust_name" name="cust_name" lay-verify=""   class="layui-input">
		    </div>
		    <label class="layui-form-label">地区</label>
			    <div class="layui-input-block">
			    <select id="cust_region" >
			      	<option value="-1">请选择</option>
			      </select>
		    <!-- <div class="layui-input-block">
		      <input type="text" id="cust_region" name="cust_region" lay-verify=""  class="layui-input">
		    </div> -->
	    </div>
	    <div class="layui-form-item">
		    <label class="layui-form-label">客户经理ID</label>
		    <div class="layui-input-block">
		      <input type="text" readonly="readonly" id="user_id" name="user_id" lay-verify=""  class="layui-input">
		    </div>
		     <label class="layui-form-label">客户经理名字</label>
		    <div class="layui-input-block">
		      <input type="text" readonly="readonly" id="cust_manager_name" name="cust_manager_name" lay-verify=""  class="layui-input">
		    </div>
		     <label class="layui-form-label">客户级别</label>
		    <div class="layui-input-block">
		      <select id="cust_level" >
		      	<option value="-1">请选择</option>
		      </select>
		    </div>
	    </div>
	    <div class="layui-form-item">
		    <label class="layui-form-label">客户满意度</label>
		    <div class="layui-input-block">
		    	<input type="hidden" id="test1v">
	     		 <div id="test1"></div>
		    </div>
		    <label class="layui-form-label">客户信用度</label>
		    <div class="layui-input-block">
		   		 <input type="hidden" id="test2v">
		     	 <div id="test2"></div>
		    </div>
	    </div>
	    <div class="layui-form-item">
		    <label class="layui-form-label">地址</label>
		    <div class="layui-input-block">
		      <input type="text" id="cust_addr" name="cust_addr" lay-verify="" class="layui-input">
		    </div>
		    <label class="layui-form-label">电话</label>
		    <div class="layui-input-block">
		      <input type="text" id="cust_tel" name="cust_tel" lay-verify=""  class="layui-input">
		    </div>
		    <label class="layui-form-label">网站</label>
		    <div class="layui-input-block">
		      <input type="text" id="cust_website" name="cust_website" lay-verify=""  class="layui-input">
		    </div>
	    </div>
	    <div class="layui-form-item">
		    <label class="layui-form-label">注册资金/元</label>
		    <div class="layui-input-block">
		      <input type="text" id="cust_bankroll" name="cust_bankroll" lay-verify="" class="layui-input">
		    </div>
		    <label class="layui-form-label">客户状态</label>
		    <div class="layui-input-block">
		      <select id="cust_status" name="cust_status">
		      	<option value="-1">请选择</option>
		      </select>
		    </div>
	    </div>
	</form>
</div>




<script type="text/html" id="barDemo">
 <a style="color:#01AAED"  class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="look"><i class="layui-icon layui-icon-tips" ></i>详情</a>
 <a style="color:#5FB878" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="edit"><i class="layui-icon"></i>编辑</a> 
 <a style="color:#FF5722" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="del"><i class="layui-icon"></i>删除</a>
</script>

</body>
</html>