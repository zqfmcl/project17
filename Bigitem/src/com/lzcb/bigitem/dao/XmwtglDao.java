package com.lzcb.bigitem.dao;

import java.util.List;

import com.lzcb.bigitem.Entity.Xmwtgl;

public interface XmwtglDao {
	public void addXmwt(Xmwtgl xmwt);//申报项目问题
	public List<Xmwtgl> findXmwt(List<Integer> dqlist,int now,int recp);//查询项目问题申报情况
	public void updateXmwt(Xmwtgl xmwt);//更新
	public void deleteXmwt(int id);//删除
	public void SyXmwt(int id);//审阅项目问题,更改审阅状态
	public Xmwtgl findXmwtById(int id);
	public Xmwtgl findXmwtById1(int id,int now,int recp);
	public List<Xmwtgl> findXmxxByDqId(List<Integer> dqlist);//通过地区信息查询项目id和项目名称
	public List<Xmwtgl> findXmwtByLrrId(int userid);//根据当前操作人来查询项目问题
	public List<Xmwtgl> findXmwtByLrrId1(int userid,int now,int recp);
}
