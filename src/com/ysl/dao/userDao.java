package com.ysl.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ysl.entity.User;
import com.ysl.toolsBean.ChangeTime;
import com.ysl.toolsBean.DB;

public class userDao {
	public List<User> getUserId() throws SQLException{
		String sql="select * from tb_bloguser order by id desc";
		List<User> topList=null;
		
		DB mydb=new DB();
		mydb.dops(sql,null);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			topList=new ArrayList<User>();
			while(rs.next()){
				User single=new User();
				single.setId(rs.getInt(1));
				single.setUserName(rs.getString(2));
				single.setUserMotto(rs.getString(4));
				single.setUserCTTime(ChangeTime.dateTimeChange(rs.getTimestamp(6)));
				single.setUserBlogName(rs.getString(5));
				single.setUser_pro(rs.getString(7));
				topList.add(single);
			}
		}
		return topList;
	}
	
	public List getMasterList() throws SQLException{
		String sql="select * from tb_bloguser order by user_blogname";		
		List masterlist=getList(sql,null);
		return masterlist;
	}
	public User getMasterSingle(int id) throws SQLException{
		String sql="select * from tb_bloguser where id=?";
		Object[] params={id};
		
		User single=(User)(getList(sql,params).get(0));
		return single;
	}
	/*
	 * 根据用户名和密码、身份查询用户信息
	 */
	public User getLogoner(Object[] params) throws SQLException{
		User logoner=null;
		String sql="select * from tb_bloguser where name=? and password=? and user_pro=?";
		List list=getList(sql,params);
		if(list!=null&&list.size()!=0)
			logoner=(User)list.get(0);
		return logoner;		
	}
	private static List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.dops(sql,params);
		
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				User single=new User();
				single.setId(rs.getInt(1));
				single.setUserName(rs.getString(2));
				single.setUserPswd(rs.getString(3));
				single.setUserMotto(rs.getString(4));
				single.setUserBlogName(rs.getString(5));
				single.setUserCTTime(ChangeTime.dateTimeChange(rs.getTimestamp(6)));
				single.setUser_pro(rs.getString(7));
				single.setUser_area(rs.getString(8));
				list.add(single);
			}
			rs.close();
		}
		mydb.closed();
		return list;
	}
	/*
	 * 更新用户信息
	 * */
	public int updateInfo(Object[] params,String flags) throws SQLException {
		String sql="";
		if(flags=="false") {
			sql="update tb_bloguser set user_desc=?,user_blogname=?,user_pro=? where id=?";
		}else {
			sql="update tb_bloguser set user_pro=? where id=?";
		}
		DB mydb=new DB();
		int flag = mydb.dops(sql,params);
		return flag;
	}
	
	
	/*
	 * 用户注册
	 */
	public int insert(Object[] params) throws SQLException{
		String sql="insert into tb_bloguser(name,password,user_stime,phone) values(?,?,?,?)";
		DB mydb=new DB();
		mydb.dops(sql, params);
		int i=mydb.getCount();
		mydb.closed();
		return i;
	}
	
	
	/**
	 * 删除用户信息（用户id）
	 */
	public int deleteInfo(String id) {
		String sql="delete from tb_bloguser where id=?";
		Object[] params={id};
		DB mydb=new DB();
		int flag=mydb.dops(sql, params);
		return flag;
	}
	/*
	 * 根据用户id查询用户博客名称
	 */
	public static User searchBlogName(String id) throws SQLException {
		String sql = "select * from tb_bloguser where id=?";
		int ids = Integer.parseInt(id);
		Object[] params = {ids};
		User logoner=null;
		List list=getList(sql,params);
		if(list!=null&&list.size()!=0)
			logoner=(User)list.get(0);
		return logoner;
	}
	/*
	 * 更新用户已经创建博客空间
	 * */
	public static int updateArea(int id) {
		String sql="update tb_bloguser set user_area='1' where id=?";
		Object[] params = {id};
		DB mydb=new DB();
		int flag=mydb.dops(sql, params);
		return flag;
	}
}
