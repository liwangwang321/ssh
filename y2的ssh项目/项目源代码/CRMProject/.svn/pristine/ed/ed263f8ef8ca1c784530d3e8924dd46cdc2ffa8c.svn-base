<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<title>服务归档</title>
</head>
<body class="child-body">
<div class="child-nav">
    <span class="layui-breadcrumb">
         <a>客户服务管理</a>
         <a><cite>服务归档</cite></a>
    </span>
</div>


<blockquote class="layui-elem-quote">
 <!--搜索维度-->
   <div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">客户名称</label>
        <div class="layui-input-inline">
            <input type="text" id='svr_cust_name5' name="svr_cust_name"
                   lay-verify="required" placeholder="请输入关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">概要</label>
        <div class="layui-input-inline">
            <input type="text" id='svr_title5' name="svr_title"
                   lay-verify="required" placeholder="请输入关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">服务类型</label>
	            <div class="layui-input-inline" lay-filter="svr">
					<select name="svr_type" id="svr_type5">
					<option value="-1">全部服务类型</option>
					</select>
				</div>
          <button class="layui-btn layui-btn-normal layui-btn-radius" data-type="reload"><i class="layui-icon">&#xe615;</i>查询</button>
          <button class="layui-btn layui-btn-normal layui-btn-radius" id="ref">刷新</button>
    </div>
</div>


</blockquote>



<!--隐藏域传值  -->
<input type="hidden"  id="sj" value="${pageContext.request.contextPath}" >
<!--根据table id 来展示表格数据  -->
<table class="layui-hide" id="test" lay-filter="test"></table>

<!--按钮菜单-->
    <script type="text/html" id="lineBtns">
        <a class="layui-btn layui-btn-green
 layui-btn-xs" lay-event="details">归档信息</a>
    </script>



<!--查看详情弹出层  -->
	 <div class="site-text" style="margin: 5%; display: none" id="box1"  target="test123">
	    <form class="layui-form layui-form-pane" onsubmit="return false" id="sal">
	        <div class="layui-form-item">
	           <label class="layui-form-label">服务编号</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input  text_add " readonly="readonly" vlaue="svr_id"  id="svr_id1" name="svr_id"  ><br>
	            </div>

				<label class="layui-form-label">服务类型</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_type1"  name=svr_type><br>
	            </div>
	            <label class="layui-form-label">服务概要</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_title1"  name=svr_title><br>
	            </div>
	             <label class="layui-form-label">客户</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_cust_name1"  name=svr_cust_name><br>
	            </div>
	             <label class="layui-form-label">状态</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_status1"  name=svr_status><br>
	            </div>
	             <label class="layui-form-label">服务请求</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_request1"  name="svr_request"><br>
	            </div>
	             <label class="layui-form-label">创建人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly" id="svr_create_name1"  name=svr_create_name><br>
	            </div>
	             <label class="layui-form-label">创建时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_create_date1"  name=svr_create_date><br>
	            </div>
	             <label class="layui-form-label">指派人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  readonly="readonly" id="svr_due_to1"  name=svr_due_to><br>
	            </div>
	             <label class="layui-form-label">分派时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  readonly="readonly" id="svr_due_date1"  name=svr_due_date>
	            </div>
	            <br>
	            <label class="layui-form-label">服务处理</label>
	            <div class="layui-input-inline">
	                <textarea class="layui-textarea" readonly="readonly" id="svr_deal1"  name=svr_deal></textarea><br>
	            </div>
	            <label class="layui-form-label">处理人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_deal_name1"  name=svr_deal_name><br>
	            </div>
	            <label class="layui-form-label">处理时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  readonly="readonly" id="svr_deal_date1"  name=svr_deal_date><br>
	            </div>
	          	<br><br>
	            <label class="layui-form-label">处理结果</label>
	            <div class="layui-input-inline">
	                <textarea class="layui-textarea" readonly="readonly" id="svr_result1"  name=svr_result></textarea><br>
	            </div>
	            <label class="layui-form-label">满意度</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_satisfy1"  name=svr_satisfy><br>
	            </div>
	        </div>
	    </form>
	</div> 



</body>

<script >
var path = document.getElementById("sj").value;
$(function () {
//	绑定下拉框
	  $.ajax({
			url: path+'/service/serviceAction_listZd.action',
			dataType: 'json',
			data:{},
			type: 'post',
			success: function (data) {
				$.each(data, function (index, item) {
					$('#svr_type5').append(new Option(item.dict_item, item.dict_value));// 下拉菜单里添加元素
				});
				layui.form.render("select");
			}
		})
})
//管理
//执行渲染
layui.use(['table','layer','form'],function(){
	var table =layui.table;
	var layer=layui.layer;
	var form = layui.form;
     /*展示数据表格  */
	table.render({
		  elem:'#test'//表格id
		,url:path+'/service/serviceAction_querygd.action'//所对应调用的接口
		,method:'post'		//提交方式
	    ,cols:[[
	    	/*根据数据库的表格所对应的名称  */
	         {field:'svr_id',height:80, width:200, title: '服务编号', sort: true}
	         ,{field:'svr_cust_name',height:80, width:200, title: '客户名称'}
	         ,{field:'svr_title',height:80, width:200, title: '概要'}
	         ,{field:'svr_type_name',height:80, width:200, title: '服务类型'}
	         ,{field:'svr_create_name',height:80, width:200, title: '创建人'}
	         ,{field:'svr_create_date',height:80, width:200, title: '创建日期',templet:"<div>{{layui.util.toDateString(d.svr_create_date, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	         ,{field:'svr_due_to',height:80, width:200, title: '指派人'}
	         ,{field:'right',height:80, width:400, title: '操作', toolbar:'#lineBtns'}//操作栏
	    ]]
	         ,page:'true'//分页
	         , id: 'testReload'
	});

	//上方菜单操作栏(查询  )
	
     var $ = layui.$, active = {
	            //查询
	            reload: function () {
	                var svr_cust_name = $('#svr_cust_name5');
	                var svr_title = $('#svr_title5');
	                var svr_type = $('#svr_type5');
	                // 执行重载
	                table.reload('testReload', {
	                    page: {
	                        curr: 1
	                        // 重新从第 1 页开始
	                    },
	                    where: {
	                        key: 'svr_cust_name5',
	                        svr_cust_name: svr_cust_name.val(),
	                        
	                        key: 'svr_title5',
	                        svr_title: svr_title.val(),
	                        key: 'svr_type5',
	                        svr_type: svr_type.val(),
	                        
	                    }
	                })
	              
	            }
	}

     $('.layui-form .layui-btn').on('click', function () {
	        var type = $(this).data('type');
	        active[type] ? active[type].call(this) : '';
	    });
     $("#ref").click(function(){//刷新
			layer.msg('刷新成功', {
			      offset: '6px'
			    });
			$("#svr_cust_name5").val("");
			$("#svr_title5").val("");
			$("#svr_type5").find("option[value='-1']").prop("selected",true);
			form.render();
			 table.reload('testReload',{//重载表格
					  page:{
						  curr:1
					  }
				  })
		})
	/*表格 行内操作(编辑  以及  删除 ,详情按钮操作)  */
	    table.on('tool(test)', function(obj){
         var data = obj.data; //获得当前行数据
         var urlex=document.getElementById("sj").value;
         var tr=obj.tr//活动当前行tr 的  DOM对象
         console.log(data);
         var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
          if(layEvent === 'details'){ //查看详情 
             layer.open({
                 type: 1 //Page层类型
                 ,skin: 'layui-layer-molv'
                 ,area: ['1080px', '570px']
                 ,title: ['归档服务单据','font-size:18px']
                 ,btn: ['确定', '取消'] 
                 ,shadeClose: true
                 ,shade: 0 //遮罩透明度
                 ,maxmin: true //允许全屏最小化
                 ,content:$('#box1')  //弹窗id
                 ,success:function(layero,index){
	                $('#svr_id1').val(data.svr_id);//主键id
         			$('#svr_type1').val(data.svr_type_name);//机会来源
         			$('#svr_title1').val(data.svr_title); //客户名称
       			    $('#svr_cust_name1').val(data.svr_cust_name);//概要
         			$('#svr_status1').val("已归档");//成功几率
         			$('#svr_request1').val(data.svr_request);//联系人
         			$('#svr_create_name1').val(data.svr_create_name);//联系电话
         			$('#svr_create_date1').val(data.svr_create_date);//机会描述
         			$('#svr_due_to1').val(data.svr_due_to);//创建人id
         			$('#svr_due_date1').val(data.svr_due_date);//创建人名字
        	 		$('#svr_deal1').val(data.svr_deal);//指派给某名字
         			$('#svr_deal_name1').val(data.svr_deal_name);//指派时的当前时间
         			$('#svr_deal_date1').val(data.svr_deal_date);//状态
         			$('#svr_result1').val(data.svr_result);//状态
         			$('#svr_satisfy1').val(data.svr_satisfy);//状态
                 },yes:function(index,layero){
                	
       			  layer.close(index);//关闭弹出层
                	 $("#sal")[0].reset()//重置form
        			  table.reload('box1',{//重载表格
       				  page:{
       					  curr:1
       				  }
            	  });
             }
             });
         }//查看详情
	  
});

});
</script>



</html>