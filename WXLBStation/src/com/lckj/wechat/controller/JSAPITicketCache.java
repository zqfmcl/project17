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


public class JSAPITicketCache {
	public static String jsapi_ticket;
	public static Date jsapi_ticket_date;
	public static long jsapi_ticket_expires_in=7200L;
	public static String getJsapiTicketFromWx(String corpid,String corpsecret){
		String token=AccessTokenCache.getTokenFromWx(corpid, corpsecret);
		if(null==jsapi_ticket||"".equals(jsapi_ticket)||(new Date().getTime()-jsapi_ticket_date.getTime())>=(jsapi_ticket_expires_in-200)){
			CloseableHttpClient httpclient = HttpClients.createDefault();
			try{
				HttpGet httpget=new HttpGet("https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token="+token);
				ResponseHandler<JSONObject> responseHandler=new ResponseHandler<JSONObject>() {
					
					@Override
					public JSONObject handleResponse(final HttpResponse response)
							throws ClientProtocolException, IOException {
						int status =response.getStatusLine().getStatusCode();
						if(status>=200 && status<300){
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
				JSONObject responseBody=httpclient.execute(httpget, responseHandler);
				if(null!=responseBody){
					jsapi_ticket=(String)responseBody.get("ticket");
				}
				jsapi_ticket_date=new Date();
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
		return jsapi_ticket;
	}
}
