package com.lckj.wechat.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DBHelper {
	public static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private static String url="jdbc:oracle:thin:@218.56.106.138:1521:orcl";    
	//system为登陆oracle数据库的用户名     
	private static String user="mayy";    
	//manager为用户名system的密码     
	private static String password="apexsoft";    
	public static void main(String[] args) {
	    //连接数据库的方法     
	     //测试能否与oracle数据库连接成功     
		DBHelper basedao=new DBHelper();    
		System.out.println(basedao.queryCountForInt("select count(1) from tuser where userid='admin'"));
	}
	private Connection getConnection(){    
		try {    
			//初始化驱动包     
			Class.forName("oracle.jdbc.driver.OracleDriver");    
			//根据数据库连接字符，名称，密码给conn赋值     
			return DriverManager.getConnection(url, user, password);    
			
		} catch (Exception e) {    
			// TODO: handle exception     
			e.printStackTrace();    
			return null;
		}    
	}  
	
	public static void close(Connection conn, PreparedStatement pst,
			ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pst != null) {
			try {
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 查询数量
	 * @param sql
	 * @return
	 */
	public int queryCountForInt(String sql){
		System.out.println(sdf.format(new Date())+" queryCountForInt_sql:"+sql);
		
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn
					.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}else return -1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(conn, stmt, rs);
		return -1;
	}
	/**
	 * 更新
	 * @param sql
	 * @return
	 */
	public boolean update(String sql){
		System.out.println(sdf.format(new Date())+" update_sql:"+sql);
		
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		try {
			stmt = conn
					.prepareStatement(sql);
			return stmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(conn, stmt, null);
		return false;
	}
	/**
	 * 查询字符串
	 * @param sql
	 * @return
	 */
	public String queryForString(String sql){
		System.out.println(sdf.format(new Date())+" queryForString_sql:"+sql);
		
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn
					.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}else return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(conn, stmt, rs);
		return null;
	}
}
