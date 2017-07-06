package com.lckj.wechat.entity;
/**
 * 
 * @author 崔皓然
 * create on 2017-3-15
 */
public abstract class RespBaseMsg {
	protected String userID;
	protected String corpID;
	protected long createTime;
	protected String MsgType;
	
	public abstract String toXMLStr();
}
