package com.lckj.wechat.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


import com.lckj.wechat.util.WxHelper;

public class HelloJSAPI {
	public static void main(String[] args) {
		String jsapi_ticket=JSAPITicketCache.getJsapiTicketFromWx(WxHelper.CORPID, WxHelper.RESP_MSG_SECRET);
		for(Map.Entry<String, String> e:sign(jsapi_ticket,"http://lckj.nat123.cc/WXLBStation/JSP/index.jsp").entrySet()){
			System.out.println(e.getKey()+" "+e.getValue());
		}
	}
	/**
	 * 微信js签名
	 * @param jsapi_ticket
	 * @param url
	 * @return
	 */
	public static Map<String ,String> sign(String jsapi_ticket,String url){
		Map<String, String> ret=new HashMap<String,String>();
		String nonce_str=create_nonce_str();
		String timestamp=create_timestamp();
		String string1;
		String signature="";
		string1 ="jsapi_ticket="+jsapi_ticket+
				"&noncestr="+nonce_str+
				"&timestamp="+timestamp+
				"&url="+url;
		try{
			MessageDigest crypt=MessageDigest.getInstance("SHA-1");
			crypt.reset();
			crypt.update(string1.getBytes("UTF-8"));
			signature=byteToHex(crypt.digest());
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();// TODO: handle exception
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();// TODO: handle exception
		}
		ret.put("url", url);
		ret.put("jsapi_ticket", jsapi_ticket);
		ret.put("nonceStr", nonce_str);
		ret.put("timestamp", timestamp);
		ret.put("signature", signature);
		return ret;
	}
	
	private static String byteToHex(final byte[] hash){
		Formatter formatter=new Formatter();
		for(byte b:hash){
			formatter.format("%02x", b);
		}
		String result=formatter.toString();
		formatter.close();
		return result;
	}
	/**
	 * 生成nonce随机数
	 * @return
	 */
	private static String create_nonce_str(){
		return UUID.randomUUID().toString();
	}
	/**
	 * 生成时间戳
	 * @return
	 */
	private static String create_timestamp(){
		return Long.toString(System.currentTimeMillis()/1000);
	}
}
