package com.lzcb.bigitem.Entity;

public class Userjs {
	private int id;
	private int user_id;
	private int js_id;
	private String js_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getJs_id() {
		return js_id;
	}
	public void setJs_id(int js_id) {
		this.js_id = js_id;
	}
	public String getJs_name() {
		return js_name;
	}
	public void setJs_name(String js_name) {
		this.js_name = js_name;
	}
	@Override
	public String toString() {
		return "Userjs [id=" + id + ", user_id=" + user_id + ", js_id=" + js_id
				+ ", js_name=" + js_name + "]";
	}
}
