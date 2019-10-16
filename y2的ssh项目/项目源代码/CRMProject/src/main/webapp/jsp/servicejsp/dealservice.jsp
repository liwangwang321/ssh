<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<title>服务处理</title>
</head>
<body class="child-body">
<div class="child-nav">
    <span class="layui-breadcrumb">
         <a>客户服务管理</a>
         <a><cite>服务处理</cite></a>
    </span>
</div>


<blockquote class="layui-elem-quote">
 <!--搜索维度-->
 
   <div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">客户名称</label>
        <div class="layui-input-inline">
            <input type="text" id='svr_cust_name5' name="svr_cust_name"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <label class="layui-form-label">概要</label>
        <div class="layui-input-inline">
            <input type="text" id='svr_title5' name="svr_title"
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
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
         
				 <br>
				<div class="layui-input-block" id="dx_status">
         		<label class="layui-form-label">服务状态</label>
         		<input type="radio" name="svr_status"  value="-1" title="全部"  checked>
	            <input type="radio" name="svr_status"  value="2" title="待处理" >
				<input type="radio" name="svr_status"  value="3" title="已处理" >
				</div>
      
    </div>
</div>


</blockquote>



<!--隐藏域传值  -->
<input type="hidden"  id="sj" value="${pageContext.request.contextPath}" >
<!--根据table id 来展示表格数据  -->
<table class="layui-hide" id="test" lay-filter="test"></table>
<!--查看处理结果弹出层  -->
	 <div class="site-text" style="margin: 5%; display: none" id="box3"  target="test123">
	    <form class="layui-form layui-form-pane" onsubmit="return false" id="sal3">
	        <div class="layui-form-item">
	           <label class="layui-form-label">服务编号</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input  text_add " vlaue="svr_id" readonly="readonly" id="svr_id3" name="svr_id"  ><br>
	            </div>
	            <label class="layui-form-label">服务类型</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_type3"  name=svr_type><br>
	            </div>
	            <label class="layui-form-label">服务概要</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_title3"  name=svr_title><br>
	            </div>
	             <label class="layui-form-label">客户</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_cust_name3"  name=svr_cust_name><br>
	            </div>
	             <label class="layui-form-label">服务请求</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_request3"  name="svr_request"><br>
	            </div>
	             <label class="layui-form-label">创建人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_create_name3"  name=svr_create_name><br>
	            </div>
	             <label class="layui-form-label">创建时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  readonly="readonly" id="svr_create_date3"  name=svr_create_date><br>
	            </div>
	             <label class="layui-form-label">指派人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_due_to3"  name=svr_due_to><br>
	            </div>
	             <label class="layui-form-label">指派时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  readonly="readonly" id="svr_due_date3"  name=svr_due_date><br>
	            </div>
	            <label class="layui-form-label">服务处理</label>
	            <div class="layui-input-inline">
	                <textarea class="layui-textarea" readonly="readonly" id="svr_deal3"  name=svr_deal></textarea><br>
	            </div>
	            <label class="layui-form-label">处理人</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input"  readonly="readonly" id="svr_deal_name3"  name=svr_deal_name><br>
	            </div>
	            <label class="layui-form-label">处理时间</label>
	            <div class="layui-input-inline">
	                <input type="text" class="layui-input" readonly="readonly"  id="svr_deal_date3"  name=svr_deal_date><br>
	            </div>
	        </div>
	    </form>
	</div>



 <!-- 处理弹出层  -->
	 <div class="site-text" style="margin: 5%; display: none" id="box4"  target="test123">
	    <form class="layui-form layui-form-pane"  onsubmit="return false" id="sal4">
	         <div class="layui-form-item">
	            <label class="layui-form-label">服务处理</label>
	            <div class="layui-input-block">
	                <textarea class="layui-textarea"  placeholder="请输入处理内容" id="svr_deal4"  name=svr_deal></textarea>
	            </div>
	        </div>
	    </form>
	</div> 
</body>

<script >


//管理
//执行渲染
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
});
layui.use(['table','layer','form'],function(){
	
	var table =layui.table;
	var layer=layui.layer;
	var form = layui.form;
	
     /*展示数据表格  */
	table.render({
		  elem:'#test'//表格id
		,url:path+'/service/serviceAction_query.action'//所对应调用的接口
		,method:'post'		//提交方式
	    ,cols:[[
	    	/*根据数据库的表格所对应的名称  */
	         {field:'svr_id',height:80, width:200, title: '服务编号', sort: true}
	         ,{field:'svr_cust_name',height:80, width:200, title: '客户名称'}
	         ,{field:'svr_title',height:80, width:200, title: '服务概要'}
	         ,{field:'svr_type_name',height:80, width:200, title: '服务类型'}
	         ,{field:'svr_create_name',height:80, width:200, title: '创建人'}
	         ,{field:'svr_create_date',height:80, width:200, title: '创建日期',templet:"<div>{{layui.util.toDateString(d.svr_create_date, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	         ,{field:'svr_due_to',height:80, width:150, title: '指派人'}
	         ,{field:'svr_due_date',height:80, width:200, title: '分配日期',templet:"<div>{{layui.util.toDateString(d.svr_due_date, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	         ,{field: 'svr_status',
		       	  aligen:'center', templet: function(d){
		       		 if(d.svr_status == 3){
		       		 		return '<span class="layui-badge layui-bg-blue">已处理</span>';
		       		 } 
		       		 if (d.svr_status == 2) {
		       			 return '<span class="layui-badge-rim">待处理</span>';
		                } 
		       	  },
		      	  title: '服务状态', width:110, sort: true}
	        
	         ,{field:'right',height:80, width:300, title: '操作',
		        	templet: function(d){
			       		 if(d.svr_status == 3){
			       			 return '<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="details1">查看详情</a> ';
			       		 } 
			       		 if (d.svr_status == 2) {
			                    return ' <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>处理</a>';
			                } 
			       	  } 
		         }//操作栏
	    ]]
	         ,page:'true'//分页
	         , id: 'testReload'
	});
	
	//上方菜单操作栏(查询  )
	
     var $ = layui.$, active = {
	            //查询
	            reload: function () {
	                var svr_cust_name = $('#svr_cust_name5').val();
	                var svr_title = $('#svr_title5').val();
	                var svr_type = $('#svr_type5').val();
	                var svr_status = $('#dx_status input[name="svr_status"]:checked ').val();
	                // 执行重载
	                table.reload('testReload', {
	                    page: {
	                        curr: 1
	                        // 重新从第 1 页开始
	                    },
	                    where: {
	                       
	                        svr_cust_name: svr_cust_name,
	                        
	                        
	                        svr_title:svr_title, 
	                       
	                        svr_type:svr_type ,
	                        
	                       
	                        svr_status:svr_status ,
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
	         if(layEvent === 'edit'){ //编辑处理
	             layer.open({
	                 type: 1 //Page层类型
	                 ,skin: 'layui-layer-molv'
	                 ,area: ['1080px', '570px']
	                 ,title: ['处理服务','font-size:18px']
	                 ,btn: ['确定', '取消'] 
	                 ,shadeClose: true
	                 ,shade: 0 //遮罩透明度
	                 ,maxmin: true //允许全屏最小化
	                 ,content:$('#box4')  //弹窗id
	                 ,success:function(layero,index){//回显
		                 
		                 $('#svr_deal4').val(data.svr_deal);
		                 
		                 
		                 
		                 
	                 },yes:function(index,layero){
	                	  		$.getJSON(urlex+'/service/serviceAction_editsvrStatus2.action',{
	                			svr_id: data.svr_id,
	                			svr_deal: $('#svr_deal4').val(),
	                		  	
	                	  },function(data){
	                	  //根据后台返回的参数，来进行判断
	                		   if(data>0){
	                			  layer.alert('处理成功',{icon:1,title:'提示'},function(i){
	                				  layer.close(i);
	                			  })
	                			  
	                		  }
	                		   else if(data==-1){
		     	         			 layer.alert('处理失败，请填写处理措施',{icon:1,title:'提示'},function(i){
		     	           				  	layer.close(i);
		     	           			  })
		     	         		  }
	                		  else{
	                			  layer.alert('处理失败',{icon:1,title:'提示'},function(i){
	                				  layer.close(i);
	                			  })
	                		  } 
	                		 
	                		  layer.close(index);//关闭弹出层
                             $("#sal4")[0].reset()//重置form
                             table.reload('testReload',{//重载表格
                  				  page:{
                  					  curr:1
                  				  }
                       	  });
	                	  });
	                 }
	               
	             
	             });
	         }
	         else if(layEvent === 'details1'){ //查看详情
	             layer.open({
	                 type: 1 //Page层类型
	                 ,skin: 'layui-layer-molv'
	                 ,area: ['1080px', '570px']
	                 ,title: ['服务处理详情','font-size:18px']
	                 ,btn: ['确定', '取消'] 
	                 ,shadeClose: true
	                 ,shade: 0 //遮罩透明度
	                 ,maxmin: true //允许全屏最小化
	                 ,content:$('#box3')  //弹窗id
	                 ,success:function(layero,index){
		                 $('#svr_id3').val(data.svr_id);
		                 $('#svr_type3').val(data.svr_type_name);
		                 $('#svr_title3').val(data.svr_title); 
		                 $('#svr_cust_name3').val(data.svr_cust_name);
		                 $('#svr_request3').val(data.svr_request);
		                 $('#svr_create_name3').val(data.svr_create_name);
		                 $('#svr_create_date3').val(data.svr_create_date);
		                 $('#svr_due_to3').val(data.svr_due_to);
		                 $('#svr_due_date3').val(data.svr_due_date);
		                 $('#svr_deal3').val(data.svr_deal);
		                 $('#svr_deal_name3').val(data.svr_deal_name);
		                 $('#svr_deal_date3').val(data.svr_deal_date);
		                 
	                 },yes:function(index,layero){
	                	
           			  layer.close(index);//关闭弹出层
	                	 $("#sal3")[0].reset()//重置form
           			  table.reload('box3',{//重载表格
           				  page:{
           					  curr:1
           				  }
                	  });
                 }
	             });
	         }//查看chuli详情
	    });//table表编辑
	  
});

</script>



</html>