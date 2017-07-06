package com.lzcb.bigitem.dao;

import java.util.List;

import com.lzcb.bigitem.Entity.Pinglun;

public interface PinglunDao {
	public void addPinglun(Pinglun pl);//添加评论信息
	public List<Pinglun> findAllPinglun(int wtid);//根据问题id查询所有评论
	public void updateTwrck(int wtid,int twrid);//更新提问人查看状态
	public void updateBplrck(int wtid,int bplr);//更新被评论人查看状态
	public int isckPinglun(int wtid,int bplr);//被评论人是否有未查看评论,返回评论数
	public int lzckPinglun(int wtid,int twrid);//问题提出者是否有回复
}
