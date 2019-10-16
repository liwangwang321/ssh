<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户构成分析</title>
<!-- 引入 ECharts 文件 -->
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
</head>
<body> 


<blockquote class="layui-elem-quote">
<!-- 搜索框 -->

<div class="layui-form">

    <div class="layui-form-item">
        <label class="layui-form-label">客户名称</label>
        <div class="layui-input-inline">
            <input type="text" id='cxname' 
                   lay-verify="required" placeholder="请输关键字" autocomplete="true"
                   class="layui-input">
        </div>
        <button class="layui-btn layui-btn-normal layui-btn-radius" id="cx"><i class="layui-icon">&#xe615;</i>查询</button>
        <button class="layui-btn layui-btn-normal layui-btn-radius" id="ref"><i class="layui-icon layui-icon-refresh"></i>刷新</button>
    </div>
</div>


</blockquote>




    <!-- 为ECharts准备一个具备大小（宽高）的Dom --> 
    <div id="main2" style="width: 700px; height: 550px;"></div> 
    <input type="hidden" id="path" value="${pageContext.request.contextPath }" >
   <!--  <button type="button" id="button1">显示/隐藏</button>  -->
    
    

</body>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('main2'));
    var path = $("#path").val();
	
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
    

    myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
  
    var names=[];    //类别数组（实际用来盛放X轴坐标值）
    var nums=[];    //销量数组（实际用来盛放Y坐标值）

    $.ajax({
        type : "post",
        async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url : path+"/marketing/statAction_contributeList.action?lieming=odr_customer",    //请求发送到TestServlet处
        data : {},
        dataType : "json",        //返回数据形式为json
        success : function(result) {
            //请求成功时执行该函数内容，result即为服务器返回的json对象
            if (result) {
                for(var i=0;i<result.length;i++){
                    names.push(result[i].odr_customer);    //挨个取出类别并填入类别数组
                }
                for(var i=0;i<result.length;i++){
                    nums.push(result[i].sum);    //挨个取出销量并填入销量数组
                }
                console.log(names);
                console.log(nums);
                myChart.hideLoading();    //隐藏加载动画
                
                
                option = {
                	    title: {
                	        text: '客户贡献表',
                	        
                	    },
                	    tooltip: {
                	        trigger: 'axis',
                	        axisPointer: {
                	            type: 'shadow'
                	        }
                	    },
                	    
                	    grid: {
                	        left: '3%',
                	        right: '4%',
                	        bottom: '3%',
                	        containLabel: true
                	    },
                	    xAxis: {
                	        type: 'value',
                	        boundaryGap: [0, 0.01]
                	    },
                	    yAxis: {
                	        type: 'category',
                	        data: names
                	    },
                	    series: [
                	        {
                	            name: '2011年',
                	            type: 'bar',
                	            data: nums
                	        }
                	        
                	    ]
                	};
                myChart.setOption(option);
            }

        },
        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            myChart.hideLoading();
        },
    });
    layui.use(['table','layer','form',"upload"],function(){
		var $=layui.$;
		var table =layui.table;
		var layer=layui.layer;
		var form = layui.form;
		
		
		
	 	 //搜索按钮
		  
		  $('#cx').on('click', function () {
			    // 搜索条件
			    var name = $('#cxname').val();
				
			    $.getJSON(path+'/marketing/statAction_contributeList.action',{name:name,lieming:'odr_customer'}, function(result){
	                
			    	   var names=[];    //类别数组（实际用来盛放X轴坐标值）
			    	    var nums=[]; 
			    	for(var i=0;i<result.length;i++){
	                    names.push(result[i].odr_customer);    //挨个取出类别并填入类别数组
	                }
	                for(var i=0;i<result.length;i++){
	                    nums.push(result[i].sum);    //挨个取出销量并填入销量数组
	                }
			    	
			    	
			    	myChart.setOption({
			    		
			    		
			    		yAxis: {
                	        type: 'category',
                	        data: names
                	    },
                	    series: [
                	        {
                	            type: 'bar',
                	            data: nums
                	        }
                	        
                	    ]
			    		
			    		
			    		
			    	})
			    	
			    	
                 })
	          })
		
		 
		
    })

</script>
</html>