package com.lckj.bx.controler;

import java.io.IOException;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.lckj.wechat.controller.AccessTokenCache;
import com.lckj.wechat.util.WxHelper;
/**
 * 微信消息处理类
 * @author 崔皓然
 * create on 2017-3-30
 */
public class WxNoticeSend {
	/**
	 * 发送提醒
	 * @param jsonContext
	 * @return
	 */
	public boolean sendNotice(String jsonContext){
		JSONObject jsono = sendReqMsg(jsonContext, WxHelper.CORPID, WxHelper.RESP_MSG_SECRET);
		if("0".equals(jsono.get("errcode")))return true;
		else{
			//生成日志
		}
		return false;
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
}
