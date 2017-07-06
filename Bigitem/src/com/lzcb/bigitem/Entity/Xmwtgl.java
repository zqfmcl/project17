package com.lzcb.bigitem.Entity;

public class Xmwtgl {
	private int id;
	private int xmid;
	private String bt;
	private String wtms;
	private String wtqk;
	private String lxr;
	private String lxdh;
	private String syzt;
	private String xmmc;
	private String jsdwmc;
	private String plsj;
	private String lrsj;
	private String wdxx;//是否有未读信息
	private int lrr;//录入人用户id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getXmid() {
		return xmid;
	}
	public void setXmid(int xmid) {
		this.xmid = xmid;
	}
	public String getBt() {
		return bt;
	}
	public void setBt(String bt) {
		this.bt = bt;
	}
	public String getWtms() {
		return wtms;
	}
	public void setWtms(String wtms) {
		this.wtms = wtms;
	}
	public String getWtqk() {
		return wtqk;
	}
	public void setWtqk(String wtqk) {
		this.wtqk = wtqk;
	}
	public String getLxr() {
		return lxr;
	}
	public void setLxr(String lxr) {
		this.lxr = lxr;
	}
	public String getLxdh() {
		return lxdh;
	}
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	public String getSyzt() {
		return syzt;
	}
	public void setSyzt(String syzt) {
		this.syzt = syzt;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getJsdwmc() {
		return jsdwmc;
	}
	public void setJsdwmc(String jsdwmc) {
		this.jsdwmc = jsdwmc;
	}
	public String getPlsj() {
		return plsj;
	}
	public void setPlsj(String plsj) {
		this.plsj = plsj;
	}
	public String getLrsj() {
		return lrsj;
	}
	public void setLrsj(String lrsj) {
		this.lrsj = lrsj;
	}
	public String getWdxx() {
		return wdxx;
	}
	public void setWdxx(String wdxx) {
		this.wdxx = wdxx;
	}
	public int getLrr() {
		return lrr;
	}
	public void setLrr(int lrr) {
		this.lrr = lrr;
	}
	@Override
	public String toString() {
		return "Xmwtgl [id=" + id + ", xmid=" + xmid + ", bt=" + bt + ", wtms="
				+ wtms + ", wtqk=" + wtqk + ", lxr=" + lxr + ", lxdh=" + lxdh
				+ ", syzt=" + syzt + ", xmmc=" + xmmc + ", jsdwmc=" + jsdwmc
				+ ", plsj=" + plsj + ", lrsj=" + lrsj + ", wdxx=" + wdxx
				+ ", lrr=" + lrr + "]";
	}
}
