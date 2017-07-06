package school.convert;

import java.io.UnsupportedEncodingException;

public class Convert {
	public static String utf_gbk(String data){
		String string = null;
		try {
			 string=new String(data.getBytes("UTF-8"), "gb2312");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return string;
		
	}
	
	public static String iso_utf(String data){
		String string = null;
		try {
			 string=new String(data.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return string;
		
	}

}
