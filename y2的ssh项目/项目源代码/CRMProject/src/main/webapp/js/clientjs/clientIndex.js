





layui.use(['table','layer','form','rate','util'], function(){
  var $ = layui.$;
  var path = $("#path").val();
  var table = layui.table;
  var layer = layui.layer;
  var form = layui.form;
  var rate = layui.rate;
  var util = layui.util;
  
  
  
  
  
	//获取客户状态
  
  $.ajax({
		url: path+'/data/selectAction_list.action',
		dataType: 'json',
		data:{},
		type: 'post',
		async:true,
		success: function (a) {
	  $.each(a, function (index, item) {
		  if(item.dict_type==1){ //地区
			  $('#cust_region').append(new Option(item.dict_item,item.dict_value));// 下拉菜单里添加元素
		  }
		  else if(item.dict_type==5){  //状态
			  $('#cust_status').append(new Option(item.dict_item,item.dict_value));// 下拉菜单里添加元素
		  }
		  else if(item.dict_type==3){  //级别
			  $('#cust_level').append(new Option(item.dict_item,item.dict_value));
		  }
		  form.render();
	  })
		}
  });
  
  
  //第一个实例
  
  
  
  table.render({
    elem: '#demo'
    ,height: 520
    ,url: path+'/client/clientAction_list.action' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'cust_no', title: '客户编号', width:125,align:'center', sort: true, fixed: 'left'}
      ,{field: 'cust_name', title: '客户名称', align:'center',width:150}
      ,{field: 'cust_manager_name', title: '客户经理',align:'center', width: 115, sort: true}
      ,{field: 'cust_region', title: '地区', width:100, align:'center',sort: true}
      ,{field: 'cust_addr', title: '地址', width: 235, align:'center',sort: true}
      ,{field: 'cust_tel', title: '电话', width: 135,align:'center', sort: true}
      ,{field: 'cust_bankroll', title: '注册资金',align:'center', width: 115, sort: true}
      ,{field: 'right', title: '操作', width: 230, align:'center',toolbar:"#barDemo"}
    ]]
  });
  
  

  $("#ref").click(function(){//刷新
		layer.msg('刷新成功', {
		      offset: '6px'
		    });
		$("#cxcust_id").val("");
		$("#cxcust_name").val("");
		$("#cxcust_region").val("");
		 table.reload('demo',{//重载表格
				  page:{
					  curr:1
				  }
			  })
	})
  
  
//获取按钮
	  table.on('tool(test)', function(obj){
	  var data = obj.data; //获得当前行数据
	  var tr=obj.tr//活动当前行tr 的  DOM对象
	  if(obj.event === 'del'){ //删除
	      layer.confirm('确定删除吗？',{title:'删除'}, function(index){
	          //向服务端发送删除指令og
	          $.getJSON(path+'/client/clientAction_del.action',{cust_no:data.cust_no}, function(ret){
	                  layer.close(index);//关闭弹窗
	                  table.reload('demo', {//重载表格
	                  })
	          });
	          layer.close(index);
	      });
	  }
	  else if(obj.event === 'look'){ 
		 
		  layer.open({
	          type: 1 //Page层类型
	          ,skin: 'layui-layer-molv'
	          ,area: ['90%', '90%']
	          ,title: ['查看信息','font-size:18px']
	          ,btn: ['确定', '取消'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#window1")  //弹窗路径
	          ,success:function(layero,index){
	        	  //获取级别
	        	  $.getJSON(path+'/data/selectAction_list.action',{
	        		  type:3,
	        		  cust_level:data.cust_level
	        		  }, function(a){
	        			  if(a.length !=0){
	        				  $('#cust_level1').val(a[0].dict_item); //级别
	        			  }
	        	  });
	        	  $('#cust_no1').val(data.cust_no);
	        	  $('#cust_name1').val(data.cust_name);
	        	  $('#cust_region1').val(data.cust_region);
	        	  $('#user_id1').val(data.user_id);
	        	  $('#cust_manager_name1').val(data.cust_manager_name);
	        	  $('#cust_satisfy1').val(data.cust_satisfy);
	        	  $('#cust_credit1').val(data.cust_credit);
	                rate.render({
	                	elem: '#test3'
	                		,value: data.cust_satisfy
	                		,theme: '#1E9FFF'
	                		,readonly:true
	                });
	               rate.render({
	                	elem: '#test4'
	            		,value: data.cust_credit
	            		,theme: '#1E9FFF'
	            			,readonly:true
	                });
	                $('#cust_addr1').val(data.cust_addr);
	                $('#cust_tel1').val(data.cust_tel);
	                $('#cust_website1').val(data.cust_website);
	                $('#cust_bankroll1').val(data.cust_bankroll);
	                var zt = "";
	                if(data.cust_status==1){
	                	zt = "正常";
	                }
	                if(data.cust_status==0){
	                	zt = "禁用";
	                }
	                if(data.cust_status==2){
	                	zt = "预警流失";
	                }
	                $('#cust_status1').val(zt);
	                form.render();
	          },yes:function(index,layero){
	              layer.close(index);//关闭弹出层
	              $("#dict")[0].reset()//重置form
	 			  table.reload('demo',{//重载表格
	 				  page:{
	 					  curr:1
	 				  }
	 			  })
	          }
	      });
		  
	  }
	  else if(obj.event === 'edit'){ //编辑 
	      layer.open({
	          type: 1 //Page层类型
	          ,skin: 'layui-layer-molv'
	          ,area: ['70%', '70%']
	          ,title: ['编辑客户信息','font-size:18px']
	          ,btn: ['确定', '取消'] 
	          ,shadeClose: true
	          ,shade: 0 //遮罩透明度
	          ,maxmin: true //允许全屏最小化
	          ,content:$("#window")  //弹窗路径
	          ,success:function(layero,index){
	        	  
	        	    $('#cust_region').val(data.cust_region);
	        	    $('#cust_status').val(data.cust_status);
	        	    $('#cust_level').val(data.cust_level);
	                $('#cust_no').val(data.cust_no);
	                $('#cust_name').val(data.cust_name);
	                $('#cust_region').val(data.cust_region);
	                $('#user_id').val(data.user_id);
	                $('#cust_manager_name').val(data.cust_manager_name);
	                $('#test1v').val(data.cust_satisfy);
	                $('#test2v').val(data.cust_credit);
	                rate.render({
	                	elem: '#test1'
	                		,value: data.cust_satisfy
	                		,theme: '#1E9FFF'
	            			,choose: function(value){
	                		    $('#test1v').val(value);
	                		 }
	                });
	               rate.render({
	                	elem: '#test2'
	            		,value: data.cust_credit
	            		,theme: '#1E9FFF'
	            		,choose: function(value){
	            		    $('#test2v').val(value);
	            		  }
	                });
	                $('#cust_addr').val(data.cust_addr);
	                $('#cust_tel').val(data.cust_tel);
	                $('#cust_website').val(data.cust_website);
	                $('#cust_bankroll').val(data.cust_bankroll);
//	                $('#cust_status').val(data.cust_status);
	                form.render();
	          },yes:function(index,layero){
	         	  $.getJSON(path+'/client/clientAction_edit.action',{
	         		cust_no: $('#cust_no').val(),
	         		cust_name:$('#cust_name').val(),
	         		cust_region:$('#cust_region').val(),
	         		user_id:$('#user_id').val(),
	         		cust_manager_name:$('#cust_manager_name').val(),
	         		cust_level:$('#cust_level').val(),
	         		cust_satisfy:$('#test1v').val(),
	         		cust_credit:$('#test2v').val(),
	         		cust_addr:$('#cust_addr').val(),
	         		cust_tel:$('#cust_tel').val(),
	         		cust_website:$('#cust_website').val(),
	         		cust_bankroll:$('#cust_bankroll').val(),
	         		cust_status:$('#cust_status').val()
	         	  },function(data){
	         	  //根据后台返回的参数，来进行判断
	         		  if(data>0){
	         			  layer.alert('编辑成功',{icon:1,title:'提示'},function(i){
	         				  layer.close(i);
	                           layer.close(index);//关闭弹出层
	                           $("#dict")[0].reset()//重置form
	         			  })
	         			  table.reload('demo',{//重载表格
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
	  
	  
	  
	 	 //搜索按钮
	  
	  $('#cx').on('click', function () {
		    // 搜索条件
		    var name = $('#cxcust_id').val();
		    var type = $('#cxcust_name').val();
		    var item = $('#cxcust_region').val();
		    table.reload('demo', {
		        method: 'post'
		        , where: {
		            'cust_id': name,
		            'cust_name':type,
		            'cust_region':item
		        }
		        , page: {
		            curr: 1
		        }
		    });
		});
	  
	  
	 	 //联系人新增按钮
	  
	  $('#xzlxr').on('click', function () {
		  layer.open({//弹出框
              type: 1,
              title: '新增联系人',
              maxmin: true, //允许全屏最小化
              shadeClose: true, //点击遮罩关闭层
              area: ['70%', '90%'],
              content: $('#xzlxrtk'),
              btn: ['确定', '取消'],
              yes: function (index, layero) {//确定执行函数
            	  //执行添加方法
                  $.getJSON(path+"/client/linkAction_add.action", {
                	 lkm_name: $("#xzlxrlkm_name").val(),
                	 lkm_sex: $('#xzlxrlkm_sex input[name="xz_sex"]:checked ').val(),
                	 lkm_postion: $("#xzlxrlkm_postion").val(),
                	 lkm_tel: $("#xzlxrlkm_tel").val(),
                	 lkm_memo: $("#xzlxrlkm_memo").val(),
                	 cust_no: $('#cust_no1').val(),
                  	 lkm_cust_name: $('#cust_name1').val()
                  }, function (data) {
	                	  //根据后台返回的参数，来进行判断
              		  if(data>0){
              			  layer.alert('创建成功',{icon:1,title:'提示'},function(i){
              				  layer.close(i);
              			  })
              		  }
              		  else{
              			  layer.alert('创建失败',{icon:1,title:'提示'},function(i){
              				  layer.close(i);
              			  })
              		  }
              		  layer.close(index);//关闭弹出层
                        $("#xzlxrbd")[0].reset()//重置form
                         table.reload('lxrtab',{//重载表格
          				  page:{
          					  curr:1
          				  }
          			  })
              	  });
              }
          });
		});
	  
	  
	  
	  
	  
	  //    联系人
	  
	  $('#lxr').on('click', function () {
		  var no = $('#cust_no1').val();
		  $('#lxr_cust_no').val(no);
		  $('#lxr_cust_name').val($('#cust_name1').val());
		  table.render({
			    elem: '#lxrtab'
			    ,height: 320
			    ,width: 810
			    ,url: path+'/client/clientAction_list.action?cust_no='+no+'&method=cst_linkman' //数据接口
			    ,page: true //开启分页
			    ,cols: [[ //表头
			      {field: 'lkm_name', title: '姓名', width:80, sort: true}
			      ,{field: 'lkm_sex', title: '性别', width:80}
			      ,{field: 'lkm_postion', title: '职位', width:100, sort: true}
			      ,{field: 'lkm_tel', title: '办公电话', width: 135, sort: true}
			      ,{field: 'lkm_memo', title: '备注', width: 250, sort: true}
			      ,{field: 'right', title: '操作', width: 150,templet: function(d){
		    		  return '<a class="layui-btn layui-btn-mini" lay-event="edit"><i class="layui-icon layui-icon-edit"></i></a>  <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del"><i class="layui-icon layui-icon-close"></i></a>'
			      }}
			    ]]
			  });
	        layer.open({//弹出框
              type: 1,
              skin: 'layui-layer-molv',
              title: '联系人',
              shade: 0 //遮罩透明度
              ,maxmin: true //允许全屏最小化
              ,shadeClose: true, //点击遮罩关闭层
              area: ['70%', '90%'],
              content: $('#lxrtk'),
              btn: ['确定', '取消'],
              yes: function (index, layero) {//确定执行函数
            	  layer.close(index);//关闭弹出层
              }
          });
	    });
 
	  
	  
	  
 // 联系人绑定操作
	  
	  table.on('tool(lxrcz)', function(obj){
		  var data = obj.data; //获得当前行数据
		  var tr=obj.tr//活动当前行tr 的  DOM对象
		  if(obj.event === 'del'){ //删除
		      layer.confirm('确定删除吗？',{title:'删除'}, function(index){
		          //向服务端发送删除指令og
		          $.getJSON(path+'/client/linkAction_del.action',{lkm_id:data.lkm_id}, function(ret){
		                  layer.close(index);//关闭弹窗
		                  table.reload('lxrtab', {//重载表格
		                  })
		          });
		          layer.close(index);
		      });
		  }else if(obj.event === 'edit'){ //编辑
			  
		      layer.open({
		          type: 1 //Page层类型
		          ,skin: 'layui-layer-molv'
		          ,area: ['70%', '70%']
		          ,title: ['编辑联系人信息','font-size:18px']
		          ,btn: ['确定', '取消'] 
		          ,shadeClose: true
		          ,shade: 0 //遮罩透明度
		          ,maxmin: true //允许全屏最小化
		          ,content:$("#xzlxrtk")  //弹窗路径
		          ,success:function(layero,index){
		        	  $("#xzlxrlkm_name").val(data.lkm_name);
		        	  $("input[name='xz_sex'][value="+data.lkm_sex+"]").prop("checked",true);
	                  $("#xzlxrlkm_postion").val(data.lkm_postion);
	                  $("#xzlxrlkm_tel").val(data.lkm_tel);
	                  $("#xzlxrlkm_memo").val(data.lkm_memo);
	                  $("#xzlxrlkm_id").val(data.lkm_id);
		                form.render();
		          },yes:function(index,layero){
		         	  $.getJSON(path+'/client/linkAction_edit.action',{
		         		 lkm_name: $("#xzlxrlkm_name").val(),
	                	 lkm_sex: $('#xzlxrlkm_sex input[name="xz_sex"]:checked ').val(),
	                	 lkm_postion: $("#xzlxrlkm_postion").val(),
	                	 lkm_tel: $("#xzlxrlkm_tel").val(),
	                	 lkm_memo: $("#xzlxrlkm_memo").val(),
	                	 cust_no: $('#cust_no1').val(),
	                  	 lkm_cust_name: $('#cust_name1').val(),
	                  	 lkm_id: $('#xzlxrlkm_id').val()
		         	  },function(data){
		         	  //根据后台返回的参数，来进行判断
		         		  if(data>0){
		         			  layer.alert('编辑成功',{icon:1,title:'提示'},function(i){
		         				  layer.close(i);
		                           layer.close(index);//关闭弹出层
		         			  })
		         		  }
		         		  $("#xzlxrbd")[0].reset()//重置form
		         		  table.reload('lxrtab',{//重载表格
		         			  page:{
		         				  curr:1
		         			  }
		         		  })
		         	  });
		          }
		      });
		  }
	});
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
 //    交往记录
	  
	  $('#jwjl').on('click', function () {//制定计划弹出框
		  
	  	var no = $('#cust_no1').val();
	  	
	  	 $('#jwjl_cust_no').val(no);
		  $('#jwjl_cust_name').val($('#cust_name1').val());
		  
		  table.render({
			    elem: '#jwjltab'
			    ,height: 300
			    ,url: path+'/client/activityAction_list.action' //数据接口
			    ,page: true //开启分页
			    ,cols: [[ //表头
			      {field: 'atv_date', title: '交往日期', width:165, sort: true, fixed: 'left',templet: function(d){
		    		  return util.toDateString(parseInt(d.atv_date),'yyyy-MM-dd HH:mm:ss');
			      }}
			      ,{field: 'atv_place', title: '交往地点', width:150,sort: true}
			      ,{field: 'cust_region', title: '概要', width:100}
			      ,{field: 'atv_remark', title: '备注', width: 235 }
			      ,{field: 'atv_desc', title: '详情', width: 135 }
			      ,{field: 'right', title: '操作', width: 170,templet: function(d){
		    		  return '<a class="layui-btn layui-btn-mini" lay-event="edit"><i class="layui-icon layui-icon-edit"></i></a>  <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del"><i class="layui-icon layui-icon-close"></i></a>'
			      } }
			    ]]
		  });
		  
	        layer.open({//弹出框
              type: 1,
              skin: 'layui-layer-molv',
              title: '交往记录',
              shade: 0 //遮罩透明度
              ,maxmin: true //允许全屏最小化
              ,shadeClose: true, //点击遮罩关闭层
              area: ['80%', '80%'],
              content: $('#jwjltk'),
              btn: ['确定', '取消'],
              yes: function (index, layero) {//确定执行函数
              	  layer.close(index);//关闭弹出层
                  $("#jwjlbd")[0].reset()//重置form
              }
          });
	    });//点击
	  
	  
	  
 //交往记录新增按钮
	  
	  $('#jwjlxz').on('click', function () {
		  layer.open({//弹出框
              type: 1,
              title: '新增交往记录',
              maxmin: true, //允许全屏最小化
              shadeClose: true, //点击遮罩关闭层
              area: ['70%', '90%'],
              content: $('#xzjwjltk'),
              btn: ['确定', '取消'],
              yes: function (index, layero) {//确定执行函数
            	  //执行添加方法
                  $.getJSON(path+"/client/activityAction_add.action", {
                	 cust_no: $("#cust_no1").val(),
                	 atv_cust_name: $('#cust_name1').val(),
                	 atv_place: $("#xzjwjlatv_place").val(),
                	 atv_title: $("#xzjwjlatv_title").val(),
                	 atv_remark: $('#xzjwjlatv_remark').val(),
                	 atv_desc: $('#xzjwjlatv_desc').val()
                  }, function (data) {
	                	  //根据后台返回的参数，来进行判断
              		  if(data>0){
              			  layer.alert('创建成功',{icon:1,title:'提示'},function(i){
              				layer.close(i);
              			  })
              		  }
              		  else{
              			  layer.alert('创建失败',{icon:1,title:'提示'},function(i){
              				layer.close(i);
              			  })
              		  }
              		  layer.close(index);//关闭弹出层
                        $("#xzjwjlrbd")[0].reset()//重置form
                         table.reload('jwjltab',{//重载表格
          				  page:{
          					  curr:1
          				  }
          			  })
              	  });
              }
          });
		});
	  
	  
	  
// 交往记录绑定操作
	  
	  table.on('tool(jwjlcz)', function(obj){
		  var data = obj.data; //获得当前行数据
		  var tr=obj.tr//活动当前行tr 的  DOM对象
		  if(obj.event === 'del'){ //删除
		      layer.confirm('确定删除吗？',{title:'删除'}, function(index){
		          //向服务端发送删除指令og
		          $.getJSON(path+'/client/activityAction_del.action',{atv_id:data.atv_id}, function(ret){
		                  table.reload('jwjltab', {//重载表格
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
		          ,area: ['70%', '70%']
		          ,title: ['编辑交往记录信息','font-size:18px']
		          ,btn: ['确定', '取消'] 
		          ,shadeClose: true
		          ,shade: 0 //遮罩透明度
		          ,maxmin: true //允许全屏最小化
		          ,content:$("#xzjwjltk")  //弹窗路径
		          ,success:function(layero,index){
		        	  $("#xzjwjlatv_place").val(data.atv_place);
	                  $("#xzjwjlatv_title").val(data.atv_title);
	                  $("#xzjwjlatv_remark").val(data.atv_remark);
	                  $("#xzjwjlatv_id").val(data.atv_id);
	                  $("#xzjwjlatv_desc").val(data.atv_desc);
		                form.render();
		          },yes:function(index,layero){
		         	  $.getJSON(path+'/client/activityAction_edit.action',{
		         		 cust_no: $("#cust_no1").val(),
	                	 atv_cust_name: $('#cust_name1').val(),
	                	 atv_place: $("#xzjwjlatv_place").val(),
	                	 atv_title: $("#xzjwjlatv_title").val(),
	                	 atv_remark: $('#xzjwjlatv_remark').val(),
	                	 atv_desc: $('#xzjwjlatv_desc').val(),
	                	 atv_id: $('#xzjwjlatv_id').val()
		         	  },function(data){
		         	  //根据后台返回的参数，来进行判断
		         		  if(data>0){
		         			  layer.alert('编辑成功',{icon:1,title:'提示'},function(i){
		         				  layer.close(i);
		                           layer.close(index);//关闭弹出层
		                           $("#xzjwjlrbd")[0].reset()//重置form
		         			  })
		         			  table.reload('jwjltab',{//重载表格
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
	 
	  
	  

	  
	  
	  
	  
	  
	  
  
});

