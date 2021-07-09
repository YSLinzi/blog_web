package com.ysl.toolsBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
	private Connection con;
	private PreparedStatement ps;
	private String user="root";
	private String password="你的密码";
	private String className="com.mysql.cj.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/bloguser?serverTimezone=Asia/Shanghai";

	/** 构造方法，在该方法中加载数据库驱动  */
	public DB(){
		try{
			Class.forName(className);
		}catch(ClassNotFoundException e){
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}

	/**创建数据库连接*/
	public Connection getCon(){
		if(con==null){
			try {
				con=DriverManager.getConnection(url,user,password);
			} catch (SQLException e) {
				System.out.println("创建数据库连接失败！");
				con=null;
				e.printStackTrace();
			}			
		}
		return con;
	}
	public int dops(String sql,Object[] params){
		if(sql!=null&&!sql.equals("")){
			if(params==null)
				params=new Object[0];			
			getCon();
			if(con!=null){
				try{		
					System.out.println(sql);
					ps=con.prepareStatement(sql);
					for(int i=0;i<params.length;i++){
						ps.setObject(i+1,params[i]);
					}
					ps.execute();
				}catch(SQLException e){
					System.out.println("dops()方法出错！");
					e.printStackTrace();
					return 0;
				}				
			}			
		}
		return 1;
	}
	
	/**
	 * @功能：获取调用dops()方法执行查询操作后返回的ResultSet结果集
	 * @返回值：ResultSet
	 * @throws SQLException
	 */
	public ResultSet getRs() throws SQLException{
		return ps.getResultSet();		
	}
	/**
	 * @功能：获取调用dops()方法执行更新操作后返回影响的记录数
	 * @返回值：int
	 * @throws SQLException
	 */
	public int getCount() throws SQLException{
		return ps.getUpdateCount();		
	}
	/**
	 * @功能：释放PrepareStatement对象与Connection对象
	 */
	public void closed(){
		try{
			if(ps!=null)
				ps.close();			
		}catch(SQLException e){
			System.out.println("关闭ps对象失败！");
			e.printStackTrace();
		}
		try{
			if(con!=null){
				con.close();
			}
		}catch(SQLException e){
			System.out.println("关闭con对象失败！");
			e.printStackTrace();
		}
	}
}
