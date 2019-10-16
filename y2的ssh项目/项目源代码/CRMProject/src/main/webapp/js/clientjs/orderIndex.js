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
    ,url: path+'/client/orderAction_list.action' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'odr_id', title: '历史订单编号', width:130, sort: true, fixed: 'left'}
      ,{field: 'odr_customer', title: '客户名称', width:150}
      ,{field: 'odr_date', title: '下单日期', width:200, sort: true,templet: function(d){
		  return util.toDateString(parseInt(d.odr_date),
					'yyyy-MM-dd HH:mm:ss');

		      }}
      ,{field: 'odr_addr', title: '送货地址', width: 235, sort: true}
      ,{field: 'odr_price', title: '总金额', width: 130, sort: true}
      ,{field: 'prod_id', title: '产品ID', width: 115, sort: true}
      ,{field: 'odr_status', title: '订单状态', width: 115, sort: true,templet: function(d){
    	  if(d.odr_status=="未回款"){
    		  return '<button lay-event="edit" class="layui-btn layui-btn-sm layui-btn-danger">未回款</button>'
    	  }
    	  else{
    		  return '<button  class="layui-btn layui-btn-sm">已回款</button>'
    	  }
      }}
    ]]
  });
  
  
  $("#ref").click(function(){//刷新
		layer.msg('刷新成功', {
		      offset: '6px'
		    });
		$("#cxbh").val("");
		$("#cxmc").val("");
		$("#cxdz").val("");
		 table.reload('demo',{//重载表格
				  page:{
					  curr:1
				  }
			  })
	})
  
  
	 //搜索按钮
  
  $('#cx').on('click', function () {
	    // 搜索条件
	    var name = $('#cxbh').val();
	    var type = $('#cxmc').val();
	    var item = $('#cxdz').val();
	    table.reload('demo', {
	        method: 'post'
	        , where: {
	            'odr_id': name,
	            'odr_customer':type,
	            'odr_addr':item
	        }
	        , page: {
	            curr: 1
	        }
	    });
	});
  
  table.on('tool(bianji)', function(obj){
	  var data = obj.data; //获得当前行数据
	  var tr=obj.tr//活动当前行tr 的  DOM对象
	  if(obj.event === 'edit'){ //编辑
		  $.getJSON(path+'/client/orderAction_edit.action',{
			  odr_status: "已回款",
			  odr_id: data.odr_id
      	  },function(data){
      	  //根据后台返回的参数，来进行判断
      		  if(data>0){
      			  layer.alert('回款成功',{icon:1,title:'提示'},function(i){
      				  layer.close(i);
      			  })
      		  }
      		  table.reload('demo',{//重载表格
      			  page:{
      				  curr:1
      			  }
      		  })
      	  });
	  }
});

  
  
  

	  
	  
	  
	  
	  
	  
  
});

