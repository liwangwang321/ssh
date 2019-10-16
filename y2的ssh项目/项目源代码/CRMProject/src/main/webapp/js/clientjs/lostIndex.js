layui.use(['table','layer','form','rate','util'], function(){
  var $ = layui.$;
  var path = $("#path").val();
  var table = layui.table;
  var layer = layui.layer;
  var form = layui.form;
  var rate = layui.rate;
  var util = layui.util;
  
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 520
    ,url: path+'/client/lostAction_list.action' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
       {field: 'lst_id', title: '编号', width:80, sort: true, fixed: 'left'}
      ,{field: 'lst_cust_name', title: '客户名称', width:130}
      ,{field: 'lst_cust_manager_name', title: '客户经理', width:130, sort: true}
      ,{field: 'lst_last_order_date', title: '上次下单时间', width: 175, sort: true,templet: function(d){
    	  return util.toDateString(parseInt(d.lst_last_order_date),'yyyy-MM-dd HH:mm:ss');
      }}
      ,{field: 'lst_lost_date', title: '确认流失时间', width: 175, sort: true,templet: function(d){
    	  if(d.lst_lost_date!=null){
    		  return util.toDateString(parseInt(d.lst_lost_date),'yyyy-MM-dd HH:mm:ss');
    	  }
    	  else{
    		  return ''
    	  }
      }}
      ,{field: 'lst_status', title: '状态', width: 115, sort: true,templet: function(d){
		  if(d.lst_status == 1){
			  return '<button class="layui-btn layui-btn-sm layui-btn-warm">流失预警</button>'
		  }
		  if(d.lst_status == 2){
			  return '<button class="layui-btn layui-btn-sm layui-btn-normal">暂缓流失中</button>'
		  }
		  if(d.lst_status == 3){
			  return '<button class="layui-btn layui-btn-sm layui-btn-disabled">已流失</button>'
		  }
      }}
      ,{field: 'reight', title: '操作', width: 185, templet: function(d){
    	  if(d.lst_status == 1){
			  return '<button class="layui-btn layui-btn-sm" lay-event="zhls">暂缓流失</button>'
		  }
		  if(d.lst_status == 2){
			  return '<button class="layui-btn layui-btn-sm" lay-event="zhls">暂缓流失</button> <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="qrls">确认流失</button>'
		  }
		  if(d.lst_status == 3){
			  return '<button class="layui-btn layui-btn-sm layui-btn-primary" lay-event="scjl">删除记录</button>'
		  }
      }}
    ]]
  });
  
  
  

  

  
	 //搜索按钮
  
  $('#cx').on('click', function () {
	    // 搜索条件
	    var bh = $('#cxbh').val();
	    var name = $('#cxmc').val();
	    var khjl = $('#cxkhjl').val();
	    table.reload('demo', {
	        method: 'post'
	        , where: {
	            'lst_id': bh,
	            'lst_cust_name':name,
	            'lst_cust_manager_name':khjl
	        }
	        , page: {
	            curr: 1
	        }
	    });
	});
  
  
  $("#ref").click(function(){//刷新
		layer.msg('刷新成功', {
		      offset: '6px'
		    });
		$("#cxbh").val("");
		$("#cxmc").val("");
		$("#cxkhjl").val("");
		 table.reload('demo',{//重载表格
				  page:{
					  curr:1
				  }
			  })
	});
  
  
//表单绑定操作
  
  table.on('tool(tab1)', function(obj){
	
	  var data = obj.data; //获得当前行数据
	  var tr=obj.tr//活动当前行tr 的  DOM对象
	  if(obj.event === 'scjl'){ // 删除记录
	      layer.confirm('确定删除吗？',{title:'删除'}, function(index){
	          //向服务端发送删除指令og
	          $.getJSON(path+'/client/lostAction_del.action',{lst_id:data.lst_id}, function(ret){
	                  layer.close(index);//关闭弹窗
	                  table.reload('demo', {//重载表格
	                  })
	          });
	          layer.close(index);
	      });
	  }else if(obj.event === 'zhls'){ // 暂缓流失
	      layer.open({
	          type: 1 //Page层类型
	          ,skin: 'layui-layer-molv'
	          ,area: ['70%', '70%']
	          ,title: ['暂缓流失','font-size:18px']
	          ,btn: ['追加', '返回'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#zhlstk")  //弹窗路径
	          ,success:function(layero,index){
	        	  $("#zhlst_id").val(data.lst_id);
	        	  $("#zhlst_cust_name").val(data.lst_cust_name);
	        	  $("#zhlst_cust_manager_name").val(data.lst_cust_manager_name);
	        	  $("#zhlst_last_order_date").val(util.toDateString(parseInt(data.lst_last_order_date),'yyyy-MM-dd HH:mm:ss'));
	        	  $("#zhlst_delay").val(data.lst_delay);
	          },yes:function(index,layero){
	        	  var zjname =  $("#zj").val() ;
	        	  //执行添加方法
	              $.getJSON(path+"/client/lostAction_edit.action", {
	            	 lst_id: $("#zhlst_id").val(),
	          		 zj:zjname,
	              }, function (data) {
	                	  //根据后台返回的参数，来进行判断
	          		  if(data>0){
	          			  layer.alert('追加成功',{icon:1,title:'提示'},function(i){
	          				$("#zhlst_delay").val($("#zhlst_delay").val()+"\n"+zjname);
	          				$("#zj").val("");
	          				layer.close(i);
	          			  })
	          		  }
	          		  else{
	          			  layer.alert('追加失败',{icon:1,title:'提示'},function(i){
	          				layer.close(i);
	          			  })
	          		  }
	          		  	 form.render();
	                     table.reload('demo',{//重载表格
	        			  page:{
	        				  curr:1
	        			  }
	        		  })
	          	  });
	          }
	      });
	  }else if(obj.event === 'qrls'){ 		//确认流失
		  
		  layer.open({
	          type: 1 //Page层类型
	          ,skin: 'layui-layer-molv'
	          ,area: ['70%', '70%']
	          ,title: ['编辑流失信息','font-size:18px']
	          ,btn: ['确认流失', '取消'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#qrlstk")  //弹窗路径
	          ,success:function(layero,index){
	        	  $("#zhlst_id1").val(data.lst_id);
	        	  $("#zhlst_cust_name1").val(data.lst_cust_name);
	        	  $("#zhlst_cust_manager_name1").val(data.lst_cust_manager_name);
	        	  $("#zhlst_last_order_date1").val(util.toDateString(parseInt(data.lst_last_order_date),'yyyy-MM-dd HH:mm:ss'));
	        	  $("#zhlst_delay1").val(data.lst_delay);
	          },yes:function(index,layero){
	        	  
	        	  $.getJSON(path+'/client/lostAction_edit.action',{
	        		  lst_id:$("#zhlst_id1").val(),
	        		  lst_reason:$("#lst_reason1").val()
	        	  
	        	  }, function(dat){
	        		  if(dat>0){
	        			  layer.alert('已流失',{icon:1,title:'提示'},function(i){
        	  				layer.close(i);
        	  			  })
        	  		  }
        	  		  else{
        	  			  layer.alert('流失失败',{icon:1,title:'提示'},function(i){
        	  				layer.close(i);
        	  			  })
        	  		  }
	                  table.reload('demo',{//重载表格
	                	  page:{
	                		  curr:1
	                	  }
	                  })
	                  layer.close(index);//关闭弹窗
	          });
	        	  
	         	  
	         	  
	          }
	      });
	  }
});

	  
  
//追加按钮
  
  $('#zjbt').on('click', function () {
	 var zjname =  $("#zj").val() ;
	  //执行添加方法
      $.getJSON(path+"/client/lostAction_edit.action", {
    	 lst_id: $("#zhlst_id").val(),
  		 zj:zjname,
      }, function (data) {
        	  //根据后台返回的参数，来进行判断
  		  if(data>0){
  			  layer.alert('追加成功',{icon:1,title:'提示'},function(i){
  				$("#zhlst_delay").val($("#zhlst_delay").val()+"\n"+zjname);
  				$("#zj").val("");
  				layer.close(i);
  			  })
  		  }
  		  else{
  			  layer.alert('追加失败',{icon:1,title:'提示'},function(i){
  				layer.close(i);
  			  })
  		  }
  		  	 form.render();
             table.reload('demo',{//重载表格
			  page:{
				  curr:1
			  }
		  })
  	  });
	});
	  
  
  
  
  
	  
  
});

