<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<% 
	String string="工业示范学校";//网站名称
	int MAX_WIDTH=1200;//网页内容最大宽度
	String T_NRY="T_NRY";
	int T_HYJY=6;//会议纪要。
	int T_ZZJG=2;//组织机构。
	int T_ZCXX=3;//政策信息。
	int T_JSDT=4;//建设动态。
	int T_FAYRWS=5;//方案与任务书。
	int T_JSJD=10;//建设进度。
	int T_XXJL=7;//学习交流。
	int T_GZJB=8;//工作简报。
	int T_TZGG=9;//通知公告。
	
	int T_QHZHSYJY=16;//强化综合素养教育
	int T_SHJXGG=17;//深化教学改革
	int T_CJCJSDRH=19;//促进产教深度融合
	int T_TSSZDWSP=20;//提升师资队伍水平
	int T_TTXXHJS=21;//推进信息化建设
	
	int T_WSXXNBGL=22;//完善学校内部管理
	
	int T_WHJSMS=23;//文化管理模式
	int T_XSZYSZYC=24;//学生职业素质养成
	int Page_size=8;//分页行数最大值
	int onecolumn_size=7;//首页一个栏目文章数最大值
	int Page_num;//总分页个数
	int All_article_num;//单页显示文章最大值
	int Now_Page_ID;//当前页面ID默认为1
	

%>

