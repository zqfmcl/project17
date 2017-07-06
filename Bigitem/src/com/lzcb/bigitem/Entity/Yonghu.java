package com.lzcb.bigitem.Entity;

import java.util.Arrays;

public class Yonghu {
	private int id;
	private String userid;//登录账户
	private String username;//登录用户名
	private int bm_id;//部门id
	private String bm_name;//部门名称(数据库Tuser表中无此字段)
	private String bm_dm;//部门代码(数据库Tuser表中无此字段)
	private String email;//邮箱
	private String jhzt;//激活状态
	private String yhjs;//用户角色(数据库Tuser表中无此字段)
	private String password;//密码
	private String[] jsid;
	private int dq_id;
	private String dq_name;
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
	public String getBm_name() {
		return bm_name;
	}
	public void setBm_name(String bm_name) {
		this.bm_name = bm_name;
	}
	public String getBm_dm() {
		return bm_dm;
	}
	public void setBm_dm(String bm_dm) {
		this.bm_dm = bm_dm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJhzt() {
		return jhzt;
	}
	public void setJhzt(String jhzt) {
		this.jhzt = jhzt;
	}
	public String getYhjs() {
		return yhjs;
	}
	public void setYhjs(String yhjs) {
		this.yhjs = yhjs;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String[] getJsid() {
		return jsid;
	}
	public void setJsid(String[] jsid) {
		this.jsid = jsid;
	}
	public int getDq_id() {
		return dq_id;
	}
	public void setDq_id(int dq_id) {
		this.dq_id = dq_id;
	}
	public String getDq_name() {
		return dq_name;
	}
	public void setDq_name(String dq_name) {
		this.dq_name = dq_name;
	}
	@Override
	public String toString() {
		return "Yonghu [id=" + id + ", userid=" + userid + ", username="
				+ username + ", bm_id=" + bm_id + ", bm_name=" + bm_name
				+ ", bm_dm=" + bm_dm + ", email=" + email + ", jhzt=" + jhzt
				+ ", yhjs=" + yhjs + ", password=" + password + ", jsid="
				+ Arrays.toString(jsid) + ", dq_id=" + dq_id + ", dq_name="
				+ dq_name + "]";
	}
}
