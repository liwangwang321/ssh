<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.01 Transitional//EN" "http://www.w3.org/TR/html3/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>


<title>客户流失分析</title>
 
    <style>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%);
        }
    </style>


</head>
<body class="childrenBody" style="padding-top: 20px;  background:url">

 <input type="hidden" id="path" value="${pageContext.request.contextPath}">
 <%-- <input type="hidden" id="usr_id" value="${usr_id}">
 <input type="hidden" id="usr_name" value="${usr_name}"> --%>
 
   
<blockquote  class="layui-elem-quote" a>
<!-- 搜索框 -->
	<div class="layui-form">
	关键词:
	    <div  class="layui-form-item">
	        <label class="layui-form-label">联系人</label>
	        <div style="text-align:center" class="layui-input-inline">
	            <input type="text" id='lst_cust_name' lay-verify="required" placeholder="请输入客户名称" autocomplete="true"
	                   class="layui-input">
	        </div>
	         <label class="layui-form-label">联系人</label>
	        <div style="text-align:center" class="layui-input-inline">
	            <input type="text" id='lst_cust_manager_name' lay-verify="required" placeholder="请输入客户经理" autocomplete="true"
	                   class="layui-input">
	        </div>
	        <button class="layui-btn layui-btn-normal layui-btn-radius" data-type="reload"><i class="layui-icon">&#xe615;</i>查询</button>
	    	<button class="layui-btn layui-btn-normal layui-btn-radius" id="ref"><i class="layui-icon layui-icon-refresh"></i>刷新</button>
	    </div>
	</div>

</blockquote>
<!--显示数据的表格-->
<div class="demoTable" style="margin-top: 20px">
    <div class=layui-form>
        <table class="layui-table" id="lapsed" lay-filter="user"
               lay-data="{id: 'idTest'}">
        </table>
    </div>
</div>

<%-- <input type="hidden" name="chc_create_by" id="hid" class="layui-input laydate-disabled" value="${usr_name}" disabled>
 --%>
 
 
 
<script>
layui.use(['table','layer','form'],function(){
	var data=document.getElementById("path").value;
	var table =layui.table;
	var layer=layui.layer;
	var form = layui.form;
	var $ = layui.$;
	// 渲染表格
	 table.render({
         elem: '#lapsed',
         url:data+'/marketing/statAction_lapsedList.action',
         method:'post',	
         page: true,// 开启分页
         limit: 10,
         limits: [5, 10, 15],
         cellMinWidth: 80,
         cols:[[ //表头
             {field: 'lst_id', title: '编号ID', width:250, sort: true, fixed: 'left'}
             ,{field: 'lst_cust_name', title: '客户', width:250}
             ,{field: 'lst_cust_manager_name', title: '客户经理', width:250}
             ,{field: 'lst_reason', title: '流失原因', width:250} 
             ,{field: 'lst_lost_date', title: '流失时间',templet:'<div>{{ layui.util.toDateString(d.createDate, "yyyy-MM-dd HH:mm:ss") }}</div>',Width: 150}
 
           ]],
         id: 'lapsed',
     });
	
	 $("#ref").click(function(){//刷新
			layer.msg('刷新成功', {
			      offset: '6px'
			    });
			$('#chc_cust_name').val("");//根据文本id取值  客户名
	        $('#chc_title').val("");//根据文本id取值   客户概要
			 table.reload('testReload',{//重载表格
					  page:{
						  curr:1
					  }
				  })
	})
	
    active = {
            //查询
            reload: function () {
                var lst_cust_name = $('#lst_cust_name');//角色名
                var lst_cust_manager_name = $('#lst_cust_manager_name');//根据文本id取值  客户名
                
                // 执行重载
                table.reload('lapsed', {
                    page: {
                        curr: 1
                        // 重新从第 1 页开始
                    },
                    where: {
                        key: 'lst_cust_name',
                        lst_cust_name: lst_cust_name.val(),
                        
                        key: 'lst_cust_manager_name',
                        lst_cust_manager_name: lst_cust_manager_name.val(),
                        
                    }
                });
            }
    }
    $('.layui-form .layui-btn').on('click', function () {
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
	
	//增加绑定点击事件
	/* $("#addBtn").click(function(){
		layer.open({
			  type: 2
			 , title: '新增书籍类别'
			 ,skin: 'layui-layer-molv'   //自带皮肤
			 , area: ['380px', '270px']  //大小
		     , shade: 0  //遮罩层
		     , shadeClose: true //关闭弹窗
		     ,maxmin: true //允许全屏最小化
		     ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			 ,content:'add.jsp'  //跳转的界面
			});
	});
	    table.on('tool(test)', function(obj){
         var data = obj.data; //获得当前行数据
         var urlex=document.getElementById("sj").value;
         var tr=obj.tr//活动当前行tr 的  DOM对象
         console.log(data);
         var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
         if(layEvent === 'del'){ //删除
             layer.confirm('确定删除吗？',{title:'删除'}, function(index){
                 //向服务端发送删除指令og
                 $.getJSON(urlex+'/booktypeAction.action?methodName=deleteBookType',{booktypeid:data.booktypeid}, function(ret){
                         layer.close(index);
                         table.reload('test', {
                             page: {
                                 curr: 1
                                 // 重新从第 1 页开始
                             }
                         })
                     
                 });
                 layer.close(index);
             });
         } else if(layEvent === 'edit'){ //编辑
             layer.open({
                 type: 1 //Page层类型
                 ,skin: 'layui-layer-molv'
                 ,area: ['380px', '270px']
                 ,title: ['编辑书本类别信息','font-size:18px']
                 ,btn: ['确定', '取消'] 
                 ,shadeClose: true
                 ,shade: 0 //遮罩透明度
                 ,maxmin: true //允许全屏最小化
                 ,content:$('#box1')
                 ,success:function(layero,index){
	                 $('#booktypeid').val(data.booktypeid);
	                 $('#booktypename').val(data.booktypename);  
                 },yes:function(index,layero){
                	 $.ajaxSettings.async = false;
                	  $.getJSON(urlex+'/booktypeAction.action?methodName=updateBookType',{
                		  booktypeid: $('#booktypeid').val(),
                		  booktypename: $('#booktypename').val(),
                          booktypeid: data.booktypeid,
                	  },function(data){
                		  if(data>0){
                			  layer.alert('编辑成功',{icon:1,title:'提示'},function(i){
                				  layer.close(i);
                                  layer.close(index);//关闭弹出层
                                  $("#booktype")[0].reset()//重置form
                			  })
                			  table.reload('test',{
                				  page:{
                					  curr:1
                				  }
                			  })
                		  }
                	  });
                 }
               
             
             });
         }
      
	    });
	   */
	  
	
	  
	 
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	 
	
	
});


</script>
</body>

</html>


