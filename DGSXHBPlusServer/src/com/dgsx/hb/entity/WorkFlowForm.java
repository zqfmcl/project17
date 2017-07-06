package com.dgsx.hb.entity;

import java.util.Map;

public class WorkFlowForm {
	private String id;
	private String instid;
	private Map parms;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInstid() {
		return instid;
	}
	public void setInstid(String instid) {
		this.instid = instid;
	}
	public Map getParms() {
		return parms;
	}
	public void setParms(Map parms) {
		this.parms = parms;
	}
	
}
