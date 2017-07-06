package com.lzcb.bigitem.dao;

/**
 * version 
 * 
 * 
 */
import com.lzcb.bigitem.utils.DbHelper;

public class MessageDaoImpl implements MessageDao {
	@Override
	/**
	 * 
	 * 这是用来跟新原因的 函数
	 * @param xmid 原因所在项目的id
	 * @return 没有返回值
	 *
	 */
	public void updateReason(int xmid) {
		// TODO Auto-generated method stub
		String sql="update BI_REASON set ISCK='T' where xmid="+xmid;
		DbHelper.update(sql);
	}
	/**
	 * 
	 * 这是用来跟新项目审核的 函数
	 * @param xmid 原因所在项目的id
	 * @return 没有返回值
	 *
	 */
	@Override
	public void updateXmShzt(int xmid) {
		// TODO Auto-generated method stub
		String sql="update BI_XMXX set SHBZ=null where id="+xmid;
		DbHelper.update(sql);
	}
	/**
	 * 
	 * 这是用来阿萨德三大因的 函数
	 * @param ddid 原因所在项目的id
	 * @return 没有返回值
	 *
	 */
	@Override
	public void updateDdHtReason(int ddid) {
		// TODO Auto-generated method stub
		String sql="update BI_REASON set ISCK='T' where type=2 and ddid="+ddid;
		DbHelper.update(sql);
	}
	/**
	 * 
	 * 这是用来阿萨德撒因的 函数
	 * @param ddid 原因所在项目的id
	 * @return 没有返回值
	 *
	 */
	@Override
	public void updateDdShzt(int ddid) {
		// TODO Auto-generated method stub
		String sql="update BI_XMDDGL set SHBS=null where id="+ddid;
		DbHelper.update(sql);
	}

	@Override
	public void updateDdFjReason(int ddid) {
		// TODO Auto-generated method stub
		String sql="update BI_REASON set ISCK='T' where type=1 and ddid="+ddid;
		DbHelper.update(sql);
	}

}
