



layui.use(['table','layer','form',"element"],function(){
	var $ = layui.$;
	var path = $("#path").val();
	var table = layui.table;
	var layer = layui.layer;
	var form = layui.form;
	var element = layui.element;
	

	var setting = {
	        view: {
	            dblClickExpand: false,//双击节点时，是否自动展开父节点的标识
	            showLine: true,//是否显示节点之间的连线
	            fontCss:{'color':'black','font-weight':'bold'},//字体样式函数
	            selectedMulti: true //设置是否允许同时选中多个节点
	        },
	        check:{
	            //chkboxType: { "Y": "ps", "N": "ps" },
	            chkboxType: { "Y": "", "N": "" },
	            chkStyle: "checkbox",//复选框类型
	            enable: true //每个节点上是否显示 CheckBox
	        },
	        data: {
	            simpleData: {//简单数据模式
	                enable:true,
	                idKey: "id",
	                pIdKey: "Pid",
	                rootPId: null
	            }
	        }
	    };
		
		
	
	
	/*展示数据表格  */
	table.render({
		 elem:'#test'//表格id
		,url:path+'/role/roleAction_roleListBean.action'//所对应调用的接口
		,method:'post'		//提交方式
		,totalRow: true //开启合计行
	    ,cols:[[
	    	/*根据数据库的表格所对应的名称  */
	         {field:'role_id',height:80, width:100, title: '角色编号', sort: true}
	         ,{field:'role_name',height:80, width:200, title: '角色名称'}
	         ,{field:'role_desc',height:80, width:700, title: '角色备注'}
	         ,{field:'role_count',height:80, width:300, title: '该角色下的用户数量',templet: function(d){
	        	 
	        	 return "总共<span class='layui-badge  layui-bg-blue' >"+d.role_count+"</span>位,现可用<span class='layui-badge  layui-bg-green'>"+d.role_th+"</span>位，被禁用了<span class='layui-badge'>"+d.role_fh+"</span>位"
	        	 
	         }}
	         ,{field:'role_flag',height:80,aligen:'center', width:200, title: '角色状态',templet: function(d){
	        	
	       		 if(d.role_flag == 0){
	       			 return '<input type="checkbox"  value="'+d.role_id+','+d.role_new+'" name="state"  lay-skin="switch" lay-filter="switchTest" title="开关" lay-text="可用|不可用">';
	       		 } 
	       		 else if (d.role_flag == 1) {
	                    return '<input type="checkbox" checked="true" value="'+d.role_id+','+d.role_new+'" name="state"  lay-skin="switch" lay-filter="switchTest" title="开关" lay-text="可用|不可用">';
	             } 
	       	  }
	         }
	         
	         
	         
	         ,{field:'right',height:80, width:300, title: '操作',templet: '#barDemo'}//操作栏
	    ]]
	         ,page:'true'//分页
	         , id: 'testReload'
	  });
	
	//搜索
	$("#sel").click(function(){
		 layer.msg('查询成功', {
		      offset: '6px'
		    });
		var role_name = $("#sel_role_name").val();
		var role_flag = $('#editFlag input[name="role_flag"]:checked ').val()
		table.reload('testReload',{
			method:"post",
			where:{
				'role_name':role_name,
				'role_flag':role_flag
			},
			page:{
				curr:1
			}
		})
		
	})
	
	
	
	//增加角色
	$("#add").click(function(){
		
		layer.open({
			  type: 1, 
			  title:"新增",
			  area:['30%','40%'],
			  btn: ['确定', '取消'], 
			  content: $("#box1"),
			  yes:function(index,layero){
	          	   $.getJSON(path+'/role/roleAction_addRole.action',{
		          	role_id: $('#role_id').val(),
		          	role_name: $('#role_name').val(),
		          	role_desc: $('#role_desc').val()
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
		$("#sel_role_name").val("");
		 table.reload('testReload',{//重载表格
				  page:{
					  curr:1
				  }
			  })
	})
	
	//监听指定开关
	  form.on('switch(switchTest)', function(data){
		var f = this.checked;
	    
	    var state = 0;
	    if(this.checked){
	    	state = 1;
	    }
	    var v =  data.value;
	    var role_id = v.substring(0,v.indexOf(","));
	    var shi = v.substring(v.indexOf(",")+1);
	    if(shi>1 || state ==0){
			  		layer.msg('该角色已'+ (f ? '被放开权限' : '被禁用'), {
				      offset: '6px'
				    });
	    	  
			  	    $.ajax({
						url: path+'/role/roleAction_editRoleState.action',
						dataType: 'json',
						data:{role_id:role_id,state:state},	
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
			  
	    }
	    else{
	    	layer.confirm('打扰一下，因为已检测到你这个角色尚未授权，是否还要继续执行，这样可能会影响接下来的操作哦',{title:'温馨提示'}, function(index){
				  
		  		layer.msg('该角色已'+ (f ? '被放开权限' : '被禁用'), {
			      offset: '6px'
			    });
    	  
		  		 $.ajax({
						url: path+'/role/roleAction_editRoleState.action',
						dataType: 'json',
						data:{role_id:role_id,state:state},	
						type: 'post',
						success: function (data) {
							 if(data>0){
			         			  console.log("成功");
				     		   }
				     		   else{
				     			  console.log("失败");
				     		   }
							 table.reload('testReload',{//重载表格
				 				  page:{
				 					  curr:1
				 				  }
				 			  })
							
						}
					 })
					
		  
		  		layer.close(index);
	    	});
	    	 table.reload('testReload',{//重载表格
				  page:{
					  curr:1
				  }
			  })
	    	
	    	
	    }
	   
	    

	    
	    
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
	          $.getJSON(path+'/role/roleAction_delRole.action',{role_id:data.role_id}, function(ret){
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
	          ,title: ['编辑角色信息','font-size:18px']
	          ,btn: ['确定', '取消'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#box1")  //弹窗路径
	          ,success:function(layero,index){
	        		$('#role_id').val(data.role_id);
		            $('#role_name').val(data.role_name);
		          	$('#role_desc').val(data.role_desc);
		          	$('#role_id').prop("readonly","readonly");
	                form.render();
	          },yes:function(index,layero){
	         	  $.getJSON(path+'/role/roleAction_editRole.action',{
	         			role_id: $('#role_id').val(),
			          	role_name: $('#role_name').val(),
			          	role_desc: $('#role_desc').val()
	           	
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
		  
		   $.ajax({
				url: path+'/role/roleAction_ztree.action',
				dataType: 'json',
				data:{role_id:data.role_id},	
				type: 'post',
				success: function (d) {
					$.fn.zTree.init($("#treeDemo"), setting, d);
					
					
				}
			 })
			 
			 
		  layer.open({
	          type: 1 //Page层类型
	          ,skin: 'layui-layer-molv'
	          ,area: ['30%', '50%']
	          ,title: ['角色授权','font-size:18px']
	          ,btn: ['确定', '取消'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#box2")  //弹窗路径
	          ,success:function(layero,index){
	                $('#role_id2').val(data.role_name);
	                form.render();
	                
	                
	          },yes:function(index,layero){
	        	  
	        	  var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	        	   var node =  zTree.getCheckedNodes(true);
	        	   var id = "";
	        	   $.each(node,function(i,item){
	        		   id+=","+item.id
	        	   });
	        	   id=id.substring(1);
	         	  $.getJSON(path+'/role/roleAction_editRoleMenuState.action',{
	         		menu_id:id,
	           		role_id: data.role_id
	           	
	         	  },function(data){
	         	  //根据后台返回的参数，来进行判断
	         		  if(data>0){
              			  layer.alert('修改成功',{icon:1,title:'提示'},function(i){
              				  	layer.close(i);
              			  })
              			
              		   	}
	         		  else if(data==-1){
	         			 layer.alert('修改失败,不能不选',{icon:1,title:'提示'},function(i){
	           				  	layer.close(i);
	           			  })
	         		  }
	         		 
              		   else{
              			 layer.alert('修改失败',{icon:1,title:'提示'},function(i){
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

