package org.fkit.model;

import java.io.Serializable;
//System.out.println("sessionid:"+loginResult.getSessionId()+"result:"+loginResult.getResult()+"message:"+loginResult.getMessage());
public class LoginWS implements Serializable {
	private String sessionid;
	private Integer result;
	private String message;
	public LoginWS(){
		super();
	}
	public LoginWS(String sessionid,Integer result,String message){
		super();
		this.message=message;
		this.sessionid=sessionid;
		this.result=result;
	}
	public String getSessionid(){
		return sessionid;
	}
	public void setSessionid(String sessioned){
		this.sessionid=sessionid;
	}
	public Integer getResult(){
		return result;
	}
	public void setResult(Integer result){
		this.result=result;
	}
	public String getMessage(){
		return message;
	}
	public void setMessage(String message){
		this.message=message;
	}
	@Override
	public String toString(){
		return "LoginWS [sessionid="+sessionid+",result="+result+",message="+message+"]";
	}
}
