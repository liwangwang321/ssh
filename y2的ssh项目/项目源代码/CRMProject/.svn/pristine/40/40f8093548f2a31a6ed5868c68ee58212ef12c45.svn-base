
$(function () {
	var roleid = $("#roleid").val();//用户的角色
	var path = $("#path").val();//全路径
	var msg = $("#msg").val();//登录后的提示
	
	
    $.ajax({
        type: "post",
        url: "role/menuAction_treeMenu.action?roleid="+roleid,
        dataType: "json",
        /*data: {// 传给servlet的数据,
            role_id: MenuHid,
            right_code: "-1",
            d: new Date()
        },*/
        success: function (data) {
        	console.info(data);
            layui.tree({
                elem: '#demo',// 传入元素选择器
                nodes: data,
                //spread:true,
                click: function (node) {// 点击tree菜单项的时候
                    var element = layui.element;
                    console.info(node.attributes.menu_url);
                    var exist = $("li[lay-id='" + node.id + "']").length;//判断是不是用重复的选项卡
                    if (exist > 0) {
                        element.tabChange('tabs', node.id);// 切换到已有的选项卡
                    } else {
                        if (node.attributes.menu_url != null && node.attributes.menu_url != "") {// 判断是否需要新增选项卡
                            element.tabAdd(
                                'tabs',
                                {
                                    title: node.name,
                                    content: '<iframe    frameborder="0" src=" '
                                    +path+'/'+ node.attributes.menu_url
                                    + ' " style="height:150%;width:100%"></iframe>'// 支持传入html
                                    ,
                                    id: node.id
                                });
                            element.tabChange('tabs', node.id);
                        }
                    }

                }

            });

        }

    });
    
    if(msg!=""){
    	layer.msg(msg, {
		      offset: '100px'
		    });
	}
})


