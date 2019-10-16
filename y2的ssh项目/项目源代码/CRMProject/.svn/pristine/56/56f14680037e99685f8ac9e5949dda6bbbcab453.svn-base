layui.use(['table','form','layer'], function(){
  var $ = layui.$;
  var path = $("#path").val();
  var layer = layui.layer;
  var table = layui.table;
  var form = layui.form;

  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 520
    ,url: path+'/data/dictAction_list.action' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'dict_id', title: 'ID', width:150, sort: true, fixed: 'left',align:'center'}
      ,{field: 'dict_type_name', align:'center',title: '类别名', width:150}
      ,{field: 'dict_item',align:'center', title: '条目', width:150, sort: true}
      ,{field: 'dict_value',align:'center', title: '值', width:150} 
      ,{field: 'dict_is_editable',align:'center', title: '是否可编辑',templet: function(d){
    	  if(d.dict_is_editable==1){
    		  return '<span>可编辑 </span>'
    	  }
    	  else{
    		  return '<span style="color: #c00;">不可编辑 </span>'
    	  }
      }}
      ,{field: 'dict_type',align:'center', title: '类别号', width: 80, sort: true}
      ,{field: 'right', align:'center',title: '操作', width: 250, templet: function(d){
    	  if(d.dict_is_editable==1){
    		  return ' <a style="color:#5FB878" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="edit"><i class="layui-icon"></i>编辑</a> '+
  			' <a style="color:#FF5722" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="del"><i class="layui-icon"></i>删除</a>';
    	  }
    	  else{
    		  return '<a style="color:#FF5722" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-primary" lay-event="del"><i class="layui-icon"></i>删除</a>'
    	  }
      }}
    ]]
  });
  
//获取按钮
  table.on('tool(test)', function(obj){
  var data = obj.data; //获得当前行数据
  var tr=obj.tr//活动当前行tr 的  DOM对象
  if(obj.event === 'del'){ //删除
      layer.confirm('确定删除吗？',{title:'删除'}, function(index){
          //向服务端发送删除指令og
          $.getJSON(path+'/data/dictAction_del.action',{dict_id:data.dict_id}, function(ret){
                  layer.close(index);//关闭弹窗
                  table.reload('demo', {//重载表格
                  })
          });
          layer.close(index);
      });
  }else if(obj.event === 'edit'){ //编辑
	  
      layer.open({
          type: 1 //Page层类型
          ,skin: 'layui-layer-molv'
          ,area: ['70%', '70%']
          ,title: ['编辑信息','font-size:18px']
          ,btn: ['确定', '取消'] 
          ,shadeClose: true
          ,shade: 0 //遮罩透明度
          ,maxmin: true //允许全屏最小化
          ,content:$("#window")  //弹窗路径
          ,success:function(layero,index){
                $('#dict_type_name').val(data.dict_type_name);
                $('#dict_item').val(data.dict_item); 
                $('#dict_value').val(data.dict_value);
               	$("input[name='dict_is_editable'][value="+data.dict_is_editable+"]").prop("checked",true);
                $('#dict_type').val(data.dict_type); 
                form.render();
          },yes:function(index,layero){
         	  $.getJSON(path+'/data/dictAction_edit.action',{
                dict_id: data.dict_id,
                dict_type_name: $('#dict_type_name').val(),
           		dict_item: $('#dict_item').val(),
           		dict_value: $('#dict_value').val(),
           		dict_is_editable: $('#editnum input[name="dict_is_editable"]:checked ').val(),
           		dict_type: $('#dict_type').val()
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
  
  
  
  
  
  $("#ref").click(function(){//刷新
		layer.msg('刷新成功', {
		      offset: '6px'
		    });
		$("#name").val("");
		$("#type").val("");
		$("#item").val("");
		 table.reload('demo',{//重载表格
				  page:{
					  curr:1
				  },
				  
			  })
	})
  
  //增加按钮
  $("#add").click(function(){
	    layer.open({
		  type: 1, 
		  title:"新增",
		  area:['60%','70%'],
		  btn: ['确定', '取消'], 
		  content: $("#window"),
		  yes:function(index,layero){
          	   $.getJSON(path+'/data/dictAction_add.action',{
          		dict_type_name: $('#dict_type_name').val(),
          		dict_item: $('#dict_item').val(),
          		dict_value: $('#dict_value').val(),
          		dict_is_editable: $('#editnum input[name="dict_is_editable"]:checked ').val(),
          		dict_type: $('#dict_type').val()
          	  },function(data){
          	  //根据后台返回的参数，来进行判断
              		   if(data>0){
              			  layer.alert('增加成功',{icon:1,title:'提示'},function(i){
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
  })
  
 	 //搜索按钮
  
  $('#search').on('click', function () {
	    // 搜索条件
	    var name = $('#name').val();
	    var type = $('#type').val();
	    var item = $('#item').val();
	    table.reload('demo', {
	        method: 'post'
	        , where: {
	            'dict_type_name': name,
	            'dict_type':type,
	            'dict_item':item
	        }
	        , page: {
	            curr: 1
	        }
	    });
	});
  
  

})