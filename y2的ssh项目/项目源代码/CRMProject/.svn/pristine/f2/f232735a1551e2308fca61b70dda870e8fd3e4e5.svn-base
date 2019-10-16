$(function(){
	var path = $("#path").val();
	 $.ajax({
			url: path+'/role/roleAction_roleList.action',
			dataType: 'json',
			data:{role_flag:1},	
			type: 'post',
			success: function (data) {
				console.log(data);
				$.each(data, function (index, item) {
					$('#sel_role_id').append(new Option(item.role_name, item.role_id));// 下拉菜单里添加元素
					$('#role_id').append(new Option(item.role_name, item.role_id));
					$('#role_id2').append(new Option(item.role_name, item.role_id));
				});
				layui.form.render("select");
			}
		 })
})
layui.use(['table','layer','form',"element"],function(){
	var $ = layui.$;
	var path = $("#path").val();
	var table = layui.table;
	var layer = layui.layer;
	var form = layui.form;
	var element = layui.element;
	
	
	/*展示数据表格  */
	table.render({
		 elem:'#test'//表格id
		,url:path+'/role/userAction_userList.action'//所对应调用的接口
		,method:'post'	//提交方式
		,totalRow: true //开启合计行
	    ,cols:[[
	    	/*根据数据库的表格所对应的名称  [{user_id:"1" ,user_name:"liye"},{user_id:"2" ,user_name:"liye"},{user_id:"3" ,user_name:"liye"}] list<Map<k,v>> */
	         {field:'user_id',height:80, width:100, title: '用户编号', sort: true}
	         ,{field:'user_name',height:80, width:200, title: '用户名称'}
	         ,{field:'user_password',height:80, width:300, title: '用户密码'}
	         ,{field:'role_name',height:80, width:400, title: '用户角色'}
	         ,{field:'user_flag',height:80,aligen:'center', width:200, title: '用户状态',templet: function(d){
	       		 if(d.user_flag == 0){
	       			 return '<input type="checkbox"  value="'+d.user_id+'" name="state"  lay-skin="switch" lay-filter="switchTest" title="开关" lay-text="可用|不可用">';
	       		 } 
	       		 else if (d.user_flag == 1) {
	                    return '<input type="checkbox" checked="true" value="'+d.user_id+'" name="state"  lay-skin="switch" lay-filter="switchTest" title="开关" lay-text="可用|不可用">';
	             } 
	       	  }
	         }
	         
	         
	         
	         ,{field:'right',height:80, width:400, title: '操作',templet: '#barDemo'}//操作栏
	    ]]
	         ,page:'true'//分页
	         , id: 'testReload'
	  });
	
	//搜索
	$("#sel").click(function(){
		 layer.msg('查询成功', {
		      offset: '6px'
		    });
		var user_name = $("#sel_user_name").val();
		var role_id  = $("#sel_role_id").val();
		var user_flag = $('#editFlag input[name="user_flag"]:checked ').val()
		
		table.reload('testReload',{
			method:"post",
			where:{
				'user_name':user_name,
				'role_id':role_id,
				'user_flag':user_flag
			},
			page:{
				curr:1
			}
		})
		
	})
	
	
	
	//增加用户
	$("#add").click(function(){
		layer.open({
			  type: 1, 
			  title:"新增",
			  area:['30%','40%'],
			  btn: ['确定', '取消'], 
			  content: $("#box1"),
			  yes:function(index,layero){
	          	   $.getJSON(path+'/role/userAction_addUser.action',{
	          		user_name: $('#user_name').val(),
	          		user_password: $('#user_password').val(),
	          		role_id: $('#role_id').val()
	          	  },function(data){
	          	  //根据后台返回的参数，来进行判断
	              		   if(data>0){
	              			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
	              				  	layer.close(i);
	              			  })
	              			
	              		   	} 
	              		   else{
	              			 layer.alert('增加失败',{icon:1,title:'提示'},function(i){
		           				  	layer.close(i);
		           			  })
	              		   }
	              		   	  layer.close(index);//关闭弹出层
	              			  $("#userRole")[0].reset()//重置form
	              			  
	              			  table.reload('testReload',{//重载表格
	          				  page:{
	          					  curr:1
	          				  }
	          			  })
	          	  }); 
	           }
			});   
		
		
		
	})
	$("#ref").click(function(){//刷新
		layer.msg('刷新成功', {
		      offset: '6px'
		    });
		$("#sel_user_name").val("");
		$("#sel_role_id").find("option[value='-1']").prop("selected",true);
		form.render();
		 table.reload('testReload',{//重载表格
				  page:{
					  curr:1
				  }
			  })
			  
			  
			  $('#sel_role_id').html("<option value='-1'>全部</option>");
			  $('#role_id').html("<option value='-1'>请选择</option>");
			  $('#role_id2').html("<option value='-1'>请选择</option>");
			   $.ajax({
				url: path+'/role/roleAction_roleList.action',
				dataType: 'json',
				data:{role_flag:1},	
				type: 'post',
				success: function (data) {
					console.log(data);
					$.each(data, function (index, item) {
						$('#sel_role_id').append(new Option(item.role_name, item.role_id));// 下拉菜单里添加元素
						$('#role_id').append(new Option(item.role_name, item.role_id));
						$('#role_id2').append(new Option(item.role_name, item.role_id));
					});
					layui.form.render("select");
				}
			 })
			  
			  
			  
			  
			  
			  
	})
	
	//监听指定开关
	  form.on('switch(switchTest)', function(data){
	    layer.msg('该用户已'+ (this.checked ? '被放开权限' : '被禁用'), {
	      offset: '6px'
	    });
	    var state = 0;
	    if(this.checked){
	    	state = 1;
	    }
	    
	    $.ajax({
			url: path+'/role/userAction_editUserState.action',
			dataType: 'json',
			data:{user_id:data.value,state:state},	
			type: 'post',
			success: function (data) {
				 if(data>0){
         			  console.log("成功");
	     		   }
	     		   else{
	     			  console.log("失败");
	     		   }
				
				
			}
		 })
	    
	    
//	    layer.tips('温馨提示：', data.othis)
	  });
	
	 
	//获取按钮
	  table.on('tool(test)', function(obj){
	  var data = obj.data; //获得当前行数据
	  var tr=obj.tr//活动当前行tr 的  DOM对象
	  if(obj.event === 'del'){ //删除
	      layer.confirm('确定删除吗？',{title:'删除'}, function(index){
	    	  layer.alert('删除成功',{icon:1,title:'提示'},function(i){
				  	layer.close(i);
			  })
	          //向服务端发送删除指令og
	          $.getJSON(path+'/role/userAction_delUser.action',{user_id:data.user_id}, function(ret){
	                  layer.close(index);//关闭弹窗
	                  table.reload('testReload',{//重载表格
          				  page:{
          					  curr:1
          				  }
          			  })
	          });
	          layer.close(index);
	      });
	  }else if(obj.event === 'edit'){ //编辑
		  
	      layer.open({
	          type: 1 //Page层类型
	          ,skin: 'layui-layer-molv'
	          ,area: ['30%', '50%']
	          ,title: ['编辑用户信息','font-size:18px']
	          ,btn: ['确定', '取消'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#box1")  //弹窗路径
	          ,success:function(layero,index){
	                $('#user_id').val(data.user_id);
	                $('#user_name').val(data.user_name); 
	                $('#user_password').val(data.user_password);
	                form.render();
	          },yes:function(index,layero){
	         	  $.getJSON(path+'/role/userAction_editUser.action',{
	                user_id: $('#user_id').val(),
	                user_name: $('#user_name').val(),
	           		user_password: $('#user_password').val(),
	           		role_id: $('#role_id').val()
	           	
	         	  },function(data){
	         	  //根据后台返回的参数，来进行判断
	         		  if(data>0){
              			  layer.alert('修改成功',{icon:1,title:'提示'},function(i){
              				  	layer.close(i);
              			  })
              			
              		   	}
	         		  else if(data==-1){
	         			 layer.alert('修改失败,修改的话必须选择一个角色进行赋值',{icon:1,title:'提示'},function(i){
	           				  	layer.close(i);
	           			  })
	         		  }
              		   else{
              			 layer.alert('修改失败',{icon:1,title:'提示'},function(i){
	           				  	layer.close(i);
	           			  })
              		   }
              		   	  layer.close(index);//关闭弹出层
              			  $("#userRole")[0].reset()//重置form
              			  
              			  table.reload('testReload',{//重载表格
	          				  page:{
	          					  curr:1
	          				  }
	          			  })
	         	  });
	          }
	      });
	  }
	  else if(obj.event =='editRole'){
		  layer.open({
	          type: 1 //Page层类型
	          ,skin: 'layui-layer-molv'
	          ,area: ['30%', '50%']
	          ,title: ['添加角色','font-size:18px']
	          ,btn: ['确定', '取消'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#box2")  //弹窗路径
	          ,success:function(layero,index){
	                $('#user_id2').val(data.user_id);
	                form.render();
	          },yes:function(index,layero){
	         	  $.getJSON(path+'/role/userAction_addUserRole.action',{
	                user_id: $('#user_id2').val(),
	           		role_id: $('#role_id2').val()
	           	
	         	  },function(data){
	         	  //根据后台返回的参数，来进行判断
	         		  if(data>0){
              			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
              				  	layer.close(i);
              			  })
              			
              		   	}
	         		  else if(data==-1){
	         			 layer.alert('增加失败,修改的话必须选择一个角色进行赋值',{icon:1,title:'提示'},function(i){
	           				  	layer.close(i);
	           			  })
	         		  }
	         		  else if(data==-2){
	         			 layer.alert('增加失败,原先的用户已有同样的角色了',{icon:1,title:'提示'},function(i){
	           				  	layer.close(i);
	           			  })
	         		  }
              		   else{
              			 layer.alert('增加失败',{icon:1,title:'提示'},function(i){
	           				  	layer.close(i);
	           			  })
              		   }
              		   	  layer.close(index);//关闭弹出层
              			  $("#userRole2")[0].reset()//重置form
              			  
              			  table.reload('testReload',{//重载表格
	          				  page:{
	          					  curr:1
	          				  }
	          			  })
	         	  });
	          }
	      });
		  
	  }
	

	  
	});
	
	
	
	
	
	
	
	
	
})

