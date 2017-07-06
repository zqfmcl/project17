package com.lckj.wechat.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * 
 * @author 崔皓然
 * create on 2017-3-14
 */

public class TulingAPI {
	public static void main(String[] args) throws Exception {
		tuLingJiqiren("hello!");
	}
	/**
	 * 
	 * @param str 发送内容
	 * @return	回答
	 * @throws Exception
	 */
	public static String tuLingJiqiren(String str) throws Exception{  
        String APIKEY = "ffde77df707242a58be7a2e459b6c4ad";   
        String INFO = URLEncoder.encode(str, "utf-8");   
        String getURL = "http://www.tuling123.com/openapi/api?key=" + APIKEY + "&info=" + INFO;   
        URL getUrl = new URL(getURL);   
        HttpURLConnection connection = (HttpURLConnection) getUrl.openConnection();   
        connection.connect();   
  
        // 取得输入流，并使用Reader读取   
        BufferedReader reader = new BufferedReader(new InputStreamReader( connection.getInputStream(), "utf-8"));  
        StringBuffer sb = new StringBuffer();   
        String line = "";   
        while ((line = reader.readLine()) != null) {   
            sb.append(line);   
        }   
        reader.close();   
        // 断开连接   
        connection.disconnect();   
//        System.out.println(sb);   
        return sb+"";  
    }
}
