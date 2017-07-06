package com.lzcb.bigitem.Entity;

public class Department {
	private int id;
	private String bm_name;
	private String bm_dm;
	private int bm_pxh;
	private String sjbh;
	private int bm_sjjd;
	private String bm_zdbh;
	private String bm_bz;
	private String bm_longname;
	
	@Override
	public String toString() {
		return "Department [id=" + id + ", bm_name=" + bm_name + ", bm_dm="
				+ bm_dm + ", bm_pxh=" + bm_pxh + ", sjbh=" + sjbh
				+ ", bm_sjjd=" + bm_sjjd + ", bm_zdbh=" + bm_zdbh + ", bm_bz="
				+ bm_bz + ", bm_longname=" + bm_longname + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getBm_pxh() {
		return bm_pxh;
	}
	public void setBm_pxh(int bm_pxh) {
		this.bm_pxh = bm_pxh;
	}
	public String getSjbh() {
		return sjbh;
	}
	public void setSjbh(String sjbh) {
		this.sjbh = sjbh;
	}
	public int getBm_sjjd() {
		return bm_sjjd;
	}
	public void setBm_sjjd(int bm_sjjd) {
		this.bm_sjjd = bm_sjjd;
	}
	public String getBm_zdbh() {
		return bm_zdbh;
	}
	public void setBm_zdbh(String bm_zdbh) {
		this.bm_zdbh = bm_zdbh;
	}
	public String getBm_bz() {
		return bm_bz;
	}
	public void setBm_bz(String bm_bz) {
		this.bm_bz = bm_bz;
	}
	public String getBm_longname() {
		return bm_longname;
	}
	public void setBm_longname(String bm_longname) {
		this.bm_longname = bm_longname;
	}
}
