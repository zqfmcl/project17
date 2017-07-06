package com.lckj.wechat.entity;
/**
 * 
 * @author 崔皓然
 * create on 2017-3-14
 */
public abstract class ReqBaseMsg {
	protected String touser;
	protected String totag;
	protected String msgtype;
	protected String agentid;

	public abstract String toJsonStr();
}
