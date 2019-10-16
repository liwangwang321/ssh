package com.crm.role.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.entity.TreeNode;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;
import com.crm.role.biz.RoleMenuBiz;

public class MenuDao extends JsonBaseDao{
	
	private String roleid;
	
	private RoleMenuBiz roleMenuBiz;
	
	
	
	public RoleMenuBiz getRoleMenuBiz() {
		return roleMenuBiz;
	}



	public void setRoleMenuBiz(RoleMenuBiz roleMenuBiz) {
		this.roleMenuBiz = roleMenuBiz;
	}
	/**
	 * 查询所有菜单
	 * @param map
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> menuList(Map<String, String[]> map,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from sys_menu where true ";
		return super.executeQuery(sql, pageBean);
	}
	/**
	 * 查询ztree,也就是单个角色的菜单
	 * @param mapMap
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> menuZtree(List<Map<String, Object>> mapMap) throws InstantiationException, IllegalAccessException, SQLException{
		List<Map<String, Object>> mb = new ArrayList<>();
		
		Map<String, Object> m = null;
		for (Map<String, Object> map : mapMap) {
			m = new HashMap<>();
			m.put("id", map.get("menu_id")+"");
			m.put("Pid",map.get("menu_pid")+"" );
			m.put("name", map.get("menu_name")+"");
			if(1==Integer.parseInt(map.get("rolemenu_state")+"")) {
				m.put("checked", true);
			}
			else {
				m.put("checked", false);
			}
			mb.add(m);
		}
	
		
		
		return  mb;
	}
	
	/**
	 * 增加方法，增加到菜单表，menu
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	public int addMenu(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		String sql = "insert into sys_menu(menu_id,menu_name,menu_pid,menu_url,menu_type,menu_icon) values(?,?,?,?,?,'') ";
		return super.executeUpdate(sql, new String[] {"menu_id","menu_name","menu_pid","menu_url","menu_type"}, map);
	}
	/**
	 * 删除方法，根据menu_id删除相对应节点id
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	public int delMenuId(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		String sql = "delete from sys_menu where menu_id =  ? ";
		return super.executeUpdate(sql, new String[] {"menu_id"}, map);
	}
	/**
	 * 删除方法，根据menu_pid删除相对应节点父id
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	public int delMenuPid(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		String sql = "delete from sys_menu where menu_pid =  ? ";
		return super.executeUpdate(sql, new String[] {"menu_id"}, map);
	}
	/**
	 * 修改方法，根据menu_id传值
	 * @param map jsp传值
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 */
	public int editMenu(Map<String, String[]> map) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		String sql = "update sys_menu set menu_name = ? ,menu_url= ? where menu_id = ? ";
		return super.executeUpdate(sql, new String[] {"menu_name","menu_url","menu_id"}, map);
	}



	/*格式：menu:			类型				意思			
	 * 			menuid     String			表id
	 * 			menuname   String			名字
	 * 			menuURL    String			路径
	 * 			parentid   String			上一级的id
	 * 		treeNode:
	 * 			id         String			节点的id
	 * 			text	   String			节点的名字
	 * 			children   List<treeNode>	该节点下的子节点
	 * 			attributes map<String,Object>节点的对应路径
	 * 
	 	*/	
	//流程：第一步
	public List<TreeNode> list(Map<String, String[]> map,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		 roleid = JsonUtils.getParamVal(map, "roleid");
		
		
		List<Map<String, Object>> listMenu = this.listMenu(map, pageBean);//调用查询数据库的方法来获取数据
		List<TreeNode> treeNodesList = new ArrayList<>();//先搞一个容器准备装着
		menuList2TreeNodeList(listMenu, treeNodesList);//调用来将查询过来的menu数据转换为treeNode数据
		
		return treeNodesList;
	}
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 查询menu表的数据
	 * @param map
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	//流程：第二步
	public List<Map<String, Object>> listMenu(Map<String, String[]> map,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from sys_menu where true ";
		String id = JsonUtils.getParamVal(map, "id");//第一次为空
		if(StringUtils.isNotBlank(id)) {
			sql = sql + " and menu_pid = "+id;
		}else {
			sql = sql + " and menu_pid = -1";//在第一次的时候执行
		}
		
		return super.executeQuery(sql, pageBean);
	}

	/**转换的单个转换
	 * 
	 * menu表的数据不符合easyui树形展示的数据格式
	 * 需要转化成easyui所能识别的数据格式
	 * 
	 * @param map
	 * @param treeNode
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	//流程：第四步
	private void menu2TreeNode(Map<String, Object> map,TreeNode treeNode) throws InstantiationException, IllegalAccessException, SQLException{
			
			treeNode.setId(map.get("menu_id").toString() );  //单个的赋值
			treeNode.setName(map.get("menu_name").toString());
			treeNode.setAttributes(map);
			
			
			
			//treeNode.setChildren(children);
			Map<String, String[]> jspMap = new HashMap<>();//给参数集合实例化
			jspMap.put("id", new String[] {treeNode.getId()});//给参数中加入一个id的参数
			List<Map<String, Object>> listMenu = this.listMenu(jspMap, null); // 重点!!! 如果第二次查询没有这个id的话就结束,否则 二，三，四流程继续
			List<TreeNode> treeNodeList = new ArrayList<>();  //用一个List<TreeNode>集合准备装着子节点的所有东西
			menuList2TreeNodeList(listMenu, treeNodeList); //如果有的话就继续运行，否则不运行
			treeNode.setChildren(treeNodeList); //将treeNode的children属性赋值
	}
	
	//流程：第三步
	private void menuList2TreeNodeList(List<Map<String, Object>> mapList,List<TreeNode> treeNodeList) throws InstantiationException, IllegalAccessException, SQLException{
			TreeNode treeNode = null;		//准备最后放入集合内部TreeNode
			for (Map<String, Object> map : mapList) {//遍历List<Menu>中然后两者相互转换。因为最后的结果就是List<TreeNode>
				treeNode = new TreeNode();
				menu2TreeNode(map, treeNode);//调用到第一流程中的最后一步：为TreeNode设值
				
				//获取menu_id的值
				Object object = map.get("menu_id");
				String menu_id = object+"";

				//调用判断的方法
				if(roleMenuBiz.getState(roleid, menu_id)   ) {
					treeNodeList.add(treeNode);//将转换完成的加入到treeNode
				}
				
			}
	}
	
	
	
	
}
