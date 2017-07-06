package com.dgsx.hb.utils;

import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DbHelper {
	public static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	static ComboPooledDataSource cpds = null;
	static {
		// 这里有个优点，写好配置文件，想换数据库，简单
		cpds = new ComboPooledDataSource("oracle");// 这是oracle数据库
		// cpds = new ComboPooledDataSource("mysql");// 这是mysql数据库
	}

	/**
	 * 获得数据库连接
	 * 
	 * @return Connection
	 */
	public static Connection getConnection() {
		try {
			return cpds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 数据库关闭操作
	 * 
	 * @param conn
	 * @param st
	 * @param pst
	 * @param rs
	 */
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
	 * 测试DBUtil类
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
//		List<String> sqls=new ArrayList<String>();
//		sqls.add("update wo_xsxxxg set wx='aaa11' where id='1'");
//		sqls.add("update wo_xsxxxg set wx='bbb22' where id='2'");
//		sqls.add("update wo_xsxxxg set wx='ccc33' where id='3'");
//		int[] a=updates(sqls);
//		System.out.println(queryForString("select qymc from e_qyjbxx where id=50"));
		
		System.out.println(queryAClob("select * from os_workflowdefs where wf_name='"+"WF_XSQYSQGZL"+"'", "WF_DEFINITION,WF_LAYOUT").get("WF_DEFINITION"));
//		System.out.println(queryForString("select name from tuser where userid='admin'"));
//		List<Map<String, Object>> list =queryForTable("select userid,name from tuser");
//		for(int i=0;i<list.size();i++){
//			Map<String, Object> e=list.get(i);
//		System.out.println(getConnection().toString());
//			System.out.println(queryForString("select xh from e_sfxymd t where id=2"));
//		}
	}
	/**
	 * 批量更改，仅可执行增删改
	 * @param sqls
	 * @return
	 */
	public static int[] updates(List<String> sqls){
		Connection conn = getConnection();
		Statement stmt = null;
		try {
			DatabaseMetaData md=getConnection().getMetaData();
			if(md.supportsBatchUpdates()){
				conn.setAutoCommit(false);
				stmt = conn.createStatement();
				for(String s:sqls){
					System.out.println(sdf.format(new Date())+" updates_sql:"+s);
					stmt.addBatch(s);
				}
				try{
					int[] a=stmt.executeBatch();
					conn.commit();
					return a;
				}catch (SQLException e) {
					if(conn!=null){
						conn.rollback();
					}
				}finally{
					conn.setAutoCommit(true);
				}
			}else{
				throw new SQLException("不支持批量更新！");//不支持批量更新
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("bbb");
			e.printStackTrace();
		}finally{
			if(stmt!=null)stmt=null;
			close(conn, null, null);
		}
		return new int[]{};
	}
/**
 * 实现MD5加密
 * @param plainText 明文
 * @return 32位密文
 */
	public static String getMd5(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			try {
				md.update(plainText.getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			byte b[] = md.digest();
			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			// 32位加密
			return buf.toString();
			// 16位的加密
			// return buf.toString().substring(8, 24);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}

	}
	/**
	 * 查询数量
	 * @param sql
	 * @return
	 */
	public static int queryCountForInt(String sql){
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
		}finally{
			close(conn, stmt, rs);
		}
		
		return -1;
	}
	/**
	 * 更新
	 * @param sql
	 * @return
	 */
	public static boolean update(String sql){
		System.out.println(sdf.format(new Date())+" update_sql:"+sql);
		
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		try {
			stmt = conn
					.prepareStatement(sql);
			return (stmt.executeUpdate()>0);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(conn, stmt, null);
		}
		
		return false;
	}
	/**
	 * 查询字符串
	 * @param sql
	 * @return
	 */
	public static String queryForString(String sql){
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
		}finally{
			close(conn, stmt, rs);
		}
		
		return null;
	}
	
	/**
	 * 获取一列数据
	 * @param sql
	 * @return
	 */
	public static List queryForList(String sql){
		System.out.println(sdf.format(new Date())+" queryForList_sql:"+sql);
		List list=new ArrayList();
		
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn
					.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getObject(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(conn, stmt, rs);
		}
		
		
		return list;
	}
	
	
	/**
	 * 获取数据表
	 * @param sql
	 * @return
	 */
	public static List<Map<String, Object>> queryForTable(String sql){
		System.out.println(sdf.format(new Date())+" queryForTable_sql:"+sql);
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd=null;
		try {
			stmt = conn
					.prepareStatement(sql);
			rs = stmt.executeQuery();
			rsmd = rs.getMetaData();
			while (rs.next()) {
				Map<String, Object> e=new HashMap<String, Object>();
				for(int i=1;i<=rsmd.getColumnCount();i++){
					e.put(rsmd.getColumnName(i), rs.getObject(i));
				}
				list.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(conn, stmt, rs);
		}
		
		return list;
	}
	/**
	 * 查询一行数据
	 * @param sql
	 * @return
	 */
	public static Map<String,Object> queryARow(String sql){
		System.out.println(sdf.format(new Date())+" queryARow_sql:"+sql);
		Map<String, Object> m=null;
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd=null;
		try {
			stmt = conn
					.prepareStatement(sql);
			rs = stmt.executeQuery();
			rsmd = rs.getMetaData();
			if (rs.next()) {
				m=new HashMap<String, Object>();
				for(int i=1;i<=rsmd.getColumnCount();i++){
					m.put(rsmd.getColumnName(i), rs.getObject(i));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(conn, stmt, rs);
		}
		
		return m;
	}
	
	/**
	 * 查询带CLOB的一条记录，
	 * @param sql
	 * @param clobnames 字段类型为CLOB的字段名称，clobfield1,clobfield2..
	 * @return
	 */
	public static Map<String,Object> queryAClob(String sql,String clobnames){
		System.out.println(sdf.format(new Date())+" queryAClob_sql:"+sql);
		Map<String, Object> m=null;
		Connection conn = getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd=null;
		try {
			stmt = conn
					.prepareStatement(sql);
			rs = stmt.executeQuery();
			rsmd = rs.getMetaData();
			if (rs.next()) {
				m=new HashMap<String, Object>();
				for(int i=1;i<=rsmd.getColumnCount();i++){
					if(clobnames.indexOf(rsmd.getColumnName(i))!=-1){
						Clob clob=rs.getClob(rsmd.getColumnName(i));
					    String detailinfo = "";
					    if(clob != null){
					     detailinfo = clob.getSubString((long)1,(int)clob.length());
					    }
					    m.put(rsmd.getColumnName(i), detailinfo);
					}else{
						m.put(rsmd.getColumnName(i), rs.getObject(i));
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(conn, stmt, rs);
		}
		return m;
	}
}
