package org.fkit.model;

import java.io.Serializable;

public class User implements Serializable {
	private String UserId;
	private String Name;
	public User(){
		super();
	}
	public User(String userid,String name){
		super();
		this.Name=name;
		this.UserId=userid;
	}
	public void setUserId(String userid){
		this.UserId=userid;
	}
	public String getUserId(){
		return UserId;
	}
	public void setName(String name){
		this.Name=name;
	}
	public String getName(){
		return Name;
	}
	@Override
	public String toString(){
		return "User [UserId="+UserId+",Name="+Name+"]";
	}
	
}
