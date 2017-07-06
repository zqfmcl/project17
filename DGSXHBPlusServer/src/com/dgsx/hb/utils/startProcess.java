package com.dgsx.hb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class startProcess {
	private static String BDName;
	private static String WfentryName;
	
	public void setBDName(String name){
		BDName=name;
	}
	public void setWfentryName(String name){
		WfentryName=name;
	}
	
	public static  void startPro(Map<String,Object> map,int userid,int stepid,String cyrStr){
		String keyStr="";
		//String valueStr="";
		List<Object> values=new ArrayList();
		Set set=map.entrySet();
		for(Iterator iter=set.iterator();iter.hasNext();){
			Map.Entry entry=(Map.Entry)iter.next();
			String key=(String)entry.getKey();
			keyStr+=","+key;
			values.add(entry.getValue());
		}
		String sql="insert into "+BDName+" (id,instid"+keyStr+") values (func_nextid('"+BDName+"'),seq_os_wfentry.nextval";
		//.getName().equals("java.lang.String")
		for(int i=0;i<values.size();i++){
				if(values.get(i) instanceof String){
					sql=sql+",'"+values.get(i)+"'";
				}else{
					sql=sql+","+values.get(i);
				}
		}
		sql=sql+")";
		//System.out.println(sql);
		String sql1="insert into OS_WFENTRY (id,Name,State,Initiator,Init_Date) values (seq_os_wfentry.currval,'"+WfentryName+"',"+1+",'"+userid+"',sysdate)";
		String sql2="insert into os_currentstep (id,entry_id,step_id,owner,start_date,status,flag) values (seq_os_currentsteps.nextval,seq_os_wfentry.currval,"+stepid+",'"+cyrStr+"',sysdate,'待处理',0)";
		//������ݿ�����
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		//ResultSet resultSet=null;
		try{
			//������ݿ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e){
			//System.out.println("������ʧ��");
			System.out.println(e.getMessage());
		}
		try{
			connection=DriverManager.getConnection("jdbc:oracle:thin:@218.56.106.155:1521:orcl","liuq","apexsoft");
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			preparedStatement=connection.prepareStatement(sql1);
			preparedStatement.executeUpdate();
			preparedStatement=connection.prepareStatement(sql2);
			preparedStatement.executeUpdate();
			//resultSet.close();
			preparedStatement.close();
			connection.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	
	}
	
	public static void updateProStep(int entryid,int stepid,int actionid,String owners){
////		conn con=new conn();
//		String sql="update OS_CURRENTSTEP set step_id=?,action_id=?,owner=? where entry_id=?";
//		Object[] params={stepid,actionid,owners,entryid};
//		con.executeUpdate(sql,params);
	}
	
	public static String getCyrStr(String RoleName,String OrgName){
		String sql="";
		//conn con=new conn();
		ResultSet rs=null;
		if(RoleName==null&&OrgName!=null){
			sql="select userid from lbmember where orgid=(select id from lborganization where name='"+OrgName+"')";
		}else if(RoleName!=null&&OrgName==null){
			sql="select userid from lbmember where roleid=(select id from lbrole where name='"+RoleName+"')";
		}else if(RoleName!=null&&OrgName!=null){
			sql="select userid from lbmember where roleid=(select id from lbrole where name='"+RoleName+"') and orgid=(select id from lborganization where name='"+OrgName+"')";
		}
		
		String cyrs="";
		int num=0;
		try{
			rs=null;//con.executeQueryRS(sql,null);
			while(rs.next()){
				num++;
				if(num==1){
					cyrs=""+rs.getObject(1);
				}else{
					cyrs=cyrs+","+rs.getObject(1);
				}
			}
		}catch(SQLException e){
			
		}
			
		
		return cyrs;
	}
	
	public static void main(String[] args){
		//��:
//		BDName="WO_YGLC";
//		WfentryName="WF_YGLCGZL";
//		Map<String,Object> map=new HashMap<String,Object>();
//		map.put("cs1","test行不行");
//		map.put("cs2","test test用户 ");
//		startPro(map,0,5,"0,1");
		String str=getCyrStr("普通","test");
		System.out.println(str);
	}
}
