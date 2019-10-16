$(function(){
	var data=document.getElementById("sj").value;//获得隐藏于传值
	  //点击弹出框加载下拉框
	 $.ajax({
		url: data+'/marketing/marketingAction_selectClient.action',
		dataType: 'json',
		type: 'post',
		success: function (a) {
			$.each(a.data, function (index, item) {
				$('#chc_due_id1').append(new Option(item.user_name, item.user_id));// 下拉菜单里添加元素
			});
			layui.form.render("select");
		}
	 });
})




//管理
//执行渲染
layui.use(['table','layer','form',"upload"],function(){
		var $=layui.$;
		var data=document.getElementById("sj").value;//获得隐藏于传值
		var table =layui.table;
		var layer=layui.layer;
		var form = layui.form;
	
		
		
		
		
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
		
	     /*展示数据表格  */
		table.render({
			  elem:'#test'//表格id
			,url:data+'/marketing/marketingAction_list.action?type=1'//所对应调用的接口
			,method:'post'		//提交方式
		    ,cols:[[
		    	/*根据数据库的表格所对应的名称  */
		         {field:'chc_id',height:80, width:200, title: '客户编号', sort: true,align:'center'}
		         ,{field:'chc_cust_name',height:80, width:200, title: '客户名称',align:'center'}
		         ,{field:'chc_title',height:80, width:200, title: '概要',align:'center'}
		         ,{field:'chc_tel',height:80, width:200, title: '联系电话',align:'center'}
		         ,{field:'chc_create_date',height:80, width:200, title: '创建时间',sort: true,align:'center'}
		         ,{field: 'chc_status',
		        	 align:'center', templet: function(d){
		       		if(d.chc_status == 1){
		       			 return '<span class="layui-badge-rim layui-bg-blue">未指派!!</span>';
		       		 } 
		       		 if(d.chc_status == 2){
		       			 return '<span class="layui-badge layui-bg-green">开发中...</span> ';
		       		 } 
		       		 if(d.chc_status == 3){
		                    return '<span class="layui-badge layui-bg-orange">开发成功</span>';
		             } 
		       		 if(d.chc_status == 4){
		                    return '<span class="layui-badge">开发失败</span>';
		             } 
		       	  },
		      	  title: '状态', width:90, sort: true}
		         ,{field:'right',height:80, width:350, align:'center',title: '操作',
		        	templet: function(d){
		        		
		        		if (d.chc_status == 1) {//未指派
		        			return ' <a style="color:#5FB878" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="edit"><i class="layui-icon"></i>编辑</a> '+
		        			' <a style="color:#FF5722" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="del"><i class="layui-icon"></i>删除</a>';
		        		}
		       		    if (d.chc_status == 2 ){//指派中
		       			 return '<a style="color:#01AAED"  class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="details"><i class="layui-icon layui-icon-tips" ></i>详情</a>';
		       		    } 
			       		if (d.chc_status == 3) {//开发成功
			       			return '<a style="color:#01AAED"  class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="details"><i class="layui-icon layui-icon-tips" ></i>详情</a>';
			       			
			       		}
			       		if (d.chc_status == 4) {//开发失败
			       			return '<a style="color:#01AAED"  class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="details"><i class="layui-icon layui-icon-tips" ></i>详情</a> <a style="color:#FF5722" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="del"><i class="layui-icon"></i>删除</a>';
			       			
			       		}
			       	  }
		         }//操作栏
		    ]]
		         ,page:'true'//分页
		         , id: 'testReload'
		        
		  });//表格展示
	      
			//上方菜单操作栏(查询、以及  增加  按钮  )
	  		  	active = {
	            //查询 	
	            reload: function () {
	                var chc_cust_name = $('#chc_cust_name');//根据文本id取值  客户名
	                var chc_title = $('#chc_title');//根据文本id取值   客户概要
	                
	                // 执行重载
	                table.reload('testReload', {
	                    page: {
	                        curr: 1
	                        // 重新从第 1 页开始
	                    },
	                    where: {
	                        key: 'chc_cust_name',
	                        chc_cust_name: chc_cust_name.val(),
	                        
	                        key: 'chc_title',
	                        chc_title: chc_title.val(),
	                        
	                    }
	                })
	              
	            },
					add: function () { //添加
						

		                layer.open({//弹出框
		                    type: 1,
		                    title: '创建营销机会',
		                    maxmin: true, //允许全屏最小化
		                    shadeClose: true, //点击遮罩关闭层
		                    area: ['70%', '70%'],
		                    content: $('#box1'),
		                    btn: ['确定', '取消'],
		                    yes: function (index, layero) {//确定执行函数
		                    	console.log(layero); //执行添加方法
		                        $.getJSON(data+"/marketing/marketingAction_addMark.action", {
		                        	chc_cust_name: $("#chc_cust_name2").val(),//客户名
		                        	chc_source: $("#chc_source2").val(),//机会来源
		                        	chc_title: $("#chc_title2").val(),//概要
		                        	chc_rate: $("#chc_rate2").val(),//成功几率
		                        	chc_linkman: $("#chc_linkman2").val(),//联系人
		                        	chc_tel: $("#chc_tel2").val(),//联系人电话
		                        	chc_desc: $("#chc_desc2").val(),//机会描述
		                        	user_id: $("#user_id2").val(),//创建人id 用隐藏于传值
		                        	chc_create_by: $("#chc_create_by2").val(),//创建人名 
		                        	chc_create_date: $("#chc_create_date2").val(),//创建日期 
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
		                              $("#sal")[0].reset()//重置form
		                               table.reload('testReload',{//重载表格
		                				  page:{
		                					  curr:1
		                				  }
		                			  })
			                	  })
		                    }
		                });
	            	}//弹出框
	            
	    }
	    $('.layui-form .layui-btn').on('click', function () {
	        var type = $(this).data('type');
	        active[type] ? active[type].call(this) : '';
	    });//点击

	
	
	
//		table表格 行内操作(编辑  以及  删除 按钮操作)  
	    table.on('tool(test)', function(obj){
	        var data = obj.data; //获得当前行数据
	        var urlex=document.getElementById("sj").value;
	        var tr=obj.tr//活动当前行tr 的  DOM对象
	        console.log(data);
	        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	        if(layEvent === 'del'){ //删除
	             layer.confirm('确定删除吗？',{title:'删除'}, function(index){
	                 //向服务端发送删除指令og
	                 $.getJSON(urlex+'/marketing/marketingAction_delMark.action',{chc_id:data.chc_id}, function(ret){
	                         layer.close(index);//关闭弹窗
	                         table.reload('testReload', {//重载表格
	                             page: {
	                                 curr: 1
	                                 // 重新从第 1 页开始
	                             }
	                         })
	                 });
	                 layer.close(index);
	             });
	         } 
	        else if(layEvent === 'edit'){ //编辑
	             layer.open({
	                 type: 1 //Page层类型
	                 ,skin: 'layui-layer-molv'
	                 ,area: ['70%', '70%']
	                 ,title: ['编辑销售机会','font-size:18px']
	                 ,btn: ['确定', '取消'] 
	                 ,shadeClose: true
	                 ,shade: 0 //遮罩透明度
	                 ,maxmin: true //允许全屏最小化
	                 ,content:$('#box2')  //弹窗id
	                 ,success:function(layero,index){//回显
		                 $('#chc_id1').val(data.chc_id);//主键id
		                 $('#chc_source1').val(data.chc_source);//机会来源
		                  $('#chc_cust_name1').val(data.chc_cust_name); //客户名称
		                 $('#chc_title1').val(data.chc_title);//概要
		                 $('#chc_rate1').val(data.chc_rate);//成功几率
		                 $('#chc_linkman1').val(data.chc_linkman);//联系人
		                 $('#chc_tel1').val(data.chc_tel);//联系电话
		                 $('#chc_desc1').val(data.chc_desc);//机会描述
		                 $('#user_id1').val(data.user_id);//创建人id	  disabled
		                 $('#chc_create_by1').val(data.chc_create_by);//创建人名字		disabled
		                 $('#chc_create_date1').val(data.chc_create_date);
		                 $('#chc_due_id1').val(data.chc_due_id);//指派给某id
		                 $("#chc_due_to1").find("option[value='"+data.chc_due_id+"']").prop("selected",true);
		                 $('#chc_due_date1').val(data.chc_due_date);//指派时的当前时间
		                 $('#chc_status1').val(data.chc_status);//状态
	                 },yes:function(index,layero){
	                	  		$.getJSON(urlex+'/marketing/marketingAction_exitMark.action',{
	                			chc_id: $('#chc_id1').val(),
	                		  	chc_cust_name: $("#chc_cust_name1").val(),//客户名
	                        	chc_source: $("#chc_source1").val(),//机会来源
	                        	chc_title: $("#chc_title1").val(),//概要
	                        	chc_rate: $("#chc_rate1").val(),//成功几率
	                        	chc_linkman: $("#chc_linkman1").val(),//联系人
	                        	chc_tel: $("#chc_tel1").val(),//联系人电话
	                        	chc_desc: $("#chc_desc1").val(),//机会描述
	                        	user_id: $("#user_id1").val(),//创建人id 用隐藏于传值
	                        	chc_create_by: $("#chc_create_by1").val(),//创建人名
	                        	chc_create_date: $("#chc_create_date1").val(),//创建日期 获取系统当前时间
	                        	chc_due_id: $("#chc_due_id1").val(),//指派给谁 id
	                        	chc_due_to: $("#chc_due_id1").find("option[value='"+ $("#chc_due_id1").val()+"']").prop("selected",true).text(),//指派给人名
	                        	chc_due_date: $("#chc_due_date1").val(),//指派当前时间 获取系统当前时间
	                        	chc_status: $("#chc_status1").val(),//状态
	                	  },function(data){
	                	  //根据后台返回的参数，来进行判断
	                		  if(data>0){
	                			  layer.alert('编辑成功',{icon:1,title:'提示'},function(i){
	                				  layer.close(i);
	                			  })
	                			  
	                		  }
	                		  else{
	                			  layer.alert('编辑失败',{icon:1,title:'提示'},function(i){
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
	                 ,area: ['70%', '70%']
	                 ,title: ['机会详情','font-size:18px']
	                 ,btn: ['确定', '取消'] 
	                 ,shadeClose: true
	                 ,shade: 0 //遮罩透明度
	                 ,maxmin: true //允许全屏最小化
	                 ,content:$('#box3')  //弹窗id
	                 ,success:function(layero,index){
		                 $('#chc_id3').val(data.chc_id);//主键id
		                 $('#chc_source3').val(data.chc_source);//机会来源
		                  $('#chc_cust_name3').val(data.chc_cust_name); //客户名称
		                 $('#chc_title3').val(data.chc_title);//概要
		                 $('#chc_rate3').val(data.chc_rate);//成功几率
		                 $('#chc_linkman3').val(data.chc_linkman);//联系人
		                 $('#chc_tel3').val(data.chc_tel);//联系电话
		                 $('#chc_desc3').val(data.chc_desc);//机会描述
		                 $('#user_id3').val(data.user_id);//创建人id
		                 $('#chc_create_by3').val(data.chc_create_by);//创建人名
		                 $('#chc_create_date3').val(data.chc_create_date);//创建人名字
		                 $('#chc_due_id3').val(data.chc_due_to);//指派给某名字
		                 $('#chc_due_date3').val(data.chc_due_date);//指派时的当前时间
		                 $('#chc_status3').val(data.chc_status);//状态
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
	         }//查看详情
      
	    });//table表编辑
	   
	  
	  
});
	//系统当前时间 创建机会当前shi'j
	layui.use(['form', 'layedit', 'laydate'], function() {
		  var d = new Date();
	      var form = layui.form
	          , layer = layui.layer
	          , laydate = layui.laydate;
	      laydate.render({
	          elem: '#chc_create_date2', //指定元素
	          type:'datetime', // 可选择：年、月、日、时、分、秒
	          format: 'yyyy年M月dd日 ', //指定时间格式
	          value: d.getFullYear() + '-' + lay.digit(d.getMonth() + 1) + '-' + lay.digit(d.getDate()), // 指定值
	      });
	})
	
	
	//系统当前时间 创建机会当前shi'j
	layui.use(['form', 'layedit', 'laydate'], function() {
		  var d = new Date();
	      var form = layui.form
	          , layer = layui.layer
	          , laydate = layui.laydate;
	      laydate.render({
	          elem: '#chc_due_date1', //指定元素
	          type:'datetime', // 可选择：年、月、日、时、分、秒
	          format: 'yyyy年M月dd日', //指定时间格式
	          value: d.getFullYear() + '-' + lay.digit(d.getMonth() + 1) + '-' + lay.digit(d.getDate()), // 指定值
	      });
	})
		
	/* $(function(){
		my();
	})*/
	

		 