package com.crm.service.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.crm.base.dao.JsonBaseDao;
import com.crm.base.entity.PageBean;
import com.crm.base.util.JsonUtils;
import com.crm.base.util.StringUtils;

public class ServiceDao extends JsonBaseDao {
	/**
	 * 总的
	 * @param svr_type
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> listDict(String svr_type) throws Exception{
		String sql = "select * from bas_dict  where dict_value = '"+svr_type+"' and dict_type = 7 ";
		
		return super.executeQuery(sql, null);
	}
	
	public List<Map<String, Object>> querygd(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_service where svr_status = 4  ";
		String svr_cust_name = JsonUtils.getParamVal(mapMap, "svr_cust_name");
		String svr_title =JsonUtils.getParamVal(mapMap, "svr_title");
		String svr_type = JsonUtils.getParamVal(mapMap, "svr_type");
		
		if(StringUtils.isNotBlank(svr_cust_name)) {
			sql += " and  svr_cust_name like '%"+svr_cust_name+"%' ";
		}
		if(StringUtils.isNotBlank(svr_title)) {
			sql += " and  svr_title like '%"+svr_title+"%' ";
		}
		if(StringUtils.isNotBlank(svr_type)&& !"-1".equals(svr_type)) {
			sql += " and  svr_type = "+svr_type+" ";
		}
		
		return super.executeQuery(sql, pageBean);
	}
	/**
	 * 查
	 * @param mapMap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String, Object>> cxkh(Map<String, String[]> mapMap,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_customer where true";
		return super.executeQuery(sql, pageBean);
	}
	public List<Map<String, Object>> query(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_service where svr_status in(2,3) and svr_deal_id = "+user_id+" ";
		String svr_cust_name = JsonUtils.getParamVal(mapMap, "svr_cust_name");
		String svr_title =JsonUtils.getParamVal(mapMap, "svr_title");
		String svr_type = JsonUtils.getParamVal(mapMap, "svr_type");
		String svr_status = JsonUtils.getParamVal(mapMap, "svr_status");
		
		if(StringUtils.isNotBlank(svr_cust_name)) {
			sql += " and  svr_cust_name like '%"+svr_cust_name+"%' ";
		}
		if(StringUtils.isNotBlank(svr_title)) {
			sql += " and  svr_title like '%"+svr_title+"%' ";
		}
		if(StringUtils.isNotBlank(svr_type)&& !"-1".equals(svr_type)) {
			sql += " and  svr_type = "+svr_type+" ";
		}
		if(StringUtils.isNotBlank(svr_status) && !"-1".equals(svr_status)) {
			sql += " and  svr_status = "+svr_status+"";
		}
		return super.executeQuery(sql, pageBean);
	}
	
	public List<Map<String, Object>> queryfk(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_service where svr_status in(3,4) and svr_deal_id = "+user_id+" ";
		String svr_cust_name = JsonUtils.getParamVal(mapMap, "svr_cust_name");
		String svr_title =JsonUtils.getParamVal(mapMap, "svr_title");
		String svr_type = JsonUtils.getParamVal(mapMap, "svr_type");
		String svr_status = JsonUtils.getParamVal(mapMap, "svr_status");
		
		if(StringUtils.isNotBlank(svr_cust_name)) {
			sql += " and  svr_cust_name like '%"+svr_cust_name+"%' ";
		}
		if(StringUtils.isNotBlank(svr_title)) {
			sql += " and  svr_title like '%"+svr_title+"%' ";
		}
		if(StringUtils.isNotBlank(svr_type)&& !"-1".equals(svr_type)) {
			sql += " and  svr_type = "+svr_type+" ";
		}
		if(StringUtils.isNotBlank(svr_status) && !"-1".equals(svr_status)) {
			sql += " and  svr_status = "+svr_status+"";
		}
		return super.executeQuery(sql, pageBean);
	}
	public List<Map<String, Object>> queryfp(Map<String, String[]> mapMap,PageBean pageBean , String user_id) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from cst_service where svr_status in(2,1) ";
		String svr_cust_name = JsonUtils.getParamVal(mapMap, "svr_cust_name");
		String svr_title =JsonUtils.getParamVal(mapMap, "svr_title");
		String svr_type = JsonUtils.getParamVal(mapMap, "svr_type");
		String svr_status = JsonUtils.getParamVal(mapMap, "svr_status");
		
		if(StringUtils.isNotBlank(svr_cust_name)) {
			sql += " and  svr_cust_name like '%"+svr_cust_name+"%' ";
		}
		if(StringUtils.isNotBlank(svr_title)) {
			sql += " and  svr_title like '%"+svr_title+"%' ";
		}
		if(StringUtils.isNotBlank(svr_type)&& !"-1".equals(svr_type)) {
			sql += " and  svr_type = "+svr_type+" ";
		}
		if(StringUtils.isNotBlank(svr_status) && !"-1".equals(svr_status)) {
			sql += " and  svr_status = "+svr_status+"";
		}
		return super.executeQuery(sql, pageBean);
	}
	/**
	 * 字典==查客户经理
	 * r005
	 * @param pamap
	 * @param pageBean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public List<Map<String,Object>> selectfp(Map<String, String[]> pamap ,PageBean pageBean) throws InstantiationException, IllegalAccessException, SQLException{
		String sql = "select * from 	(select a.user_id,a.user_name,(select role_id from sys_user_role where user_id =  a.user_id and role_id = 'r003')  role_id  from sys_user a where a.user_flag = 1  )  b where b.role_id is not null";
		return super.executeQuery(sql, pageBean);
	}
	/**
	 * 修改
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editService(Map<String, String[]> pamap ) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String sql = "update cst_service set svr_type=?,svr_title=?,cust_no=?,svr_cust_name=?,svr_status=?,svr_request=?,svr_create_id=?,svr_create_name=?,svr_create_date=?,svr_due_id=?,svr_due_to=?,svr_due_date=?,svr_deal=?,svr_deal_id=?,svr_deal_name=?,svr_deal_date=?,svr_result=?,svr_satisfy=? where svr_id=?";
		
		return super.executeUpdate(sql,new String[] {"svr_type","svr_title","cust_no","svr_cust_name","svr_status","svr_request","svr_create_id","svr_create_name","svr_create_date","svr_due_id","svr_due_to","svr_due_date","svr_deal","svr_deal_id","svr_deal_name","svr_deal_date","svr_result","svr_satisfy","svr_id"}, pamap);
	}
	/**
	 * 增加
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 * @throws InstantiationException
	 */
	public int addService(Map<String, String[]> pamap ) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException, InstantiationException {

		String  sql ="insert into cst_service(svr_status,svr_title,cust_no,svr_cust_name,svr_type,svr_request,svr_create_id,svr_create_name,svr_create_date) values(1,?,?,?,?,?,?,?,?) ";
		return super.executeUpdate(sql, new String[] {"svr_title","cust_no","svr_cust_name","svr_type","svr_request","svr_create_id","svr_create_name","svr_create_date"}, pamap);
	}
	/**
	 * 删
	 * @param pamap`
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int delService(Map<String, String[]> pamap) throws InstantiationException, IllegalAccessException, SQLException, NoSuchFieldException, SecurityException, IllegalArgumentException{
		String sql="delete from cst_service where svr_id=?";
		return super.executeUpdate(sql, new String[] {"svr_id"}, pamap);
	}
	
	/**
	 * 修改服务状态为2-->已分配
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editsvrStatus(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String d = new Date().toLocaleString();
		String sql = "update cst_service set svr_status = 2,svr_due_id =?,svr_due_to =?,svr_due_date = str_to_date('"+d+"','%Y-%c-%e %H:%i:%S'),svr_deal_id =?,svr_deal_name =? where svr_id = ?";
		
		
		return super.executeUpdate(sql, new String[] {"svr_due_id","svr_due_to","svr_deal_id","svr_deal_name","svr_id"}, pamap);
	}
	/**
	 *  修改服务状态为3-->已处理
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	
	public int editsvrStatus2(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		String d = new Date().toLocaleString();
		String sql ="update cst_service set svr_status = 3,svr_deal = ?,svr_deal_date = str_to_date('"+d+"','%Y-%c-%e %H:%i:%S') where svr_id = ?";
		return super.executeUpdate(sql, new String[] {"svr_deal","svr_id"}, pamap);
		
	}
	/**
	 * 修改服务状态为4-->已归档
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
	public int editsvrStatus3(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		
		String sql = "update cst_service set svr_status = 4,svr_result = ?,svr_satisfy = ? where svr_id = ?";
		
		return super.executeUpdate(sql, new String[] {"svr_result","svr_satisfy","svr_id"}, pamap);
	}
	/**
	 * 反馈满意度《3
	 * @param pamap
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws SQLException
	 */
public int editsvrStatus4(Map<String, String[]> pamap) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, SQLException {
		
		String sql = "update cst_service set svr_status = 1,svr_due_id = null,svr_due_to= null,svr_due_date = null,svr_deal = null,svr_deal_id = null,svr_deal_name = null,svr_deal_date = null,svr_result= null,svr_satisfy = null where svr_id = ?";
		
		return super.executeUpdate(sql, new String[] {"svr_id"}, pamap);
	}
	/**
	 * 查询服务类型
	 * @param paMap
	 * @param pb
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> listZd(Map<String, String[]> paMap,PageBean pb) throws Exception{
		String sql = "select * from bas_dict where 1=1  and dict_type_name ='服务类型'";
		
		return super.executeQuery(sql, pb);
	}
	public List<Map<String, Object>> listFk(Map<String, String[]> paMap,PageBean pb) throws Exception{
		String sql = "select * from bas_dict where 1=1  and dict_type_name ='客户满意度'";
		
		return super.executeQuery(sql, pb);
	}
}
