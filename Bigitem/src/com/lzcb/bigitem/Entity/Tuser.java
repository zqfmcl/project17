package com.lzcb.bigitem.Entity;

import java.util.Map;

public class Tuser {
	private int id;
	private String userid;
	private String username;
	private int bm_id;
	private String email;
	private String jhzt;
	private int js_id;
	private String password;
	private int dq_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getBm_id() {
		return bm_id;
	}
	public void setBm_id(int bm_id) {
		this.bm_id = bm_id;
	}
	public String getJhzt() {
		return jhzt;
	}
	public void setJhzt(String jhzt) {
		this.jhzt = jhzt;
	}
	public int getJs_id() {
		return js_id;
	}
	public void setJs_id(int js_id) {
		this.js_id = js_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getDq_id() {
		return dq_id;
	}
	public void setDq_id(int dq_id) {
		this.dq_id = dq_id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Tuser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Tuser(Map m) {
		super();
		if(m.containsKey("ID")&&m.get("ID")!=null)
			this.id=Integer.parseInt(m.get("ID").toString());
		if(m.containsKey("USERID")&&m.get("USERID")!=null)
			this.userid=m.get("USERID").toString();
		if(m.containsKey("USERNAME")&&m.get("USERNAME")!=null)
			this.username=m.get("USERNAME").toString();
		if(m.containsKey("BM_ID")&&m.get("BM_ID")!=null)
			this.bm_id=Integer.parseInt(m.get("BM_ID").toString());
		if(m.containsKey("EMAIL")&&m.get("EMAIL")!=null)
			this.email=m.get("EMAIL").toString();
		if(m.containsKey("JHZT")&&m.get("JHZT")!=null)
			this.jhzt=m.get("JHZT").toString();
		if(m.containsKey("JS_ID")&&m.get("JS_ID")!=null)
			this.js_id=Integer.parseInt(m.get("JS_ID").toString());
		if(m.containsKey("PASSWORD")&&m.get("PASSWORD")!=null)
			this.password=m.get("PASSWORD").toString();
		if(m.containsKey("DQ_ID")&&m.get("DQ_ID")!=null)
			this.dq_id=Integer.parseInt(m.get("DQ_ID").toString());
	}
	@Override
	public String toString() {
		return "Tuser [id=" + id + ", userid=" + userid + ", username="
				+ username + ", bm_id=" + bm_id + ", email=" + email
				+ ", jhzt=" + jhzt + ", js_id=" + js_id + ", password="
				+ password + ", dq_id=" + dq_id + "]";
	}
	
}
