package com.lzcb.bigitem.Entity;

public class Juese {
	private int id;
	private String js_name;
	private String xt_name;
	private String js_jhzt;
	private String js_xtjsbz;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getJs_name() {
		return js_name;
	}
	public void setJs_name(String js_name) {
		this.js_name = js_name;
	}
	public String getXt_name() {
		return xt_name;
	}
	public void setXt_name(String xt_name) {
		this.xt_name = xt_name;
	}
	public String getJs_jhzt() {
		return js_jhzt;
	}
	public void setJs_jhzt(String js_jhzt) {
		this.js_jhzt = js_jhzt;
	}
	public String getJs_xtjsbz() {
		return js_xtjsbz;
	}
	public void setJs_xtjsbz(String js_xtjsbz) {
		this.js_xtjsbz = js_xtjsbz;
	}
	@Override
	public String toString() {
		return "Juese [id=" + id + ", js_name=" + js_name + ", xt_name="
				+ xt_name + ", js_jhzt=" + js_jhzt + ", js_xtjsbz=" + js_xtjsbz
				+ "]";
	}
}
