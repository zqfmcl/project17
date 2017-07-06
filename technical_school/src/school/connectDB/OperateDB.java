package school.connectDB;


import java.sql.CallableStatement;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.sql.rowset.CachedRowSet;
import com.sun.rowset.CachedRowSetImpl;

//import school.StringToDate.StringToDate;
import school.javabean.Article;
import school.javabean.Tittle;

public class OperateDB {

    // 定义连接所需的字符串
    // 192.168.0.X是本机地址(要改成自己的IP地址)，1521端口号，XE是精简版Oracle的默认数据库名
   // private static String USERNAMR = "apexu_connotation";
   // private static String PASSWORD = "apexsoft";
   // private static String DRVIER = "oracle.jdbc.OracleDriver";
   // private static String URL = "jdbc:oracle:thin:@218.56.106.155:1521:orcl";

    // 创建一个数据库连接
    Connection connection = null;
    // 创建预编译语句对象，一般都是用这个而不用Statement
    PreparedStatement pstm = null;
    // 创建一个结果集对象
    ResultSet rs = null;
    //创建一个非连接的结果集
    CachedRowSet crs=null;
    public OperateDB() {
		// TODO Auto-generated constructor stub
    	
    	connection=this.getConnection();
    	
	}
 

    /**
     * 向数据库中增加数据
     * 首先获取表内数据总数,总数+1为新增数据的id值
     * @param stuName:学生姓名
     * @param gender:学生性别,1表示男性,2表示女性
     * @param age:学生年龄
     * @param address:学生住址
     */
    public static void main(String args[]) {
	    //OperateDB operateDB=new OperateDB();
	    //CachedRowSet crs =operateDB.select_menu();
	  
		
	}
    public float select_JinDu() {
    	float schedule=0;
    	       
    	String sql = "select * from CHART_JINDU"; //sql 语句

        try {            
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
            	schedule=rs.getFloat(1);
			}
           
           
           
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        }
        //DB_data.remove(DB_data.size()-1);
		return schedule;
    } 
    
    public CachedRowSet select_menu() {
    	        
    	String sql = "select * from T_WZLM where LMFL=0 ORDER BY MYORDER"; //sql 语句

        try {            
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            crs = new CachedRowSetImpl();
            crs.populate(rs);
           
           
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        }
        //DB_data.remove(DB_data.size()-1);
		return crs;
    } 
  
    /**
     * 
     * 
     * 从数据库中选择出某一页的文章数据
     * 
     * 
     */
   
    public CachedRowSet select_article(int now_page_ID,String LM,int page_size,int all_article_num) //为每个栏目写的分页提取
    {
    	String sql=null;
        
        int num=all_article_num-(now_page_ID-1)*page_size;
        
        if (LM.equals("JSDT_VIEW")) {
            sql = "select * from(select * from(select * from(select * from "+LM+" where TSJSDT=0  ORDER BY FBSJ asc)where ROWNUM <=? ) order by FBSJ desc) where  ROWNUM<=?"; 
		}
        else {
            sql = "select * from(select * from(select * from(select * from "+LM+" ORDER BY FBSJ asc)where ROWNUM <=? ) order by FBSJ desc) where  ROWNUM<=?"; 

		}
        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, num);
            pstm.setInt(2,page_size);
            rs = pstm.executeQuery();
            crs = new CachedRowSetImpl();
            crs.populate(rs);
          
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        }

		return crs;
    }
    
    public CachedRowSet select_article(int now_page_ID,int page_size,int all_article_num,String content)//为搜素视图单独写的分页提取
    {
       
        int num=all_article_num-(now_page_ID-1)*page_size;
        
        String sql = "select * from(select * from(select * from(select * from search_view where BT like '%"+content+"%' ORDER BY FBSJ asc)where ROWNUM <=? ) order by FBSJ desc) where  ROWNUM<=?"; 

        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, num);
            pstm.setInt(2,page_size);
            rs = pstm.executeQuery();
            crs = new CachedRowSetImpl();
            crs.populate(rs);
          
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        }

		return crs;
    }
    
    public CachedRowSet select_article(int now_page_ID,String LM,int page_size,int all_article_num,int SCID) {
 
	  	
        int num=all_article_num-(now_page_ID-1)*page_size;
        
        String sql = "select * from(select * from(select * from(select * from "+LM+" where ZLM=? ORDER BY ID desc)where ROWNUM <=? ) order by ID asc) where  ROWNUM<=?"; 

        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, SCID);
            pstm.setInt(2, num);
            pstm.setInt(3,page_size);
            rs = pstm.executeQuery();
            crs=new CachedRowSetImpl();
            crs.populate(rs);
          
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        }

		return crs;
    }
    
    public CachedRowSet select_data(String db_name,int num)//普通栏目的行提取
    {
	  	String sql=null;
    	
    	
    	if (db_name.equals("JSDT_VIEW"))//如果是建设动态视图
    	{
              sql =  "select * from(select * from "+db_name+" where TSJSDT=0 order by FBSJ desc) where rownum<=?"; 
  		}
          else {
              sql =  "select * from(select * from "+db_name+" order by FBSJ desc) where rownum<=?";

  		}
        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1,num);
            rs = pstm.executeQuery();  
            crs = new CachedRowSetImpl();
            crs.populate(rs);
     
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }

		return crs;
    }
       
    public CachedRowSet select_data(String db_name,int num,int exceptID)//为有置顶图片栏目单独写的行提取
    {
    	
        //String sql = "select * from "+db_name+" where rownum<=? and ID!=? ORDER BY ID desc"; //sql 语句
    	String sql="select * from(select * from "+db_name+" where ID!=? order by FBSJ desc) where rownum<=?";
        //System.out.println(sql);

        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, exceptID);
            pstm.setInt(2,num);
            rs = pstm.executeQuery();
            crs = new CachedRowSetImpl();
            crs.populate(rs);
     
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }

		return crs;
    }
      
    public CachedRowSet select_data_to_roll(String db_name,int num)//轮播栏数据提取
    {
		
        String sql = "select *from(select * from "+db_name+" where YESORNO=0 order by ID desc) where rownum<=?"; //sql 语句
        
        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1,num);
            rs = pstm.executeQuery();
            crs = new CachedRowSetImpl();
            crs.populate(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 

		return crs;
    }
    
    public Tittle select_data_column_top_image(String db_name) {
        Tittle tittle=new Tittle();

    	
    	
        String sql ="select * from(select * from "+db_name+" where ZDTP=0 ORDER BY FBSJ desc) where rownum<=1";//sql 语句

        //System.out.println(sql);

        try {
        	       	
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
				
			
            tittle.setTittle(rs.getString("BT"));
            tittle.setImage_src(rs.getString("ZDTPDZ"));
            tittle.setID(rs.getInt("ID"));
            tittle.setSummary(rs.getString("ZY"));         
            }
            
        	
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }

		return tittle;
    }
    
    public String select_author(int authorID) {
    	String name=null;
    	
    	 String sql = "select NAME from Tuser where ID=?"; //sql 语句

        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, authorID);
            rs = pstm.executeQuery();
            while(rs.next()){
            	name=rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }

		return name;
    }
      
    public Article select_detail(String db_name,int num) {
	  
    	int authorID = 0;
    	String authorName=null;
        Article article=new Article();
        String sql = "select FBZ,ZW,BT, to_char(FBSJ,'yyyy-mm-dd hh24:mi:ss') as FBSJ,YDCS,FJ,SSBM from "+db_name+" where ID=?"; //sql 语句
        //String sql2 = "select NAME from Tuser where ID=?"; //sql 语句


        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, num);
            rs = pstm.executeQuery();
            while (rs.next()) {
            	authorID=rs.getInt("FBZ");
            	article.setContent(rs.getString("ZW"));
            	article.setTittle(rs.getString("BT"));
            	article.setDate(rs.getString("FBSJ"));
            	article.setClickNum(rs.getInt("YDCS"));
            	article.setAttachment(rs.getString("FJ"));
            	article.setDepartment(rs.getString("SSBM"));
                
			}          
            authorName=select_author(authorID);
            article.setEditor(authorName);
        }
           catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 
     

		return article;
    }

    /**
     * 
     * 统计某一栏目所有文章个数
     * @return
     */
    public int count_article_num(String LM){
    	
    	int n = 0;//文章个数
        String sql = "select count(*) from "+LM; //sql 语句
        try {            
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            rs.next();
            n= rs.getInt(1);
           	//将数据从结果集取出存入集合arraylist
          
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 
    	return n;
    }
    
    public int count_article_num_search_view(String content){
    	
    	int n = 0;//文章个数
        String sql = "select count(*) from search_view"+" where BT like '%"+content+"%'"; //sql 语句
        try {            
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            if (rs.next()) {
                n= rs.getInt(1);
			}
           	//将数据从结果集取出存入集合arraylist
          
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 
    	return n;
    }
    
    
    public int count_article_num(String LM,int SCID)//二级栏目下的文章个数
    {
    	int n = 0;//文章个数
	   
        String sql = "select count(*) from "+LM+" where ZLM=?"; //sql 语句
        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, SCID);
            rs = pstm.executeQuery();
            rs.next();
            n= rs.getInt(1);
           	//将数据从结果集取出存入集合arraylist
          
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 
    	return n;
    }
    
    
    @SuppressWarnings("rawtypes")
	public ArrayList<Map> select_all_list(int ID) {
     	ArrayList<Map> DB_data = null;
        //connection = getConnection();
        String sql = "select * from T_NRY where SFXS=1 AND SSLM=?"; //sql 语句

        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, ID);
            rs = pstm.executeQuery();
            DB_data=new ArrayList<Map>(); 
           	//将数据从结果集取出存入集合arraylist
           
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 
		return DB_data;
    } 
 
    public CachedRowSet search_data(String result) {
    	
    	String sql="select * from search_view "+"where BT like '%"+result+"%' ";
        //String sql = "select * from(select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_CJCJSDRH' as tname,19 as tid from Entity_CJCJSDRH UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_FAYRWS' as tname,5 as tid from Entity_FAYRWS UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_HYJY' as tname,6 as tid from Entity_HYJY UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'ENTITY_JSJD' as tname,10 as tid from ENTITY_JSJD UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_QHZHSYJY' as tname,16 as tid from Entity_QHZHSYJY UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_SHJXGG' as tname,17 as tid from Entity_SHJXGG UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_TSSZDWSP' as tname,20 as tid from Entity_TSSZDWSP UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_TZGG' as tname,9 as tid from Entity_TZGG UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_TJXXHJS' as tname,21 as tid from Entity_TJXXHJS UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_WSXXNBGL' as tname,22 as tid from Entity_WSXXNBGL UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_XXJL' as tname,7 as tid from Entity_XXJL UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_ZCXX' as tname,3 as tid from Entity_ZCXX UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_ZZJGXW' as tname,2 as tid from Entity_ZZJGXW UNION all select ID,BT,FBZ,FBSJ,YDCS,TSJSDT,ZW,ZLM,FJ,'Entity_GZJB' as tname,8 as tid from Entity_GZJB)" +" where BT like '%"+result+"%' "; //sql 语句
        try {            
            pstm = connection.prepareStatement(sql);
            rs = pstm.executeQuery();
            crs = new CachedRowSetImpl();
            crs.populate(rs);

     
           
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }
      
        
		return crs;
    }     



 
	public String[] select_menu_name(int ID) {
    	
    	String []temp=new String[2];
        String sql = "select LMMC,SJKBM from T_WZLM where ID=?"; //sql 语句

        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, ID);
            rs = pstm.executeQuery();
            while(rs.next()){
            	temp[0]=rs.getString(1);//获取栏目名
            	temp[1]=rs.getString(2);//获取数据库表名
            	
            }
           
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }
		return temp;
    }
    

	public void click_update(String tablename,int ID) {
		
		try {
			connection.setAutoCommit(false);
			try {
				
				CallableStatement callableStatement=connection.prepareCall("{call click_update(?,?)}");
				callableStatement.setString(1, tablename);
				callableStatement.setInt(2, ID);
				callableStatement.executeUpdate();
				
				connection.commit();
				
				
				callableStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			if (connection!=null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}finally{
        	ReleaseResource();
        }
		
    } 

    
    
 
    /**
     * 将resultset转换成arraylist
     * 
     * @return
     */
 	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static ArrayList<Map> resultSetToList(ResultSet rs) throws java.sql.SQLException {   
         if (rs == null)   
             return (ArrayList) Collections.EMPTY_LIST;   
         ResultSetMetaData md = rs.getMetaData(); //得到结果集(rs)的结构信息，比如字段数、字段名等   
         int columnCount = md.getColumnCount(); //返回此 ResultSet 对象中的列数   
         ArrayList<Map> list = new ArrayList();   
         Map rowData = new HashMap();   
         while (rs.next()) {   
          rowData = new HashMap(columnCount);   
          for (int i = 1; i <= columnCount; i++) {   
                  rowData.put(md.getColumnName(i), rs.getObject(i));   
          }   
          list.add(rowData);   
         // System.out.println("list:" + list.toString());   
         }   
         return list;   
 }

 	/**
 	 * 过父栏目ID提取所以二级栏目名称
 	 * @param columnID
 	 * @return
 	 */
 	public  CachedRowSet select_secondColumn(int columnID) 
 	{
 		
        String sql = "select * from Entity_EJLM where  SSLM=? order by ID asc"; 
        CachedRowSet crs = null;
        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, columnID);
            rs = pstm.executeQuery();
            crs = new CachedRowSetImpl();
            crs.populate(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }
		return crs;
    }
 	/**
 	 * 通过ID提取二级栏目名称
 	 * @param secondColumnID
 	 * @return
 	 */
 	public  String select_secondColumnName(int secondColumnID) 
 	{
 		String secondColumnName=null;
 		
        String sql = "select LMMC from Entity_EJLM where ID=?"; 
        //CachedRowSet crs = null;
        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, secondColumnID);
            rs = pstm.executeQuery();
            while(rs.next()){
            	secondColumnName=rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }
		return secondColumnName;
    }
    /**
     * 获取在数据表中最后一个id
     * @param db_name
     * @return
     */
    public int get_lastid(String db_name){
    	int id=0;
    	
        String sql = "select ID from "+db_name+" where rownum=1 order by ID desc"; 
        try {            
            pstm = connection.prepareStatement(sql);         
            rs = pstm.executeQuery();
            while(rs.next()){
            	id=rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	ReleaseResource();
        }
    	
		return id;
    	
    }
    /**
     * 将内容插入普通栏目
     * @param temp
     * @param id
     * @param file_src
     * @param db_name
     * @return
     */
    public boolean insert_article_NoTopImg(String []temp,int id,String db_name,int tableID) {
    	int returnNum = 0;
    	
        String sql1="select ID from Entity_EJLM where Entity_EJLM.LMMC=? and Entity_EJLM.SSLM=?";
        String sql2="select ID from tUser where tUser.NAME=?";
        String sql3 = "insert into "+db_name+" values(?,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?,?,?,?,?,?)"; 
        int lmid = 0;
        int userid = 0;
        try {            
            pstm = connection.prepareStatement(sql1);
            pstm.setString(1,temp[0]);
            pstm.setInt(2, tableID);
            rs = pstm.executeQuery();
            while (rs.next()) {
				lmid=rs.getInt(1);
			}
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        try {            
            pstm = connection.prepareStatement(sql2);
            pstm.setString(1,temp[1]);//获取发布者姓名
            rs = pstm.executeQuery();
            while (rs.next()) {
				userid=rs.getInt(1);
			}

        } catch (SQLException e) {
            e.printStackTrace();
        } 
        try {            
            pstm = connection.prepareStatement(sql3);
            pstm.setInt(1, id);
           // System.out.println(id);
            pstm.setString(2, temp[6]);
            pstm.setInt(3, userid);
            pstm.setString(4,temp[3]);
            pstm.setInt(5, 1);
            pstm.setInt(6,Integer.parseInt(temp[4]));
            pstm.setString(7, temp[8]);
            pstm.setInt(8, lmid);
            pstm.setString(9, temp[7]);
            pstm.setString(10, temp[2]);
            returnNum= pstm.executeUpdate();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 
        if (returnNum>0) {
        	return true;//插入成功
		}
        else{
        	return false;//插入失败
        } 
    }
    /**
     * 
     * 将内容插入到有置顶图片的栏目中
     * @param temp
     * @param id
     * @param file_src
     * @param db_name
     * @param img_src
     * @return
     */
    public boolean insert_article_haveTopImg(String []temp,int id,String db_name,String img_src,int tableID) {
    	int returnNum = 0;
    	
        String sql1="select ID from Entity_EJLM where Entity_EJLM.LMMC=? and Entity_EJLM.SSLM=?";
        String sql2="select ID from tUser where tUser.NAME=?";
        String sql3 = "insert into "+db_name+" values(?,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?,?,?,?,?,?,?,?,?)"; 
        int lmid = 0;
        int userid = 0;
        try {            
            pstm = connection.prepareStatement(sql1);
            pstm.setString(1,temp[0]);
            pstm.setInt(2, tableID);
            rs = pstm.executeQuery();
            while (rs.next()) {
				lmid=rs.getInt(1);
			}
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        try {            
            pstm = connection.prepareStatement(sql2);
            pstm.setString(1,temp[1]);//获取发布者姓名
            rs = pstm.executeQuery();
            while (rs.next()) {
				userid=rs.getInt(1);
			}

        } catch (SQLException e) {
            e.printStackTrace();
        } 
        try {            
            pstm = connection.prepareStatement(sql3);
            pstm.setInt(1, id);
           // System.out.println(id);
            pstm.setString(2, temp[7]);//标题
            pstm.setInt(3, userid);//作者ID
            pstm.setString(4,temp[3]);//发布时间
            pstm.setInt(5, 1);//阅读次数
            pstm.setInt(6,Integer.parseInt(temp[4]));//是否推送建设动态
            pstm.setString(7, temp[10]);//正文
            pstm.setInt(8, lmid);//栏目id
            pstm.setString(9, temp[9]);//附件
            pstm.setInt(10,Integer.parseInt(temp[6]));//图片是否置顶
            pstm.setString(11, img_src);//置顶图片地址
            pstm.setString(12, temp[8]);//摘要
            pstm.setString(13, temp[2]);//所属组织机构
            
            
            returnNum= pstm.executeUpdate();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        } 
        if (returnNum>0) {
        	return true;//插入成功
		}
        else{
        	return false;//插入失败
        } 
    }
    
    /**
     * 
     * 将内容插入滚动栏管理
     * @param id
     * @param NRYID
     * @param image_src
     * @param tableName
     * @param tableID
     * @param articleTittle
     * @return
     */
    public boolean insert_article_to_roll(int id,int NRYID,String image_src,String tableName,int tableID,String articleTittle) {
    	int returnNum=0;
    	
        String sql = "insert into Entity_GDLGL values(?,?,?,?,?,?,?)"; 
     
        try {            
            pstm = connection.prepareStatement(sql);
            pstm.setInt(1, id);//ID
            pstm.setString(2, articleTittle);//文章标题
            pstm.setString(3, tableName);//表名
            pstm.setInt(4, NRYID);//内容页ID
            pstm.setInt(5, tableID);//表ID
            pstm.setString(6, image_src);//滚动栏图片附件
            pstm.setInt(7, 0);
        
            
            returnNum= pstm.executeUpdate();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
        	ReleaseResource();
        }
        if (returnNum>0) {
        	return true;//插入成功
		}
        else{
        	return false;//插入失败
        } 
    }
    
 
    /**
     * 通过c3p0数据库连接池连接数据库
     * @return
     */
    
    public Connection getConnection() {
    	try {
			connection = C3P0ConnentionProvider.getConnection();//使用数据库连接池技术
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return connection;
    }
    /**
     * 释放result和preparment资源
     */
    public void ReleaseResource() {
        if (rs!= null) {
            try {
           	rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            rs=null;
        }
        if (pstm != null) {
            try {
                pstm.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            pstm=null;
        }
        /*if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            connection=null;
        }*/
    }
    /**
     * 释放connection资源
     * 
     */
    public void ReleaseConn() {
    	 if (connection != null) {
             try {
                 connection.close();
             } catch (SQLException e) {
                 e.printStackTrace();
             }
             connection=null;
         }
	}

}

