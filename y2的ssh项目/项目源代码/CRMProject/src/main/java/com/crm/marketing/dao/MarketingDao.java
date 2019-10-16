package com.crm.marketing.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class MarketingDao extends JsonBaseDao{
	/**
	 * 返回客户经理
	 * 客户经理编号为r003
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String,Object>> selectClient(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select  a.user_id , a.user_name from  sys_user a , sys_user_role b where a.user_id = b.user_id  and b.role_id ='r003' and a.user_flag = 1 ";
		return super.executeQuery(sql, null);
	}
	/**
	 * 查询所有营销机会	
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String,Object>> list(Map<String, String> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String user_id = pamap.get("user_id")+"";
		String type = pamap.get("type")+"";
		String role_id = pamap.get("role_id")+"";
		String sql = null;
		if("2".equals(type) ) {
			if("true".equals(role_id)) {
				sql = "select * from sal_chance where true and chc_due_id = "+user_id+" ";
			}
			else {
				sql = "select * from sal_chance where true ";
			}
		}
		else {
			sql = "select * from sal_chance where true ";
		}
		if("true".equals(role_id)) {
			sql += " and  chc_status in(2,3,4) ";
		}
		
		
		
		
		String name = pamap.get("name")+"";
		String title = pamap.get("title")+"";
		String lname = pamap.get("lname")+"";
		String jlname = pamap.get("jlname")+"";
		
		if (StringUtils.isNotBlank(name)) {
			sql+=" and chc_cust_name like '%"+name+"%'";//根据客户名称搜索
		}
		if (StringUtils.isNotBlank(title)) {
			sql+=" and chc_title like '%"+title+"%'";//跟据概要搜索
		}
		if (StringUtils.isNotBlank(jlname)) {
			sql+=" and chc_due_to like '%"+jlname+"%'";//被指派人
		}
		if (StringUtils.isNotBlank(lname)) {
			sql+=" and chc_linkman like '%"+lname+"%'";//联系人
		}
		
		return super.executeQuery(sql, pageBean);
	}
	
	public  List<Map<String,Object>> zhuan( List<Map<String,Object>> mapMap ,Map<String, Object> user){
		List<Map<String,Object>> la = new ArrayList<>();
		Object obj = user.get("role_id");//r001,r002
		String role_id = obj+"";
		String[] split = role_id.split(",");
		boolean f = false;
		for (String s : split) {
			if("r003".equals(s) ) {
				f = true;
			}
		}
		if(f) {
			for (Map<String, Object> map : mapMap) {
			
				if(!"1".equals(map.get("chc_status")+"")) {
					la.add(map);
				}
				
			}
		}
		else {
			for (Map<String, Object> map : mapMap) {
				
				la.add(map);
				
			}
		}
		return la;
	}
	
//	public static void main(String[] args) throws InstantiationException, IllegalAccessException, SQLException {
//		
//		MarketingDao md = new MarketingDao();
//		Map<String, Object> ma = new HashMap<>();
//		ma.put("role_id", "r001,r003");
//		
//		List<Map<String, Object>> list = md.list(null, null);
//		System.out.println(list);
//		List<Map<String, Object>> zhuan = md.zhuan(list, ma);
//		System.out.println(zhuan);
//	}
	
	/**
	 * 创建营销机会
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	public int addMark(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		String date = new Date().toLocaleString();
		String sql ="insert into sal_chance(chc_source,chc_cust_name,chc_title,chc_rate,chc_linkman,chc_tel,chc_desc,user_id,chc_create_by,chc_create_date) values(?,?,?,?,?,?,?,?,?,str_to_date('"+date+"','%Y-%c-%e %H:%i:%S'))";
		return super.executeUpdate(sql, new String[] {"chc_source","chc_cust_name","chc_title","chc_rate","chc_linkman","chc_tel","chc_desc","user_id","chc_create_by"}, pamap);
	}
	
	
	/**
	 * 删除
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws IllegalArgumentException 
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 */
	public int delMark(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql="delete from sal_chance where chc_id=?";
		return super.executeUpdate(sql, new String[] {"chc_id"}, paMap);
	}
	
	
	/**
	 * 修改
	 * @param paMap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editMark(Map<String, String[]> paMap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		
		int n = 1;
		System.out.println(paMap.get("chc_due_id"));
		if(paMap.get("chc_due_id")!=null) {
			n = 2;
		}
		String date = new Date().toLocaleString();
		String sql = "update sal_chance set chc_source=?,chc_cust_name=?,chc_title=?,chc_rate=?,chc_linkman=?,chc_tel=?,chc_desc=?,chc_due_id=?,chc_due_to=?,chc_due_date=str_to_date('"+date+"','%Y-%c-%e %H:%i:%S'),chc_status="+n+" where chc_id=?";
		return super.executeUpdate(sql, new String[] {"chc_source","chc_cust_name","chc_title","chc_rate","chc_linkman","chc_tel","chc_desc","chc_due_id","chc_due_to","chc_id"}, paMap);
	}

	
}
