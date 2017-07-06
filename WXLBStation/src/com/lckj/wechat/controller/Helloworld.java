package com.lckj.wechat.controller;

import java.io.IOException;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
/**
 * 
 * @author hrcui 2017-3-14
 *
 */

public class Helloworld {
	private static String corpId="wx9e6b5f7e6b9f86a2";
	private static String corpsecret="vsKgDKA-m4wDlZCRfkv33FgJIuIz07xnX8Cv43pykKZ-D1BYcUiou0Pn7hH6bRmi";
	public static void main(String[] args) {
		Helloworld helloWorld =new Helloworld();
		
		String jsonContext="{" +
				"\"touser\":\"hrcui\"," +
				"\"toparty\":\"\"," +
				"\"msgtype\":\"text\"," +
				"\"agentid\":4," +
				"\"text\":{" +
				"\"content\":\"lckj,helloworld!!!\"}," +
				"\"safe\":0}";
		helloWorld.sendReqMsg(jsonContext, corpId, corpsecret);
		
//		String createMenuStr="{ \"button\":[ {\"type\":\"click\",\"name\":\"菜单功能\",\"key\":\"TION\"}," +
//				"{\"name\":\"一级菜单\",\"sub_button\":[{\"type\":\"view\",\"name\":\"博客\",\"url\":\"http://www.baidu.com\"}," +
//				"{\"type\":\"click\",\"name\":\"二级菜单最多多少个字\",\"key\":\"KEY1\"}]}]}";
//		helloWorld.createMenu(createMenuStr, 4+"");
	}
	
	
	/**
	 * 发消息
	 * @param jsonContext json字符串
	 * @param corpId 微信企业号标识
	 * @param corpsecret 管理组凭证秘钥
	 * @return
	 * */
	public JSONObject sendReqMsg(String jsonContext,String corpId,String corpsecret){
		JSONObject result=null;
//		String token=getTokenFromWx(corpId,corpsecret);
		//带缓存获取accessToken
		String token=AccessTokenCache.getTokenFromWx(corpId, corpsecret);
		System.out.println(token);
		try{
			CloseableHttpClient httpclient=HttpClients.createDefault();
			HttpPost httpPost=new HttpPost("https://qyapi.weixin.qq.com"+"/cgi-bin/message/send?access_token="+token);
			StringEntity myEntity=new StringEntity(jsonContext,ContentType.create("text/plain", "UTF-8"));
			httpPost.setEntity(myEntity);
			ResponseHandler<JSONObject> responseHandler=new ResponseHandler<JSONObject>() {
				public JSONObject handleResponse(final HttpResponse response)throws ClientProtocolException,IOException{
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
						throw new ClientProtocolException("Unexpected response status: "+status);
					}
				}
			};
			JSONObject responseBody=httpclient.execute(httpPost,responseHandler);
			System.out.println(responseBody.toString());
			result=responseBody;
			httpclient.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	public boolean createMenu(String menuStr,String agentId){
		boolean flag=false;
		String token=AccessTokenCache.getTokenFromWx(corpId, corpsecret);
		try{
			CloseableHttpClient httpclient=HttpClients.createDefault();
			HttpPost httpPost=new HttpPost("https://qyapi.weixin.qq.com"+"/cgi-bin/menu/create?access_token="+token+"&agentId="+agentId);
			StringEntity myEntity=new StringEntity(menuStr,ContentType.create("text/plain", "UTF-8"));
			httpPost.setEntity(myEntity);
			ResponseHandler<JSONObject> responseHandler=new ResponseHandler<JSONObject>() {
				public JSONObject handleResponse(final HttpResponse response)throws ClientProtocolException,IOException{
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
						throw new ClientProtocolException("Unexpected response status: "+status);
					}
				}
			};
			JSONObject responseBody=httpclient.execute(httpPost,responseHandler);
			System.out.println(responseBody.toString());
			httpclient.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
}
