package com.lckj.wechat.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.Date;

import javax.jms.TextMessage;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import net.sf.json.JSONObject;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.lckj.wechat.entity.RespTextMsg;
import com.lckj.wechat.util.WXBizMsgCrypt;
import com.lckj.wechat.util.WxHelper;

/**
 * 微信回调信息处理函数
 * @author hrcui 2017-3-14
 *
 */
public class WxInfoDeal {
	public static String processRequest(HttpServletRequest request,HttpServletResponse response){
		//微信加密签名
		String sReqMsgSig=request.getParameter("msg_signature");
		//时间戳
		String sReqTimeStamp=request.getParameter("timestamp");
		//随机数
		String sReqNonce=request.getParameter("nonce");
		//企业号配置参数
		String sToken=WxHelper.RESP_MSG_TOKEN;
		String sCorpID=WxHelper.CORPID;
		String sEncodingAESKey=WxHelper.RESP_MSG_EncodingAESKey;
		try {
			//接受信息，通过输入流获取密文数据
			ServletInputStream in=request.getInputStream();
			BufferedReader reader=new BufferedReader(new InputStreamReader(in));
			String sReqData="";
			String itemStr="";
			while(null!=(itemStr=reader.readLine())){
				sReqData+=itemStr;
			}
			//解密获取明文
			WXBizMsgCrypt wxcpt=new WXBizMsgCrypt(sToken,sEncodingAESKey,sCorpID);
			String sMsg=wxcpt.DecryptMsg(sReqMsgSig, sReqTimeStamp, sReqNonce, sReqData);
			
			System.out.println(sMsg);
			
			//处理xml
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			DocumentBuilder db=dbf.newDocumentBuilder();
			StringReader sr=new StringReader(sMsg);
			InputSource is=new InputSource(sr);
			//生成doc
			Document doc=db.parse(is);
			//生成root节点
			Element root=doc.getDocumentElement();
			//获取MsgType
			NodeList nodelist_msgType=root.getElementsByTagName("MsgType");
			String recieveMsgType=nodelist_msgType.item(0).getTextContent();
			String content="";
			if("text".equals(recieveMsgType)){
				NodeList nodelist_msgcontent=root.getElementsByTagName("Content");
				String reqcontent=nodelist_msgcontent.item(0).getTextContent();
				JSONObject tulingsay=JSONObject.fromObject(TulingAPI.tuLingJiqiren(reqcontent));
				content=tulingsay.getString("text");
			}else if("location".equals(recieveMsgType)){
				//aaa
			}else if("event".equals(recieveMsgType)){
				NodeList nodelist_eventType=root.getElementsByTagName("Event");
				String eventType=nodelist_eventType.item(0).getTextContent();
				NodeList nodelist_eventKey=root.getElementsByTagName("EventKey");
				String eventKey=nodelist_eventKey.item(0).getTextContent();
				System.out.println("你"+eventType+"了"+eventKey);
			}
			//获取信息发送用户
			NodeList nodelist_fromUser=root.getElementsByTagName("FromUserName");
			String createuser=nodelist_fromUser.item(0).getTextContent();
			//生成时间戳
			String time=new Date().getTime()+"";
			String msg_type="text";
			//生成返回消息xml明文
			RespTextMsg tmsg=new RespTextMsg(createuser, sCorpID, Long.valueOf(time), msg_type, content);
			String sRespData=tmsg.toXMLStr();
			//生成返回消息
			String sEncryptMsg=wxcpt.EncryptMsg(sRespData, time, sReqNonce);
			PrintWriter out =response.getWriter();
			out.write(sEncryptMsg);
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}
}
