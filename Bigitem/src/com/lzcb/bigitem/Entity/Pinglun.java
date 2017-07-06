package com.lzcb.bigitem.Entity;

public class Pinglun {
	private int id;//该条评论id
	private int wtid;//问题id
	private int plrid;//评论人id
	private String plnr;//评论内容
	private String pltime;//评论时间
	private int bplr;//被回复的人id
	private String isck;//被回复这是否查看
	private int twr;//问题提问人id
	private String lzck;//问题提出人是否查看
	private int plcs;
	private String plrname;
	private String bplrname;
	private String twrname;
	private String plrjs;//评论人角色
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getWtid() {
		return wtid;
	}
	public void setWtid(int wtid) {
		this.wtid = wtid;
	}
	public int getPlrid() {
		return plrid;
	}
	public void setPlrid(int plrid) {
		this.plrid = plrid;
	}
	public String getPlnr() {
		return plnr;
	}
	public void setPlnr(String plnr) {
		this.plnr = plnr;
	}
	public String getPltime() {
		return pltime;
	}
	public void setPltime(String pltime) {
		this.pltime = pltime;
	}
	public int getBplr() {
		return bplr;
	}
	public void setBplr(int bplr) {
		this.bplr = bplr;
	}
	public String getIsck() {
		return isck;
	}
	public void setIsck(String isck) {
		this.isck = isck;
	}
	public int getTwr() {
		return twr;
	}
	public void setTwr(int twr) {
		this.twr = twr;
	}
	public String getLzck() {
		return lzck;
	}
	public void setLzck(String lzck) {
		this.lzck = lzck;
	}
	public int getPlcs() {
		return plcs;
	}
	public void setPlcs(int plcs) {
		this.plcs = plcs;
	}
	public String getPlrname() {
		return plrname;
	}
	public void setPlrname(String plrname) {
		this.plrname = plrname;
	}
	public String getBplrname() {
		return bplrname;
	}
	public void setBplrname(String bplrname) {
		this.bplrname = bplrname;
	}
	public String getTwrname() {
		return twrname;
	}
	public void setTwrname(String twrname) {
		this.twrname = twrname;
	}
	public String getPlrjs() {
		return plrjs;
	}
	public void setPlrjs(String plrjs) {
		this.plrjs = plrjs;
	}
	@Override
	public String toString() {
		return "Pinglun [id=" + id + ", wtid=" + wtid + ", plrid=" + plrid
				+ ", plnr=" + plnr + ", pltime=" + pltime + ", bplr=" + bplr
				+ ", isck=" + isck + ", twr=" + twr + ", lzck=" + lzck
				+ ", plcs=" + plcs + ", plrname=" + plrname + ", bplrname="
				+ bplrname + ", twrname=" + twrname + ", plrjs=" + plrjs + "]";
	}
}
