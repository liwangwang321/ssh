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
    ,url: path+'/data/productAction_list.action' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'prod_id', title: 'ID', width:120, sort: true, fixed: 'left', align:'center'}
      ,{field: 'prod_name', title: '产品名称', width:200, align:'center'}
      ,{field: 'prod_type', title: '型号', width:100, sort: true, align:'center'}
      ,{field: 'prod_unit', title: '单位', width:100, align:'center'} 
      ,{field: 'prod_price', title: '单价 / 元',width:200, align:'center'}
      ,{field: 'prod_memo', title: '备注', width: 300, align:'center',
    	  sort: true}
      
    ]]
  });
  
 	 //搜索按钮
  
  $('#search').on('click', function () {
	    // 搜索条件
	    var prod_name = $('#prod_name').val();
	    var prod_id = $('#prod_id').val();
	    var prod_type = $('#prod_type').val();
	    table.reload('demo', {
	        method: 'post'
	        , where: {
	            'prod_name':prod_name,
	            'prod_id':prod_id,
	            'prod_type':prod_type,
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
		$("#prod_id").val("");
		$("#prod_type").val("");
		 table.reload('demo',{//重载表格
				  page:{
					  curr:1
				  }
			  })
	})
  
  
})