<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html >
<head>
    <meta charset="UTF-8">
    <title>crm管理界面</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/index.css" media="all">
    
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath }/js/index.js"></script> 
   
</head>

<body >

<input type="hidden" id="roleid" value="${roleid }" >

<input type="hidden" id="msg" value="${msg }">


<input type="hidden" id="path" value="${pageContext.request.contextPath }" >
<div class="layui-layout layui-layout-admin " id="app">
    <div class="layui-header" >
        <div class="layui-logo"><img style="hight:100px;width:100px;"  src="${pageContext.request.contextPath }/img/p8.jpg">
        	crm管理系统
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right" >
		
		  <li class="layui-nav-item">
		    <a ><img src="${pageContext.request.contextPath }/img/t1.jpg" class="layui-nav-img">${user.user_name}</a>
		    <dl class="layui-nav-child">
		    <!--   <dd><a href="javascript:;">修改信息</a></dd>
		      <dd><a href="javascript:;">安全管理</a></dd> -->
		      <dd><a href="${pageContext.request.contextPath }/role/userAction_exit.action" >退出登录</a></dd>
		    </dl>
		  </li>
		</ul>
    </div>

    <!-- 左边tree页面 -->
    <div class="layui-side layui-bg-black">
		  <!-- layui-nav-itemed默认展开-->
		<!--   <div class="layui-side-scroll ">
            <div id="demo" ></div>
          </div>  -->
           <div class="layui-nav layui-nav-tree layui-inline"   style="margin-right: 10px;">
			  <div id="demo"></div>
			</div>
    </div>
   
    <!-- 选项卡要显示的地方 -->
    <div class="layui-body" >
    	<%-- <img alt="" src="${pageContext.request.contextPath }/img/bg1.png"> --%>
        <div class="layui-tab" lay-filter="tabs" lay-allowClose="true">
            <ul class="layui-tab-title">
				  <li class="layui-this" lay-id="11">旺旺大礼包首页</li>
            </ul>
            <div class="layui-tab-content"  style="height:80%;width: 100%" >
            	 <div class="layui-tab-item layui-show" style="width:100%;height:110%" >
					<img alt="" style="width:100%;height:100%" src="${pageContext.request.contextPath }/img/bg1.png">
				</div>
            </div>
        </div>
    </div>
    <div class="layui-footer" align="center" >
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>

</div>

<script src="${pageContext.request.contextPath }/layui/layui.all.js"></script>



</body>
</html>
