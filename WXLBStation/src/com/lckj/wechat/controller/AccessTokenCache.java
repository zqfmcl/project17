package com.lckj.wechat.controller;

import java.io.IOException;
import java.util.Date;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

/**
 * AccessToken缓存处理
 * @author 崔皓然 2017-3-14
 */

public class AccessTokenCache {
	//主动调用的access_token
	public static String access_token;
	//主动调用的请求时间
	public static Date access_token_date;
	//token的有效时间，默认7200，用于判断是否超时，考虑网络延迟是的减小
	public static long accessTokenInvalidTime=7200L;
	
	/**
	 * 
	 * @param corpId 企业号id
	 * @param corpsecret 管理组ID
	 * @return
	 */
	public static String getTokenFromWx(String corpId,String corpsecret){
		String token="";
		//判断当前已有access_token是否有效
		if(null==access_token||"".equals(access_token)||(new Date().getTime()-access_token_date.getTime())>=(accessTokenInvalidTime-200L)){
			//获取新的access_token
			CloseableHttpClient httpclient = HttpClients.createDefault();
			try{
				//创建httpget实例
				HttpGet httpget = new HttpGet("https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid="+corpId+"&corpsecret="+corpsecret);
				//创建响应函数
				ResponseHandler<JSONObject> response=new ResponseHandler<JSONObject>() {
					public JSONObject handleResponse(final HttpResponse response)throws ClientProtocolException,IOException{
						//获取请求返回状态
						int status=response.getStatusLine().getStatusCode();
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
							throw new ClientProtocolException("Unexpected response status: "+status);
						}
					}
				};
				//发送请求，并获取返回信息,其中httpget为请求内容，response为响应函数
				JSONObject responseBody=httpclient.execute(httpget,response);
				if(null!=responseBody&&null!=responseBody.get("access_token")){
					token=(String)responseBody.get("access_token");
					accessTokenInvalidTime=Long.valueOf(responseBody.get("exppires_in")+"");
					access_token=token;
					access_token_date=new Date();
				}
				httpclient.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else{
			token=access_token;
		}
		return token;
	}
}
