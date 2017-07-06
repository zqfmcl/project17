package com.lzcb.bigitem.Entity;

public class Diqu {
	private int id;
	private String dq_name;
	private int sjjd_dm;
	private int pxh;
	private String bz;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDq_name() {
		return dq_name;
	}
	public void setDq_name(String dq_name) {
		this.dq_name = dq_name;
	}
	public int getSjjd_dm() {
		return sjjd_dm;
	}
	public void setSjjd_dm(int sjjd_dm) {
		this.sjjd_dm = sjjd_dm;
	}
	public int getPxh() {
		return pxh;
	}
	public void setPxh(int pxh) {
		this.pxh = pxh;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	@Override
	public String toString() {
		return "Diqu [id=" + id + ", dq_name=" + dq_name + ", sjjd_dm="
				+ sjjd_dm + ", pxh=" + pxh + ", bz=" + bz + "]";
	}

}
