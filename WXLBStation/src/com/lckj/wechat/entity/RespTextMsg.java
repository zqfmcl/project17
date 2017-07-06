package com.lckj.wechat.entity;
/**
 * 
 * @author 崔皓然
 * create on 2017-3-15
 */
public class RespTextMsg extends RespBaseMsg {
	public String content;
	
	public RespTextMsg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RespTextMsg(String userid,String corpid,long createtime,String msgtype,String content){
		this.userID=userid;
		this.corpID=corpid;
		this.createTime=createtime;
		this.MsgType=msgtype;
		this.content=content;
	}
	@Override
	public String toXMLStr() {
		String XMLStr="<xml>"+
				"<ToUserName><![CDATA["+this.userID+"]]></ToUserName>"+
				"<FromUserName><![CDATA["+this.corpID+"]]></FromUserName>" +
				"<CreateTime>"+this.createTime+"</CreateTime>"+
				"<MsgType><![CDATA["+this.MsgType+"]]></MsgType>"+
				"<Content><![CDATA["+this.content+"]]></Content>"+
				"</xml>";
		return XMLStr;
	}

}
