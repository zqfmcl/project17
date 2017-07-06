package com.lzcb.bigitem.Entity;

import java.util.Arrays;
import java.util.List;

public class YonghuCondition {
	private int[] js_query;
	private String email_query;
	private String userid_query;
	private int bmid_query;
	private List<Integer> dq_idlist;
	public int[] getJs_query() {
		return js_query;
	}
	public void setJs_query(int[] js_query) {
		this.js_query = js_query;
	}
	public String getEmail_query() {
		return email_query;
	}
	public void setEmail_query(String email_query) {
		this.email_query = email_query;
	}
	public String getUserid_query() {
		return userid_query;
	}
	public void setUserid_query(String userid_query) {
		this.userid_query = userid_query;
	}
	public int getBmid_query() {
		return bmid_query;
	}
	public void setBmid_query(int bmid_query) {
		this.bmid_query = bmid_query;
	}
	public List<Integer> getDq_idlist() {
		return dq_idlist;
	}
	public void setDq_idlist(List<Integer> dq_idlist) {
		this.dq_idlist = dq_idlist;
	}
	@Override
	public String toString() {
		return "YonghuCondition [js_query=" + Arrays.toString(js_query)
				+ ", email_query=" + email_query + ", userid_query="
				+ userid_query + ", bmid_query=" + bmid_query + ", dq_idlist="
				+ dq_idlist + "]";
	}
	
}
