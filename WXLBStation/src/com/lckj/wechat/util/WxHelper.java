package com.lckj.wechat.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.rmi.AccessException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.lckj.wechat.controller.AccessTokenCache;

public class WxHelper {
	//企业号配置信息
	public static String CORPID="wx9e6b5f7e6b9f86a2";
	public static String RESP_MSG_TOKEN="0L05Kz3mMhgJQWzEmmMvnH";
	public static String RESP_MSG_SECRET="vsKgDKA-m4wDlZCRfkv33FgJIuIz07xnX8Cv43pykKZ-D1BYcUiou0Pn7hH6bRmi";
	public static String RESP_MSG_EncodingAESKey="avM7pACaJ4XJsoWdNcxGyPTNTIcHnANObwuNzxSDO5R";
	//消息类型
	public static String MSG_TYPE_TEXT="text";
	public static String MSG_TYPE_IMAGE="image";
	public static String MSG_TYPE_VOICE="voice";
	public static String MSG_TYPE_VIDEO="video";
	public static String MSG_TYPE_FILE="file";
	public static String MSG_TYPE_NEWS="news";
	public static String MSG_TYPE_MPNEWS="mpnews";
	
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
	
	public static String getUserIdByCode(String code){
		String token=AccessTokenCache.getTokenFromWx(CORPID, RESP_MSG_SECRET);
		try{
			CloseableHttpClient httpclient=HttpClients.createDefault();
			HttpPost httpPost=new HttpPost("https://qyapi.weixin.qq.com/cgi-bin/"+"user/getuserinfo?access_token="+token+"&code="+code);
			ResponseHandler<JSONObject> responseHandler =new ResponseHandler<JSONObject>() {
				
				@Override
				public JSONObject handleResponse(final HttpResponse response)
						throws ClientProtocolException, IOException {
					int status =response.getStatusLine().getStatusCode();
					if(status>=200&&status<300){
						HttpEntity entity=response.getEntity();
						if(null!=entity){
							String result=EntityUtils.toString(entity);
							JSONObject resultObj=JSONObject.fromObject(result);
							return resultObj;
						}else{
							return null;
						}
					}else{
						throw new ClientProtocolException("Unexcepected status:"+status);
					}
				}
			};
			JSONObject responseBody=httpclient.execute(httpPost,responseHandler);
			if(null==responseBody.getString("UserId")){
				return null;
			}else{
				return responseBody.getString("UserId");
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
			return null;
		}
	}
	public static JSONObject getInfoByUserId(String userId){
		CloseableHttpClient httpclient=HttpClients.createDefault();
		String token=AccessTokenCache.getTokenFromWx(CORPID, RESP_MSG_SECRET);
		try {
			HttpGet httpget=new HttpGet("https://qyapi.weixin.qq.com/cgi-bin/user/get?access_token="+token+"&userid="+userId);
			ResponseHandler<JSONObject> responsehandler=new ResponseHandler<JSONObject>() {
				
				@Override
				public JSONObject handleResponse(final HttpResponse response)
						throws ClientProtocolException, IOException {
					int status=response.getStatusLine().getStatusCode();
					if(status>=200&&status<300){
						HttpEntity entity=response.getEntity();
						if(null!=entity){
							String result=EntityUtils.toString(entity);
							JSONObject resultobj=JSONObject.fromObject(result);
							return resultobj;
						}else return null;
					}else {
						throw new ClientProtocolException("Unexpected response status "+status);
					}
				}
			};
			JSONObject responseBody=httpclient.execute(httpget,responsehandler);
			httpclient.close();
			return responseBody;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
			return null;
		}
	}
	/**
	 * @param url get请求地址
	 * @return json格式的字符串
	 */
	public static String httpHelperbyGet(String url){
		CloseableHttpClient httpclient=HttpClients.createDefault();
		try {
			HttpGet httpget=new HttpGet(url);
			ResponseHandler<String> responsehandler=new ResponseHandler<String>() {
				
				@Override
				public String handleResponse(final HttpResponse response)
						throws ClientProtocolException, IOException {
					int status=response.getStatusLine().getStatusCode();
					if(status>=200&&status<300){
						HttpEntity entity=response.getEntity();
						if(null!=entity){
							String result=EntityUtils.toString(entity);
							return result;
						}else return null;
					}else {
						throw new ClientProtocolException("Unexpected response status "+status);
					}
				}
			};
			String responseBody=httpclient.execute(httpget,responsehandler);
			httpclient.close();
			return responseBody;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @param url post请求地址
	 * @return json格式的字符串
	 */
	public static String httpHelperbyPost(String url){
		CloseableHttpClient httpclient=HttpClients.createDefault();
		try {
			HttpPost httppost=new HttpPost(url);
			ResponseHandler<String> responsehandler=new ResponseHandler<String>() {
				
				@Override
				public String handleResponse(final HttpResponse response)
						throws ClientProtocolException, IOException {
					int status=response.getStatusLine().getStatusCode();
					if(status>=200&&status<300){
						HttpEntity entity=response.getEntity();
						if(null!=entity){
							String result=EntityUtils.toString(entity);
							return result;
						}else return null;
					}else {
						throw new ClientProtocolException("Unexpected response status "+status);
					}
				}
			};
			String responseBody=httpclient.execute(httppost,responsehandler);
			httpclient.close();
			return responseBody;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 实现oauth用户身份验证
	 * @param request 
	 * @param response
	 * @return 返回用户身份信息，或openid或错误信息
	 */
	public static JSONObject OAuth(HttpServletRequest request, HttpServletResponse response){
		//动态生成请求地址
		HttpSession session=request.getSession();
		String requestUrl=request.getRequestURL().toString();
		if(request.getQueryString()!=null){
			requestUrl+="?"+request.getQueryString().split("#")[0];
		}
//		System.out.println("requestUrl:"+requestUrl);
		try {
			//无code处理，获取code
			if(request.getParameter("code")==null||"".equals(request.getParameter("code"))){
				String url="https://open.weixin.qq.com/connect/oauth2/authorize?" +
						"appid="+CORPID+"&redirect_uri="+URLEncoder.encode(requestUrl, "utf-8")+"&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
//				System.out.println("no-code-url:"+url);
				response.sendRedirect(url);
			}else{
				//有code
				String code=request.getParameter("code");
				if(session.getAttribute(code)!=null&&"1".equals(session.getAttribute(code).toString())){
					return null;
				}
				session.setAttribute(code, "1");
				String url="https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token="+AccessTokenCache.getTokenFromWx(CORPID, RESP_MSG_SECRET)+"&code="+code;
//				System.out.println("code-url:"+url);
				JSONObject responseBody=JSONObject.fromObject(httpHelperbyGet(url));
				//判断是否为企业号用户
				if(responseBody.containsKey("UserId")){
//					System.out.println("retrun userid");
					Map<String ,Cookie>map=ReadCookieMap(request);
					//判断是否有cookie
					if(map.containsKey("WxToken")){
						Cookie wxtoken=map.get("WxToken");
						String userInfo=URLDecoder.decode(wxtoken.getValue(), "utf-8");
						JSONObject userInfojson=JSONObject.fromObject(userInfo);
						if(responseBody.get("UserId").equals(userInfojson.get("userid"))){
//							System.out.println("return from cookie");
							return userInfojson;
						}
					}
					//添加cookie记录
					url="https://qyapi.weixin.qq.com/cgi-bin/user/get?access_token="+AccessTokenCache.getTokenFromWx(CORPID, RESP_MSG_SECRET)+"&userid="+responseBody.get("UserId");
					JSONObject responseInfo=JSONObject.fromObject(httpHelperbyGet(url));
					Cookie wxtoken=new Cookie("WxToken", URLEncoder.encode(responseInfo.toString(), "utf-8"));
					wxtoken.setMaxAge(3600*5);
					response.addCookie(wxtoken);
//					System.out.println("return from url");
					return responseInfo;
				}else{
					return responseBody;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
	/**
	 * 将cookie集封装到map
	 * @param request
	 * @return
	 */
	public static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){  
	    Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
	    Cookie[] cookies = request.getCookies();
	    if(null!=cookies){
	        for(Cookie cookie : cookies){
//	        	System.out.println(cookie.getName());
	            cookieMap.put(cookie.getName(), cookie);
	        }
	    }
	    return cookieMap;
	}
}
