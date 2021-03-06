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
    ,url: path+'/data/storageAction_list.action' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'stk_id', title: '序号', width:80, sort: true, align:'center',fixed: 'left'}
      ,{field: 'pro', title: '产品',align:'center', width:200}
      ,{field: 'stk_warehouse', title: '仓库', width:200, align:'center',sort: true}
      ,{field: 'stk_count', title: '件数', align:'center',width:80} 
      ,{field: 'stk_memo', title: '备注',align:'center',width:250}
      
    ]]
  });
  
 	 //搜索按钮
  
  $('#search').on('click', function () {
	    // 搜索条件
	    var prod_name = $('#prod_name').val();
	    var stk_id = $('#stk_id').val();
	    var stk_warehouse = $('#stk_warehouse').val();
	    table.reload('demo', {
	        method: 'post'
	        , where: {
	            'prod_name': prod_name,
	            'stk_id' : stk_id,
	            'stk_warehouse' : stk_warehouse,
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
		$("#prod_name").val("");
		$("#stk_id").val("");
		$("#stk_warehouse").val("");
		 table.reload('demo',{//重载表格
				  page:{
					  curr:1
				  }
			  })
	})
  
  
})