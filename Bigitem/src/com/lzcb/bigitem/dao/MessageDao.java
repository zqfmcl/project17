package com.lzcb.bigitem.dao;

public interface MessageDao {
	public void updateReason(int xmid);//更新项目回退否决原因状态为已读
	public void updateXmShzt(int xmid);//更新项目审核状态为待审核
	public void updateDdHtReason(int ddid);//更新调度回退原因为已读
	public void updateDdFjReason(int ddid);//更新调度否决原因为已读
	public void updateDdShzt(int ddid);
}
