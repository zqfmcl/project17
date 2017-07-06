package com.lzcb.bigitem.Entity;

public class PageBean {
	int firstPage;//首页
	int prePage;//上一页
	int nextPage;//下一页 	
	int totalPage;//末页(总页数)
	int currentPage;//当前页
	int totalCount;//总记录数
	int pageSize;//每页显示记录数
	public int getFirstPage() {
		return 1;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getPrePage() {
		return this.getCurrentPage() == this
				.getFirstPage() ? 1 : this.getCurrentPage() - 1;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return this.getCurrentPage() ==this
				.getTotalPage() ? this.getCurrentPage() : this
				.getCurrentPage()+1;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotalPage() {
		return this.getTotalCount() % this.getPageSize() == 0 ? this
				.getTotalCount() / this.getPageSize()
				: this.getTotalCount() / this.getPageSize() + 1;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	@Override
	public String toString() {
		return "PageBean [firstPage=" + firstPage + ", prePage=" + prePage
				+ ", nextPage=" + nextPage + ", totalPage=" + totalPage
				+ ", currentPage=" + currentPage + ", totalCount=" + totalCount
				+ ", pageSize=" + pageSize + "]";
	}
}
