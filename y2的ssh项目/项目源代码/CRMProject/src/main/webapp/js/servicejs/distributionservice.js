var path=document.getElementById("sj").value;//获得隐藏于传值
$(function(){
	  //点击弹出框加载下拉框
	$.ajax({
		url: path+'/service/serviceAction_listZd.action',
		dataType: 'json',
		data:{},
		type: 'post',
		success: function (data) {
			$.each(data, function (index, item) {
				$('#svr_type8').append(new Option(item.dict_item, item.dict_value));// 下拉菜单里添加元素
			});
			layui.form.render("select");
		}
	})
})
//管理
//执行渲染
layui.use(['table','layer','form',"upload"],function(){
		var $=layui.$;
		var table =layui.table;
		var layer=layui.layer;
		var form = layui.form;
		

		
		
		
	     /*展示数据表格  */
		table.render({
			  elem:'#test'//表格id
			,url:path+'/service/serviceAction_queryfp.action'//所对应调用的接口
			,method:'post'		//提交方式
		    ,cols:[[
		    	/*根据数据库的表格所对应的名称  */
		         {field:'svr_id',height:80, width:200, title: '服务编号', sort: true}
		         ,{field:'svr_cust_name',height:80, width:200, title: '客户名称'}
		         ,{field:'svr_title',height:80, width:200, title: '服务概要'}
		         ,{field:'svr_type_name',height:80, width:200, title: '服务类型'}
		         ,{field:'svr_create_name',height:80, width:200, title: '创建人'}
		         ,{field:'svr_create_date',height:80, width:200, title: '创建时间',sort: true}
		         ,{field: 'svr_status',
		       	  aligen:'center', templet: function(d){
		       		 if(d.svr_status == 2){
		       			 return '<span class="layui-badge layui-bg-blue">已分配</span>';
		       		 } 
		       		 else if (d.svr_status == 1) {
		                    return '<span class="layui-badge-rim">待分配</span>';
		                } 
		       	  },
		      	  title: '服务状态', width:110, sort: true}
		         ,{field:'right',height:80, width:400, title: '操作',
		        	templet: function(d){
			       		 if(d.svr_status == 2){
			       			 return '<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="details">查看详情</a>';
			       		 } 
			       		 else if (d.svr_status == 1) {
			                    return ' <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>分配</a>';
			                } 
			       	  }
		         }//操作栏
		    ]]
		         ,page:'true'//分页
		         , id: 'testReload'
		  });//表格展示
	      
			//上方菜单操作栏(查询、以及  增加  按钮  )
		 var $ = layui.$, active = {
		            //查询
		            reload: function () {
		                var svr_cust_name = $('#svr_cust_name8').val();
		                var svr_title = $('#svr_title8').val();
		                var svr_type = $('#svr_type8').val();
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
	    });//点击
		 $("#ref").click(function(){//刷新
				layer.msg('刷新成功', {
				      offset: '6px'
				    });
				$("#svr_cust_name8").val("");
				$("#svr_title8").val("");
				$("#svr_type8").find("option[value='-1']").prop("selected",true);
				form.render();
				 table.reload('testReload',{//重载表格
						  page:{
							  curr:1
						  }
					  })
			})
//		table表格 行内操作(编辑  以及  删除 按钮操作)  
	    table.on('tool(test)', function(obj){
	        var data = obj.data; //获得当前行数据
	        var urlex=document.getElementById("sj").value;
	        var tr=obj.tr//活动当前行tr 的  DOM对象
	        console.log(data);
	        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	        if(layEvent === 'edit'){ //编辑
	        	$('#svr_deal_id1').html("<option value='-1'>选择客户经理</option>");
	        	 $.ajax({
	 				url: path+'/service/serviceAction_selectfp.action',
	 				dataType: 'json',
	 				data:{},
	 				type: 'post',
	 				success: function (data) {
	 					$.each(data, function (index, item) {
	 						$('#svr_deal_id1').append(new Option(item.user_name, item.user_id));// 下拉菜单里添加元素
	 					});
	 					layui.form.render("select");
	 				}
	 			 })
	             layer.open({
	                 type: 1 //Page层类型
	                 ,skin: 'layui-layer-molv'
	                 ,area: ['1080px', '570px']
	                 ,title: ['服务分配','font-size:18px']
	                 ,btn: ['确定', '取消'] 
	                 ,shadeClose: true
	                 ,shade: 0 //遮罩透明度
	                 ,maxmin: true //允许全屏最小化
	                 ,content:$('#box2')  //弹窗id
	                 ,success:function(layero,index){//回显
	                	 $('#svr_deal_id1').val(data.svr_deal_id);
	                 },yes:function(index,layero){
	                	  		$.getJSON(urlex+'/service/serviceAction_editsvrStatus.action',{
	                	  			svr_id: data.svr_id,
	                	  			svr_due_id: $('#user_id').val(),
	                	  			svr_due_to: $('#user_name').val(),
	                	  			svr_deal_id: $('#svr_deal_id1').val(),
	                	  			svr_deal_name: $("#svr_deal_id1").find("option[value='"+$('#svr_deal_id1').val()+"']").prop("selected",true).text(),
	                		  	
	                	  },function(data){
	                	  //根据后台返回的参数，来进行判断
	                		  if(data>0){
	                			  layer.alert('分配成功',{icon:1,title:'提示'},function(i){
	                				  layer.close(i);
	                			  })
	                			  
	                		  }
	                		  else if(data==-1){
	     	         			 layer.alert('分配失败，请选择被分配人',{icon:1,title:'提示'},function(i){
	     	           				  	layer.close(i);
	     	           			  })
	     	         		  }
	                		  else{
	                			  layer.alert('分配失败',{icon:1,title:'提示'},function(i){
	                				  layer.close(i);
	                			  })
	                		  }
	                		 
	                		  layer.close(index);//关闭弹出层
                              $("#sal2")[0].reset()//重置form
                               table.reload('testReload',{//重载表格
                				  page:{
                					  curr:1
                				  }
                			  })
	                	  });
	                 }
	               
	             
	             });
	         }//编辑
	    
	         else if(layEvent === 'details'){ //查看详情
	             layer.open({
	                 type: 1 //Page层类型
	                 ,skin: 'layui-layer-molv'
	                 ,area: ['1080px', '570px']
	                 ,title: ['查看分配详情','font-size:18px']
	                 ,btn: ['确定', '取消'] 
	                 ,shadeClose: true
	                 ,shade: 0 //遮罩透明度
	                 ,maxmin: true //允许全屏最小化
	                 ,content:$('#box3')  //弹窗id
	                 ,success:function(layero,index){
		                 $('#svr_deal_name2').val(data.svr_deal_name);
		                 $('#svr_due_date2').val(data.svr_due_date);
	                 },yes:function(index,layero){
	                	
           			  layer.close(index);//关闭弹出层
	                	 $("#sal2")[0].reset()//重置form
           			  table.reload('box2',{//重载表格
           				  page:{
           					  curr:1
           				  }
                	  });
                 }
	             });
	         }//查看详情
	    });//table表编辑
});