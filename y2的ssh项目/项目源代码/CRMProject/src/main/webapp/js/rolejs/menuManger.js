	layui.config({
    	base: 'layui/'
	}).extend({
	    treetable: 'treetable-lay/treetable'
	}).use(['layer', 'table', 'treetable'], function () {
	    var treetable = layui.treetable;
	    var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var treetable = layui.treetable;
	    
	    var path=$("#lj").val();
	    var renderTable =   function () {//树桩表格参考文档：https://gitee.com/whvse/treetable-lay
            layer.load(2);
	    	
	    	treetable.render({
	    	method:"post",
            treeColIndex: 1,//树形图标显示在第几列
            treeSpid: -1,//最上级的父级id
            treeIdName: 'menu_id',//id字段的名称
            treePidName: 'menu_pid',//pid字段的名称，父级菜单id
            treeDefaultClose: false,//是否默认折叠
            treeLinkage: false,//父级展开时是否自动展开所有子级
            elem: '#treetable',//表格id
            url: path+'/role/menuAction_menuList.action', 
            page: false,
            cols: [[
            	{type:'checkbox'},
                {field: 'menu_name', title: '菜单名字'},
                {field: 'menu_id', title: 'id'},
                {field: 'menu_url', title: '资源路径'},
                {field: 'menu_pid', title: 'pid'},
                {templet: function(d){
                	if(d.menu_type==1){
                		return '<a class="operation" lay-event="edit" title="编辑"><i class="layui-icon layui-icon-edit"></i></a><a class="operation" lay-event="del"  title="删除"><i class="layui-icon layui-icon-delete" ></i></a>'
                	}
                	else if(d.menu_pid==-1){
                		return ""
                	}
                	else{
                		return '<a class="operation" lay-event="del"  title="删除"><i class="layui-icon layui-icon-delete" ></i></a>'
                	}
                	
                }, title: '操作'}
            ]],
            done: function () {
                layer.closeAll('loading');
            }
        });  
	    }
	    renderTable();
	     $("#zk").click(function(){
	    	 treetable.expandAll("#treetable");
	     })
	     
	      $("#zd").click(function(){
	    	  treetable.foldAll("#treetable");
	     })
	      $("#add").click(function(){
	    	  layer.open({
				  type: 1, 
				  title:"增加节点",
				  area:['30%','40%'],
				  btn: ['确定', '取消'], 
				  content: $("#box1"),
				  yes:function(index,layero){
		          	   $.getJSON(path+'/role/menuAction_addMenu.action',{
			          	menu_id: $('#menu_id').val(),
			          	menu_pid: $('#menu_pid').val(),
			          	menu_name: $('#menu_name').val(),
			          	menu_url:$('#menu_url').val(),
			          	menu_type:$('#menuT input[name = "menu_type"]:checked').val()
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
		              			  $("#menu")[0].reset()//重置form
		              			renderTable();
		              			  
		              			 
		          	  }); 
		           }
				});   
	    	  
	     })
	     
	      $("#refreah").click(function(){
	    	  renderTable();
	     })
	     //监听工具条
        table.on('tool(treeTable)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
				if (layEvent === 'del') {
					
					var msg = "";
					if(data.menu_type==1){
						msg = "确定删除吗？";
					}
					else{
						msg = "这个是一个父节点，如果删除，那么下面的子节点同样会被删除，是否还要删除？";
					}
					layer.confirm(msg,{title:'删除'}, function(index){
						layer.alert('删除成功',{icon:1,title:'提示'},function(i){
							layer.close(i);
						})
						//向服务端发送删除指令og
						$.getJSON(path+'/role/menuAction_delMenu.action',{
							menu_id:data.menu_id,
							menu_type:data.menu_type
						}, function(ret){
							layer.close(index);//关闭弹窗
							renderTable();//重载表格
						});
						layer.close(index);
					});
					
	            } else if (layEvent === 'edit') {
	            	 layer.open({
	   				  type: 1
	   				  ,skin: 'layui-layer-molv'
	   		          ,area: ['30%', '50%']
	   		          ,title: ['编辑菜单','font-size:18px']
	   		          ,btn: ['确定', '取消'] 
	   		          ,shadeClose: true
	   		          ,shade: 0 //遮罩透明度
	   		          ,maxmin: true //允许全屏最小化
	   		          ,content:$("#box2")  //弹窗路径
	   		          ,success:function(layero,index){
	   		        	  $('#menu_id2').val(data.menu_id);
	   		        	  $('#menu_name2').val(data.menu_name); 
	   		        	  $('#menu_url2').val(data.menu_url);
	   		          },
	   				  yes:function(index,layero){
	   		          	   $.getJSON(path+'/role/menuAction_editMenu.action',{
	   			          	menu_id: $('#menu_id2').val(),
	   			          	menu_name: $('#menu_name2').val(),
	   			          	menu_url:$('#menu_url2').val()
	   		          	  },function(data){
	   		          		
	   		          	  //根据后台返回的参数，来进行判断
	   		              		   if(data>0){
	   		              			  layer.alert('修改成功',{icon:1,title:'提示'},function(i){
	   		              				  	layer.close(i);
	   		              			  })
	   		              			
	   		              		   	} 
	   		              		   else{
	   		              			 layer.alert('修改失败',{icon:1,title:'提示'},function(i){
	   			           				  	layer.close(i);
	   			           			  })
	   		              		   }
	   		              		   	  layer.close(index);//关闭弹出层
	   		              			  $("#menu2")[0].reset()//重置form
	   		              			renderTable();
	   		              			 
	   		          	  }); 
	   		           }
	   				});   
	            }
        });

	     
	     

	});
