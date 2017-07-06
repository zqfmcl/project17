package school.date.NRYtransform;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;

public class Tool {
	 static int y,m,d,h,mi,s;
	 public static String getNowtime(){
		 Calendar cal=Calendar.getInstance();
		 y=cal.get(Calendar.YEAR);
		 m=cal.get(Calendar.MONTH)+1;
		 d=cal.get(Calendar.DATE);
		 h=cal.get(Calendar.HOUR_OF_DAY);
		 mi=cal.get(Calendar.MINUTE);
		 s=cal.get(Calendar.SECOND);
		return ""+y+m+d+h+mi+s;
	 }
	 public static String Return_img_src(String temp){
			int i=-1;
		   	i=temp.indexOf("images");
		   	if (i==-1) {
		   		return null;
			}
		   	else {
		   	   return temp.substring(temp.indexOf("images/")+7, temp.indexOf("jpg", temp.indexOf("images/"))+3);
			}
	}
	 public static String Return_replace_img_src(String temp,String bashpath){
			int i=-1;
		   	i=temp.indexOf("images");
		   	if (i==-1) {
		   		return temp;
			}
		   	else {
		   		return temp.replace("/technical_school/uploads/images", bashpath+"/technical_school/uploads/images");

			}
	}
	 public static String swfShow_First(String content) throws UnsupportedEncodingException {
			if(content.contains("<p><object")){
			 	String pathtemp=content.substring(content.indexOf("src=\"/technical_school/")+23,content.indexOf("\" type"));
			 	String part1="<div id=\"documentViewer\" class=\"flexpaper_viewer\" style=\"width:100%;height:1000px\"></div><script type=\"text/javascript\"> var startDocument = \"Paper\";$('#documentViewer').FlexPaperViewer({ config : {SWFFile : '";
			 	String part2="',Scale : 3,ZoomTransition : 'easeOut',ZoomTime : 0.5,ZoomInterval : 0.2,FitPageOnLoad : true,FitWidthOnLoad : false,FullScreenAsMaxWindow : false,ProgressiveLoading : false,MinZoomSize : 0.2,MaxZoomSize : 5,SearchMatchAll : false,InitViewMode : 'Portrait',RenderingOrder : 'flash', StartAtPage : '',ViewModeToolsVisible : true, ZoomToolsVisible : true,NavToolsVisible : true, CursorToolsVisible : true,SearchToolsVisible : true,WMode : 'window',localeChain: 'en_US'}});</script>";
			 	content=part1+pathtemp+part2;
			}

			return content;
	}
	 public static String swfShow_Second(String content) throws UnsupportedEncodingException{
		 StringBuffer buffer=new StringBuffer(content);		 
		 if(content.contains("<object")){
			 if (content.contains("height")) {
					int i=content.indexOf("height", content.indexOf("<embed"));
					content=buffer.replace(i+8, content.indexOf("\"",i+8), "1000").toString();
				 }
				 else {
					content=buffer.insert(content.indexOf("<embed")+7,"height=\"1000\" ").toString();
				}
				if (content.contains("width")) {
						int i=content.indexOf("width", content.indexOf("<embed"));
						content=buffer.replace(i+7, content.indexOf("\"",i+7), "100%").toString();
				 }
				else {
						content=buffer.insert(content.indexOf("<embed")+7,"width=\"100%\" ").toString();
				}
		 }
		
		return content;
	}
}
